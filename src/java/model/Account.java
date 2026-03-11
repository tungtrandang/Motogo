/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.sql.Timestamp;

public class Account {
    private int accountsID;
    private String lastName;
    private String firstName;
    private String phoneNumber;
    private String email;
    private String passwordHash;
    private String avatarUrl;
    private int role; // 0 hoặc 1
    private Timestamp createdAt;

    // Constructors
    public Account() {}

    public Account(int accountsID, String lastName, String firstName, String phoneNumber, String email, String passwordHash, String avatarUrl, int role, Timestamp createdAt) {
        this.accountsID = accountsID;
        this.lastName = lastName;
        this.firstName = firstName;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.passwordHash = passwordHash;
        this.avatarUrl = avatarUrl;
        this.role = role;
        this.createdAt = createdAt;
    }

    public int getAccountsID() {
        return accountsID;
    }

    public void setAccountsID(int accountsID) {
        this.accountsID = accountsID;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPasswordHash() {
        return passwordHash;
    }

    public void setPasswordHash(String passwordHash) {
        this.passwordHash = passwordHash;
    }

    public String getAvatarUrl() {
        return avatarUrl;
    }

    public void setAvatarUrl(String avatarUrl) {
        this.avatarUrl = avatarUrl;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    
}