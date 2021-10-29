package repositories

import (
	"background/notifier/models"
	"context"
	"database/sql"
	"github.com/volatiletech/sqlboiler/v4/boil"
	"log"
)

func PostInsert(ctx context.Context, db *sql.DB, post *models.Post) error {
	err := post.Insert(ctx, db, boil.Infer())
	if err != nil {
		return err
	}
	return nil
}

func PostUpdate(ctx context.Context, db *sql.DB, post *models.Post) error {
	_, err := post.Update(ctx, db, boil.Infer())
	if err != nil {
		log.Println(err)
		return err
	}
	return nil
}

func PostSelect(ctx context.Context, db *sql.DB, uid int, machineID int) (*models.Post, error) {
	if uid != -1 {
		post, err := models.Posts(
			models.PostWhere.UserID.EQ(uid),
		).One(ctx, db)
		if err != nil {
			log.Println(err)
			return &models.Post{}, err
		}
		return post, nil
	} else {
		post, err := models.Posts(
			models.PostWhere.MachineID.EQ(machineID),
		).One(ctx, db)
		if err != nil {
			return nil, err
		}
		return post, nil
	}
}
