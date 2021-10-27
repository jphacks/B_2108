package services

import (
	"background/notifier/aop"
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

func (*NotifierService) RegisterPost(ctx context.Context, request *notifierDefine.RegisterRequest) (*notifierDefine.RegisterResponse, error) {
	db, err := aop.Connection(url)
	if err != nil {
		log.Println(err)
		return aop.RegisterResponseFactory("Failed to connect db"), err
	}

	if err := repositories.Insert(ctx, db, &models.Post{
		Apartment: request.GetApartmentName(),
		Room:      int(request.GetRoom()),
	}); err != nil {
		log.Println(err)
		return aop.RegisterResponseFactory("Failed to insert infos"), err
	}

	return aop.RegisterResponseFactory("Succeed to insert infos"), nil
}

func (*NotifierService) Notifier(ctx context.Context, request *notifierDefine.NotifierRequest) (*notifierDefine.NotifierResponse, error) {
	room := request.GetRoom()
	name := request.GetApartmentName()

	db, e := aop.Connection(url)
	if e != nil {
		return aop.NotifierResponseFactory("failed to connect database"), e
	}

	post, err := repositories.Select(ctx, db, name, int(room))
	if err != nil {
		return aop.NotifierResponseFactory("Failed to search post"), err
	}

	log.Println(post)
	post.State = aop.MysqlBool(true)

	if err := repositories.Update(ctx, db, post); err != nil {
		return aop.NotifierResponseFactory("failed to insert data"), err
	}
	result := fmt.Sprintf("%v, %d", codes.OK, room)

	return aop.NotifierResponseFactory(result), nil
}

func (*NotifierService) Push(request *notifierDefine.PushRequest, server notifierDefine.NotifierService_PushServer) error {
	room := request.GetRoom()
	apartment := request.GetApartmentName()

	db, err := aop.Connection(url)
	if err != nil {
		return err
	}
	for {
		entity, err := repositories.Select(context.Background(), db, apartment, int(room))
		if err != nil {
			return err
		}

		if entity.State == aop.MysqlBool(true) {
			if err := server.Send(&notifierDefine.PushReply{Flag: true}); err != nil {
				return err
			}

			entity.State = aop.MysqlBool(false)
			if err := repositories.Update(context.Background(), db, entity); err != nil {
				return err
			}
		} else {
			continue
		}
	}
}
