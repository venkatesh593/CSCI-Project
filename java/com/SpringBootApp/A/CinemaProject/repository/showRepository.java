package com.SpringBootApp.A.CinemaProject.repository;

import com.SpringBootApp.A.CinemaProject.entity.movieEntity;
import com.SpringBootApp.A.CinemaProject.entity.showEntity;
import org.springframework.data.repository.CrudRepository;

public interface showRepository extends CrudRepository<showEntity, Long> {
    showEntity findByMovie(movieEntity movie);
}
