package com.SpringBootApp.A.CinemaProject.repository;

import com.SpringBootApp.A.CinemaProject.entity.payCardEntity;
import com.SpringBootApp.A.CinemaProject.entity.userEntity;
import org.springframework.data.repository.CrudRepository;

import java.util.Collection;

public interface payCardRepository extends CrudRepository<payCardEntity, Long> {
    payCardEntity findById(long id);
    payCardEntity findByUser(userEntity user);
    Collection<payCardEntity> findAllByUser(userEntity user);
}
