package com.SpringBootApp.A.CinemaProject.repository;

import com.SpringBootApp.A.CinemaProject.entity.promoEntity;
import org.springframework.data.repository.CrudRepository;
import java.util.Optional;

public interface promotionRepository extends CrudRepository<promoEntity, Long> {
    promoEntity findById(long promo_id);

    promoEntity findByPromoName(String promoName);

    promoEntity findByPromoCode(String promoCode);

}