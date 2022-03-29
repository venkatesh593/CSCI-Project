package com.SpringBootApp.A.CinemaProject.entity;

public class Customer {
    userEntity user;
    payCardEntity payCard;

    public Customer(userEntity user, payCardEntity payCard) {
        this.user = user;
        this.payCard = payCard;
    }

    public userEntity getUser() {
        return user;
    }

    public void setUser(userEntity user) {
        this.user = user;
    }

    public payCardEntity getPayCard() {
        return payCard;
    }

    public void setPayCard(payCardEntity payCard) {
        this.payCard = payCard;
    }
}
