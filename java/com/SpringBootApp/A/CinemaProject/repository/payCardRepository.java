package com.SpringBootApp.A.CinemaProject.repository;

import com.SpringBootApp.A.CinemaProject.entity.payCardEntity;
import com.SpringBootApp.A.CinemaProject.entity.userEntity;
import org.springframework.data.repository.CrudRepository;

public interface payCardRepository extends CrudRepository<payCardEntity, Long> {
    payCardEntity findByUser(userEntity user);
}
