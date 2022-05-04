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
                    "WHERE shows.local_Date = ?1 " +
                    "AND (shows.local_Time <= ?2 AND shows.end_time >= ?2 " +
                    "OR shows.local_time <= ?3 AND shows.end_time >= ?3)",
            nativeQuery = true
    )
    Collection<showEntity> findAllConflictingShows(LocalDate date, LocalTime time, LocalTime endtime);

    showEntity findByLocalDateAndLocalTime(LocalDate date, LocalTime time);
}
