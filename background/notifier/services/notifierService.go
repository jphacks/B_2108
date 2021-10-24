package services

import (
	"background/proto/notifierDefine"
	"context"
	"encoding/json"
	"fmt"
	"google.golang.org/grpc/codes"
)

type NotifierService struct {
	notifierDefine.UnimplementedNotifierServiceServer
}

func (*NotifierService) Notifier(ctx context.Context, request *notifierDefine.NotifierRequest) (*notifierDefine.NotifierResponse, error) {
	roomNumber := request.GetRoomNumber()
	flag := request.GetFlag()

	result := map[codes.Code]string{
		codes.OK: fmt.Sprintf("%d, %d", roomNumber, flag),
	}

	bytes, err := json.Marshal(result)
	if err != nil {
		return nil, err
	}

	return &notifierDefine.NotifierResponse{
		Message: string(bytes),
	}, nil
}
