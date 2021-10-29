package middlewares

import (
	"background/notifier/aop"
	"context"
	"github.com/golang-jwt/jwt"
	grpc_auth "github.com/grpc-ecosystem/go-grpc-middleware/auth"
)

func Authenticate(ctx context.Context) (context.Context, error) {
	tokenString, err := grpc_auth.AuthFromMD(ctx, "Bearer")
	if err != nil {
		return nil, err
	}

	token, err := jwt.Parse(tokenString, func(token *jwt.Token) (interface{}, error) {
		if _, ok := token.Method.(*jwt.SigningMethodHMAC); !ok {
			return nil, err
		}

		// hmacSampleSecret is a []byte containing your secret, e.g. []byte("my_secret_key")
		return aop.HmacSecret, nil
	})

	if _, ok := token.Claims.(jwt.MapClaims); ok && token.Valid {
		return ctx, nil
	} else {
		return nil, err
	}
}
