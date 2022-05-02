package com.SpringBootApp.A.CinemaProject.repository;

import com.SpringBootApp.A.CinemaProject.entity.promoEntity;
import com.SpringBootApp.A.CinemaProject.entity.seatEntity;
import com.SpringBootApp.A.CinemaProject.entity.showroomEntity;
import org.springframework.data.repository.CrudRepository;
import java.util.Optional;

public interface showroomRepository extends CrudRepository<showroomEntity, Long> {
    showroomEntity findById(long showroom_id);

}