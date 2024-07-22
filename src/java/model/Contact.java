package model;

import java.sql.Timestamp;

public class Contact {
    private int contactId;
    private String fullName;
    private String email;
    private String message;
    private boolean responded;
    private Timestamp createdAt;
    private Timestamp updatedAt;
    private Integer userId;
    private Integer clubId;
    private int status;

    // Constructors, getters, and setters

    public Contact() {
    }

    // Add getters and setters for all fields

    public Contact(int contactId, String fullName, String email, String message, boolean responded, Timestamp createdAt, Timestamp updatedAt, Integer userId, Integer clubId, int status) {
        this.contactId = contactId;
        this.fullName = fullName;
        this.email = email;
        this.message = message;
        this.responded = responded;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.userId = userId;
        this.clubId = clubId;
        this.status = status;
    }

    public int getContactId() {
        return contactId;
    }

    public void setContactId(int contactId) {
        this.contactId = contactId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public boolean isResponded() {
        return responded;
    }

    public void setResponded(boolean responded) {
        this.responded = responded;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getClubId() {
        return clubId;
    }

    public void setClubId(Integer clubId) {
        this.clubId = clubId;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
}