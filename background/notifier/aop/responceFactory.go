package aop

import "background/proto/notifierDefine"

func RegisterResponseFactory(message string) *notifierDefine.RegisterResponse {
	return &notifierDefine.RegisterResponse{
		Message: message,
	}
}

func NotifierResponseFactory(message string) *notifierDefine.NotifierResponse {
	return &notifierDefine.NotifierResponse{
		Message: message,
	}
}
