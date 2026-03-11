package model;

import java.sql.Timestamp;

public class Feedback {
    private int feedbackId;
    private int rating; // 1-5
    private String comment;
    private String reply;
    private Timestamp createdAt;
    private int accountsID;
    private int bookingId;
    private int bikeID;

    public Feedback() {}

    public Feedback(int feedbackId, int rating, String comment, String reply, Timestamp createdAt, int accountsID, int bookingId, int bikeID) {
        this.feedbackId = feedbackId;
        this.rating = rating;
        this.comment = comment;
        this.reply = reply;
        this.createdAt = createdAt;
        this.accountsID = accountsID;
        this.bookingId = bookingId;
        this.bikeID = bikeID;
    }

    
    
    public int getFeedbackId() {
        return feedbackId;
    }

    public void setFeedbackId(int feedbackId) {
        this.feedbackId = feedbackId;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public int getAccountsID() {
        return accountsID;
    }

    public void setAccountsID(int accountsID) {
        this.accountsID = accountsID;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public int getBikeID() {
        return bikeID;
    }

    public void setBikeID(int bikeID) {
        this.bikeID = bikeID;
    }
    
}