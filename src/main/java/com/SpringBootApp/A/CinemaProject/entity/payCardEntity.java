package com.SpringBootApp.A.CinemaProject.entity;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name="Payment_Card")
public class payCardEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long payCard_id;

    private String cardType;

    private String cardNumber;


    private String expDate;

    private String cvv;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private userEntity user;



    public String getCardType() {
        return cardType;
    }

    public void setCardType(String cardType) {
        this.cardType = cardType;
    }

    public long getPayCard_id() {
        return payCard_id;
    }

    public void setPayCard_id(long payCard_id) {
        this.payCard_id = payCard_id;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }


    public String getExpDate() {
        return expDate;
    }

    public void setExpDate(String expDate) {
        this.expDate = expDate;
    }

    public String getCvv() {
        return cvv;
    }

    public void setCvv(String cvv) {
        this.cvv = cvv;
    }

    public userEntity getUser() {
        return user;
    }

    public void setUser(userEntity user) {
        this.user = user;
    }
}
