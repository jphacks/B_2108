package services

import (
	"background/proto/notifierDefine"
	"context"
	"fmt"
	"google.golang.org/grpc/codes"
)

type NotifierService struct {
	notifierDefine.UnimplementedNotifierServiceServer
}

func (*NotifierService) Notifier(ctx context.Context, request *notifierDefine.NotifierRequest) (*notifierDefine.NotifierResponse, error) {
	room := request.GetRoom()

	result := fmt.Sprintf("%v, %d", codes.OK, room)

	return &notifierDefine.NotifierResponse{
		Message: result,
	}, nil
}
