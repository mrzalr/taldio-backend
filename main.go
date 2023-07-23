package main

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"strings"

	"github.com/go-chi/chi/v5"
	"github.com/go-chi/chi/v5/middleware"
	"github.com/go-chi/cors"

	_ "github.com/go-sql-driver/mysql"
)

type Jobs struct {
	ID                   int    `json:"id"`
	Title                string `json:"title"`
	Level                string `json:"level"`
	Type                 string `json:"type"`
	Jobdesc              string `json:"jobdesc"`
	MinimumQualification string `json:"minimum_qualification"`
	MinimumExperience    string `json:"minimum_experience"`
	Skills               string `json:"skills"`
	Benefit              string `json:"benefits"`
}

func connectDB() (*sql.DB, error) {
	return sql.Open("mysql", "root:@tcp(localhost:3306)/taldio_backend")
}

func main() {
	db, err := connectDB()
	if err != nil {
		log.Fatal(err)
	}

	r := chi.NewRouter()

	c := cors.New(cors.Options{
		AllowedOrigins: []string{"*"},
	})

	r.Use(middleware.Logger)
	r.Use(c.Handler)

	r.Route("/api/v1/", func(r chi.Router) {
		r.Route("/jobs", func(r chi.Router) {
			r.Get("/{id}", func(w http.ResponseWriter, r *http.Request) {
				r.Header.Set("Content-Type", "application/json")
				id := chi.URLParam(r, "id")

				jobs, err := getJobByID(db, id)
				if err != nil {
					w.Write([]byte(
						fmt.Sprintf(`{"message":"%v"}`, err),
					))
					return
				}

				jobJson, err := json.Marshal(jobs)
				if err != nil {
					w.Write([]byte(
						fmt.Sprintf(`{"message":"%v"}`, err),
					))
					return
				}

				w.Write(jobJson)
			})

			r.Get("/", func(w http.ResponseWriter, r *http.Request) {
				r.Header.Set("Content-Type", "application/json")
				typeQuery := r.URL.Query().Get("type")
				levelQuery := r.URL.Query().Get("level")

				jobs, err := getJobs(db, filter{
					jobTypes: strings.Split(typeQuery, ","),
					levels:   strings.Split(levelQuery, ","),
				})
				if err != nil {
					w.Write([]byte(
						fmt.Sprintf(`{"message":"%v"}`, err),
					))
					return
				}

				jobJson, err := json.Marshal(jobs)
				if err != nil {
					w.Write([]byte(
						fmt.Sprintf(`{"message":"%v"}`, err),
					))
					return
				}

				w.Write(jobJson)
			})
		})
	})

	log.Fatal(http.ListenAndServe(":8080", r))
}

func getJobByID(db *sql.DB, id string) (Jobs, error) {
	job := Jobs{}
	query := "SELECT id, title, level, type, jobdesc, minimum_qualification, minimum_experience, skills, benefits FROM jobs WHERE id = ?"
	err := db.
		QueryRow(query, id).
		Scan(&job.ID,
			&job.Title,
			&job.Level,
			&job.Type,
			&job.Jobdesc,
			&job.MinimumQualification,
			&job.MinimumExperience,
			&job.Skills,
			&job.Benefit,
		)

	return job, err
}

type filter struct {
	jobTypes []string
	levels   []string
}

func getJobs(db *sql.DB, f filter) ([]Jobs, error) {
	jobs := []Jobs{}
	query := "SELECT id, title, level, type, jobdesc, minimum_qualification, minimum_experience, skills, benefits FROM jobs WHERE true"
	args := []interface{}{}

	if f.jobTypes[0] != "" {
		placeholders := []string{}
		for i := 0; i < len(f.jobTypes); i++ {
			placeholders = append(placeholders, "?")
			args = append(args, f.jobTypes[i])
		}

		query += " AND type IN(" + strings.Join(placeholders, ",") + ")"
	}

	if f.levels[0] != "" {
		placeholders := []string{}
		for i := 0; i < len(f.levels); i++ {
			placeholders = append(placeholders, "?")
			args = append(args, f.levels[i])
		}

		query += " AND level IN(" + strings.Join(placeholders, ",") + ")"
	}

	row, err := db.Query(query, args...)
	if err != nil {
		return jobs, err
	}

	for row.Next() {
		job := Jobs{}
		err := row.Scan(
			&job.ID,
			&job.Title,
			&job.Level,
			&job.Type,
			&job.Jobdesc,
			&job.MinimumQualification,
			&job.MinimumExperience,
			&job.Skills,
			&job.Benefit,
		)

		if err != nil {
			return jobs, err
		}

		jobs = append(jobs, job)
	}

	return jobs, nil
}
