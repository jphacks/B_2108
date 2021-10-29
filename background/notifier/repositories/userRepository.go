package repositories

import (
	"background/notifier/models"
	"context"
	"database/sql"
	"github.com/volatiletech/sqlboiler/v4/boil"
)

func UserInsert(ctx context.Context, db *sql.DB, user *models.User) error {
	if err := user.Insert(ctx, db, boil.Infer()); err != nil {
		return err
	}
	return nil
}

func UserSelect(ctx context.Context, db *sql.DB, email string) (*models.User, error) {
	user, err := models.Users(models.UserWhere.Email.EQ(email)).One(ctx, db)
	if err != nil {
		return &models.User{}, err
	}
	return user, nil
}
