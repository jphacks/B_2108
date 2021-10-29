package aop

import "golang.org/x/crypto/bcrypt"

func Encode(password string) (string, error) {
	hash, err := bcrypt.GenerateFromPassword([]byte(password), 3)
	if err != nil {
		return "", err
	}
	return string(hash), nil
}

func Compare(password string, encodedPassword string) error {
	err := bcrypt.CompareHashAndPassword([]byte(encodedPassword), []byte(password))
	return err
}
