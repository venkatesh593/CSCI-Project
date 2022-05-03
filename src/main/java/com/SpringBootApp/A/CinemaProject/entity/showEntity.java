package com.SpringBootApp.A.CinemaProject.entity;

import javax.persistence.*;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;


@Entity
@Table(name="Shows")
public class showEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long show_id;

    private LocalDate localDate;
    private LocalTime localTime;
    private LocalTime endTime;

    @ManyToOne
    @JoinColumn(name = "movie_id")
    private movieEntity movie;

    @OneToOne
    @JoinColumn(name = "showroom_id")
    private showroomEntity showroom;

    public long getShow_id() {
        return show_id;
    }

    public void setShow_id(long show_id) {
        this.show_id = show_id;
    }

    public LocalDate getLocalDate() {
        return localDate;
    }

    public void setLocalDate(LocalDate localDate) {
        this.localDate = localDate;
    }

    public LocalTime getLocalTime() {
        return localTime;
    }

    public void setLocalTime(LocalTime localTime) {
        this.localTime = localTime;
    }

    public movieEntity getMovie() {
        return movie;
    }

    public void setMovie(movieEntity movie) {
        this.movie = movie;
    }

    public LocalTime getEndTime() {
        return endTime;
    }

    public void setEndTime(LocalTime endTime) {
        this.endTime = endTime;
    }

    public showroomEntity getShowroom() {
        return showroom;
    }

    public void setShowroom(showroomEntity showroom) {
        this.showroom = showroom;
    }

}
