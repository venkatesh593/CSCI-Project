package com.SpringBootApp.A.CinemaProject.repository;

import com.SpringBootApp.A.CinemaProject.entity.movieEntity;
import com.SpringBootApp.A.CinemaProject.entity.showEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.time.LocalDate;
import java.time.LocalTime;

public interface showRepository extends CrudRepository<showEntity, Long> {
    showEntity findByMovie(movieEntity movie);

    boolean existsByLocalDateAndLocalTime(LocalDate date, LocalTime time);
}
