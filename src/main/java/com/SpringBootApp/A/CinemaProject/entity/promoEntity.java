package com.SpringBootApp.A.CinemaProject.entity;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name="Promotions")
public class promoEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long promo_id;

    private String promoName;

    private String promoCode;


    private String expDate;

    private String promoAmt;




    public String getPromoName() {
        return promoName;
    }

    public void setPromoName(String promoName) {
        this.promoName = promoName;
    }

    public long getPayCard_id() {
        return promo_id;
    }

    public void setPromo_id(long promo_id) {
        this.promo_id = promo_id;
    }

    public String getPromoCode() {
        return promoCode;
    }

    public void setPromoCode(String promoCode) {
        this.promoCode = promoCode;
    }


    public String getExpDate() {
        return expDate;
    }

    public void setExpDate(String expDate) {
        this.expDate = expDate;
    }

    public String getPromoAmt() {
        return promoAmt;
    }

    public void setPromoAmt(String promoAmt) {
        this.promoAmt = promoAmt;
    }
}
