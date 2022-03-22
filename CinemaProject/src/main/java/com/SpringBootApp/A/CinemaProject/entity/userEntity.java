package com.SpringBootApp.A.CinemaProject.entity;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name="User")
public class userEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int user_id;

    private String firstName;

    private String lastName;

    private String userName;

    private String password;

    private String email;

    private String phoneNumber;

    //private int age;

    private String billingAddress;

    /*
    private LocalDate dateOfBirth;

    private int usertype_id;

    private int userstatus_id;
    */

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
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

    /*
    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
    */

    public String getBillingAddress() {
        return billingAddress;
    }

    public void setBillingAddress(String billingAddress) {
        this.billingAddress = billingAddress;
    }

    /*
    public LocalDate getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(LocalDate dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public int getUsertype_id() {
        return usertype_id;
    }

    public void setUsertype_id(int usertype_id) {
        this.usertype_id = usertype_id;
    }

    public int getUserstatus_id() {
        return userstatus_id;
    }

    public void setUserstatus_id(int userstatus_id) {
        this.userstatus_id = userstatus_id;
    }
    */
}
