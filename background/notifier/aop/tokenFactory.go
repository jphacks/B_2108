package aop

import (
	"github.com/golang-jwt/jwt"
	"time"
)

var HmacSecret []byte

func TokenFactory(uid int) (string, error) {
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{
		"uid": uid,
		"nbf": time.Now().Unix(),
	})

	tokenString, err := token.SignedString(HmacSecret)
	if err != nil {
		return "", err
	}

	return tokenString, nil
}
