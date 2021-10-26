package repositories

import (
	"background/notifier/models"
	"context"
	"database/sql"
	"github.com/volatiletech/sqlboiler/v4/boil"
	"log"
)

func Insert(ctx context.Context, db *sql.DB, post *models.Post) error {
	err := post.Insert(ctx, db, boil.Infer())
	if err != nil {
		return err
	}
	return nil
}

func Update(ctx context.Context, db *sql.DB, post *models.Post) error {
	_, err := post.Update(ctx, db, boil.Infer())
	if err != nil {
		log.Println(err)
		return err
	}
	return nil
}

func Select(ctx context.Context, db *sql.DB, apartment string, room int) (*models.Post, error) {
	post, err := models.Posts(
		models.PostWhere.Apartment.EQ(apartment),
		models.PostWhere.Room.EQ(room),
	).One(ctx, db)
	if err != nil {
		log.Println(err)
		return &models.Post{}, err
	}
	return post, nil
}
