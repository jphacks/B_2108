package main

import (
	"background/notifier/services"
	"background/proto/notifierDefine"
	grpc_middleware "github.com/grpc-ecosystem/go-grpc-middleware"
	grpc_zap "github.com/grpc-ecosystem/go-grpc-middleware/logging/zap"
	grpc_ctxtags "github.com/grpc-ecosystem/go-grpc-middleware/tags"
	"go.uber.org/zap"
	"go.uber.org/zap/zapcore"
	"google.golang.org/grpc"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/reflection"
	"log"
	"net"
)

const addr = "127.0.0.1:8080"

func main() {
	listen, err := net.Listen("tcp", addr)
	if err != nil {
		log.Fatalln(err)
	}

	production, err := zap.NewProduction()
	if err != nil {
		log.Fatalln(err)
	}

	zapOpt := grpc_zap.WithLevels(func(code codes.Code) zapcore.Level {
		var level zapcore.Level
		switch code {
		case codes.OK:
			level = zapcore.InfoLevel
		case codes.Internal:
			level = zapcore.ErrorLevel
		default:
			level = zapcore.DebugLevel
		}
		return level
	})

	var opts []grpc.ServerOption
	opts = append(opts, grpc_middleware.WithUnaryServerChain(
		grpc_ctxtags.UnaryServerInterceptor(),
		grpc_zap.UnaryServerInterceptor(production, zapOpt)))

	server := grpc.NewServer(opts...)

	notifierDefine.RegisterNotifierServiceServer(server, &services.NotifierService{})
	log.Println("Waiting for request ....")
	log.Println("------------------------")

	reflection.Register(server)
	if e := server.Serve(listen); e != nil {
		log.Fatalln(e)
	}
}
