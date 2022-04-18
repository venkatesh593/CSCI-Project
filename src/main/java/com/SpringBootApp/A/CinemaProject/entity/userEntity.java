package com.SpringBootApp.A.CinemaProject.entity;
import javax.persistence.*;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name="users")
public class userEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long user_id;

    private String role;

    private String firstName;

    private String lastName;
    private String userName;
    private String password;

    private String passConf = "";

    private String email;

    private String phoneNumber;

    private boolean enabled;

    private String street;

    private String city;
    private String state;
    private String zipCode;
    private String wantsPromotions = "false";
    private String userStatus = "INACTIVE";
    private String verCode;

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch=FetchType.EAGER)
    private Set<payCardEntity> payCards = new HashSet<>();

    public String getUserStatus() {
        return userStatus;
    }
    public void setUserStatus(String userStatus) {
        this.userStatus = userStatus;
    }

    public String getVerCode() {
        return verCode;
    }
    public void setVerCode(String verCode) {
        this.verCode = verCode;
    }

    public Set<payCardEntity> getPayCards() {
        return payCards;
    }
    public void setPayCards(Set<payCardEntity> payCards) {
        this.payCards = payCards;
    }

    public String getWantsPromotions() {
        return wantsPromotions;
    }
    public void setWantsPromotions(String wantsPromotions) {
        if(!wantsPromotions.equals("true")) {
            this.wantsPromotions = "false";
        } else {
            this.wantsPromotions = wantsPromotions;
        }
    }

    public long getUser_id() {
        return user_id;
    }
    public void setUser_id(long user_id) {
        this.user_id = user_id;
    }

    public String getFirstName() {
        return firstName;
    }
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPassConf() {
        return passConf;
    }

    public void setPassConf(String passConf) {
        this.passConf = passConf;
    }

    public String getRole() { return role; }

    public void setRole(String role) { this.role = role; }

    public boolean getEnabled() { return enabled; }

    public void setEnabled(boolean enabled) { this.enabled = enabled;}

    public String getUserName() {
        return userName;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPhoneNumber() {
        return phoneNumber;
    }
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
    public String getStreet() {
        return street;
    }
    public void setStreet(String street) {
        this.street = street;
    }
    public String getCity() {
        return city;
    }
    public void setCity(String city) {
        this.city = city;
    }
    public String getState() {
        return state;
    }
    public void setState(String state) {
        this.state = state;
    }
    public String getZipCode() {
        return zipCode;
    }
    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }
}
