package com.SpringBootApp.A.CinemaProject.repository;

import com.SpringBootApp.A.CinemaProject.entity.userEntity;
import org.springframework.data.repository.CrudRepository;
import java.util.Optional;

public interface userRepository extends CrudRepository<userEntity, Long> {
    Optional<userEntity> findById(long user_id);

    userEntity findByUserName(String userName);

    userEntity findByEmail(String email);

    userEntity findByVerCode(String verCode);
}
