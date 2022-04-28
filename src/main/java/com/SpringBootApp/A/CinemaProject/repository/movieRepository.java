package com.SpringBootApp.A.CinemaProject.repository;

import com.SpringBootApp.A.CinemaProject.entity.movieEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.Collection;
import java.util.Optional;

public interface movieRepository extends CrudRepository<movieEntity, Long> {
    movieEntity findById(long movie_id);

    Collection<movieEntity> findByTitleContainingIgnoreCase(String title);

    movieEntity findByTitle(String title);

    @Query(
            value = "SELECT * FROM movies " +
                    "WHERE movies.movie_id IN (" +
                    "   SELECT shows.movie_id" +
                    "   FROM shows" +
                    "   WHERE shows.local_Date = CURRENT_DATE)",
            nativeQuery = true
    )
    Collection<movieEntity> findAllPlayingMovies();

    @Query(
            value = "SELECT * FROM movies " +
                    "WHERE movies.movie_id IN (" +
                    "   SELECT shows.movie_id" +
                    "   FROM shows" +
                    "   WHERE shows.local_Date > CURRENT_DATE)",
            nativeQuery = true
    )
    Collection<movieEntity> findAllUpcomingMovies();



    Collection<movieEntity> findAllByTitle(String title);

    Collection<movieEntity> findAllByCategory(String category);
}