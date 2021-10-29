package aop

import "background/proto/notifierDefine"

func RegisterResponseFactory(uid int, apartment string, room int, token string) *notifierDefine.RegisterResponse {
	return &notifierDefine.RegisterResponse{
		Uid:           int32(uid),
		ApartmentName: apartment,
		RoomNumber:    int32(room),
		Token:         token,
	}
}

func NotifierResponseFactory(message string) *notifierDefine.NotifierResponse {
	return &notifierDefine.NotifierResponse{
		Message: message,
	}
}

func LoginResponseFactory(uid int, apartment string, room int, token string) *notifierDefine.LoginResponse {
	return &notifierDefine.LoginResponse{
		Uid:           int32(uid),
		ApartmentName: apartment,
		RoomNumber:    int32(room),
		Token:         token,
	}
}

func HistoryResponseFactory(data []string) *notifierDefine.HistoryResponse {
	return &notifierDefine.HistoryResponse{
		History: data,
	}
}
