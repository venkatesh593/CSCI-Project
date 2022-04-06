package com.SpringBootApp.A.CinemaProject.entity;
import javax.persistence.*;
import java.time.LocalDate;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name="movies")
public class movieEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long movie_id;

    private String title;
    private double duration;
    private String category;
    private String filmRating;
    private String cast;
    private String director;
    private String producer;
    private String synopsis;
    private String reviews;
    private String trailerPicture;
    private String trailerVideo;

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTitle(){
        return this.title;
    }


    public void setCategory(String category) {
        this.category = category;
    }

    public String getCategory(){
        return this.category;
    }


    public void setDuration(double duration) {
        this.duration = duration;
    }

    public double getDuration(){
        return this.duration;
    }

    public void setFilmRating(String filmRating) {
        this.filmRating = filmRating;
    }

    public String getFilmRating(){
        return this.filmRating;
    }

    public void setCast(String cast) {
        this.cast = cast;
    }

    public String getCast(){
        return this.cast;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getDirector(){
        return this.director;
    }

    public void setProducer(String producer) {
        this.producer = producer;
    }

    public String getProducer(){
        return this.producer;
    }

    public void setSynopsis(String synopsis) {
        this.synopsis = synopsis;
    }

    public String getSynopsis(){
        return this.synopsis;
    }

    public void setReviews(String reviews) {
        this.reviews = reviews;
    }

    public String getReviews(){
        return this.reviews;
    }

    public void setTrailerPicture(String trailerPicture) {
        this.trailerPicture = trailerPicture;
    }

    public String getTrailerPicture(){
        return this.trailerPicture;
    }

    public void setTrailerVideo(String trailerVideo) {
        this.trailerVideo = trailerVideo;
    }

    public String getTrailerVideo(){
        return this.trailerVideo;
    }




    public void setMovie_id(long movie_id) {
        this.movie_id = movie_id;
    }

    public long getMovie_id() {
        return movie_id;
    }
}