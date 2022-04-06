package com.SpringBootApp.A.CinemaProject.repository;

import com.SpringBootApp.A.CinemaProject.entity.movieEntity;
import org.springframework.data.repository.CrudRepository;
import java.util.Optional;

public interface movieRepository extends CrudRepository<movieEntity, Long> {
    movieEntity findById(long movie_id);

    movieEntity findByTitle(String title);

}