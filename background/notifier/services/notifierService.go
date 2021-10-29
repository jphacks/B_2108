package services

import (
	"background/notifier/aop"
	"background/notifier/middlewares"
	"background/notifier/models"
	"background/notifier/repositories"
	"background/proto/notifierDefine"
	"context"
	"fmt"
	"google.golang.org/grpc/codes"
	"log"
	"os"
)

var url = os.Getenv("MYSQL_URL")

type NotifierService struct {
	notifierDefine.UnimplementedNotifierServiceServer
}

func (*NotifierService) AuthFuncOverride(ctx context.Context, fullMethodName string) (context.Context, error) {
	switch fullMethodName {
	case "/notifierDefine.NotifierService/RegisterPost":
		return ctx, nil
	case "/notifierDefine.NotifierService/Login":
		return ctx, nil
	case "/notifierDefine.NotifierService/Notifier":
		return ctx, nil
	}

	ctx2, err := middlewares.Authenticate(ctx)
	if err != nil {
		return nil, err
	}
	return ctx2, nil
}

func (*NotifierService) RegisterPost(ctx context.Context, request *notifierDefine.RegisterRequest) (*notifierDefine.RegisterResponse, error) {
	db, err := aop.Connection(url)
	if err != nil {
		log.Println(err)
		return nil, err
	}

	encode, err := aop.Encode(request.GetPassword())
	if err != nil {
		return nil, err
	}

	user := models.User{
		Username:   request.GetUserName(),
		Email:      request.GetEmail(),
		Password:   encode,
		Apartment:  request.GetApartmentName(),
		RoomNumber: int(request.GetRoomNumber()),
	}

	if err := repositories.UserInsert(ctx, db, &user); err != nil {
		return nil, err
	}

	userSelect, err := repositories.UserSelect(ctx, db, request.Email)
	if err != nil {
		return nil, err
	}

	if err := repositories.PostInsert(ctx, db, &models.Post{
		MachineID: int(request.MachineID),
		UserID:    userSelect.ID,
	}); err != nil {
		log.Println(err)
		return nil, err
	}

	token, err := aop.TokenFactory(userSelect.ID)
	if err != nil {
		return nil, err
	}

	return aop.RegisterResponseFactory(userSelect.ID, userSelect.Username, userSelect.RoomNumber, token), nil
}

func (*NotifierService) Login(ctx context.Context, request *notifierDefine.LoginRequest) (*notifierDefine.LoginResponse, error) {
	db, err := aop.Connection(url)
	if err != nil {
		log.Println(err)
		return nil, err
	}

	email := request.GetEmail()
	password := request.GetPassword()
	userSelect, err := repositories.UserSelect(ctx, db, email)
	if err != nil {
		return nil, err
	}

	if err := aop.Compare(password, userSelect.Password); err != nil {
		return nil, err
	}

	token, err := aop.TokenFactory(userSelect.ID)
	if err != nil {
		return nil, err
	}

	return aop.LoginResponseFactory(userSelect.ID, userSelect.Apartment, userSelect.RoomNumber, token), nil
}

func (*NotifierService) Notifier(ctx context.Context, request *notifierDefine.NotifierRequest) (*notifierDefine.NotifierResponse, error) {
	machineID := request.GetMachineID()

	db, e := aop.Connection(url)
	if e != nil {
		return aop.NotifierResponseFactory("failed to connect database"), e
	}

	post, err := repositories.PostSelect(ctx, db, -1, int(machineID))
	if err != nil {
		return aop.NotifierResponseFactory("Failed to search post"), err
	}

	log.Println(post)
	post.State = aop.MysqlBool(true)

	if err := repositories.PostUpdate(ctx, db, post); err != nil {
		return aop.NotifierResponseFactory("failed to insert data"), err
	}

	history := models.History{
		UserID: post.UserID,
	}

	if err := repositories.HistoryInsert(ctx, db, &history); err != nil {
		return nil, err
	}

	result := fmt.Sprintf("%v, %d", codes.OK, machineID)

	return aop.NotifierResponseFactory(result), nil
}

func (*NotifierService) Push(request *notifierDefine.PushRequest, server notifierDefine.NotifierService_PushServer) error {
	uid := request.GetUid()

	db, err := aop.Connection(url)
	if err != nil {
		return err
	}
	for {
		entity, err := repositories.PostSelect(context.Background(), db, int(uid), -1)
		if err != nil {
			return err
		}

		if entity.State == aop.MysqlBool(true) {
			if err := server.Send(&notifierDefine.PushReply{Flag: true}); err != nil {
				return err
			}

			entity.State = aop.MysqlBool(false)
			if err := repositories.PostUpdate(context.Background(), db, entity); err != nil {
				return err
			}
		} else {
			continue
		}
	}
}

func (*NotifierService) GetHistory(ctx context.Context, request *notifierDefine.HistoryRequest) (*notifierDefine.HistoryResponse, error) {
	uid := request.GetUid()

	db, err := aop.Connection(url)
	if err != nil {
		return nil, err
	}

	historySlice, err := repositories.HistorySelect(ctx, db, int(uid))
	if err != nil {
		return nil, err
	}

	var result []string

	for _, v := range historySlice {
		result = append(result, v.CreateTime.Time.String())
	}

	return aop.HistoryResponseFactory(result), nil
}
