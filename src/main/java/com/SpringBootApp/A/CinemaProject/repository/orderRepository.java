package com.SpringBootApp.A.CinemaProject.repository;

import com.SpringBootApp.A.CinemaProject.entity.orderEntity;
import com.SpringBootApp.A.CinemaProject.entity.userEntity;
import org.springframework.data.repository.CrudRepository;

import java.util.Collection;

public interface orderRepository extends CrudRepository<orderEntity, Long> {
    orderEntity findById(long id);
    Collection<orderEntity> findAllById(long id);
    Collection<orderEntity> findAllByUser(userEntity user);
}
