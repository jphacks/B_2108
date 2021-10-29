package repositories

import (
	"background/notifier/models"
	"context"
	"database/sql"
	"github.com/volatiletech/sqlboiler/v4/boil"
)

func HistorySelect(ctx context.Context, db *sql.DB, uid int) (models.HistorySlice, error) {
	historySlice, err := models.Histories(
		models.HistoryWhere.UserID.EQ(uid),
	).All(ctx, db)
	if err != nil {
		return nil, err
	}
	return historySlice, nil
}

func HistoryInsert(ctx context.Context, db *sql.DB, history *models.History) error {
	if err := history.Insert(ctx, db, boil.Infer()); err != nil {
		return err
	}
	return nil
}
