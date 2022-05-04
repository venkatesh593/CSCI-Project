package com.SpringBootApp.A.CinemaProject.repository;

import com.SpringBootApp.A.CinemaProject.entity.orderEntity;
import com.SpringBootApp.A.CinemaProject.entity.ticketEntity;
import org.springframework.data.repository.CrudRepository;

import java.util.Collection;

public interface ticketRepository extends CrudRepository<ticketEntity, Long> {
    Collection<ticketEntity> findAllById(long id);

    ticketEntity findById(long id);

    Collection<ticketEntity> findAllByOrder(orderEntity order);
}
