package com.SpringBootApp.A.CinemaProject.repository;

import com.SpringBootApp.A.CinemaProject.entity.movieEntity;
import com.SpringBootApp.A.CinemaProject.entity.showEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Collection;

public interface showRepository extends CrudRepository<showEntity, Long> {
    showEntity findByMovie(movieEntity movie);

    boolean existsByLocalDateAndLocalTime(LocalDate date, LocalTime time);

    @Query(
            value = "SELECT * FROM shows " +
                    "WHERE shows.localDate == :date && "+
                    "shows.localTime == :time",
            nativeQuery = true
    )
    Collection<showEntity> findAllConflictingShows(@Param("date")LocalDate date, @Param("time")LocalTime time);
}
