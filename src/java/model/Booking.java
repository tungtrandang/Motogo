package model;

import java.sql.Timestamp;

public class Booking {
    private int bookingID;
    private int customerID;
    private int bikeID;
    private Timestamp startDate;
    private Timestamp endDate;
    private String pickupType;
    private String pickupAddress;
    private String returnType;
    private String returnAddress;
    private Timestamp actualReturnDate;
    private Timestamp createdAt;
    private String bookingStatus; // Pending, Ongoing, Completed, Cancelled
    private String identityFrontImg;
    private String identityBackImg;
    private String licenseFrontImg;
    private String licenseBackImg;
    private boolean isVerified;
    private Timestamp verifiedAt;

    public Booking() {}

    public Booking(int bookingID, int customerID, int bikeID, Timestamp startDate, Timestamp endDate, String pickupType, String pickupAddress, String returnType, String returnAddress, Timestamp actualReturnDate, Timestamp createdAt, String bookingStatus, String identityFrontImg, String identityBackImg, String licenseFrontImg, String licenseBackImg, boolean isVerified, Timestamp verifiedAt) {
        this.bookingID = bookingID;
        this.customerID = customerID;
        this.bikeID = bikeID;
        this.startDate = startDate;
        this.endDate = endDate;
        this.pickupType = pickupType;
        this.pickupAddress = pickupAddress;
        this.returnType = returnType;
        this.returnAddress = returnAddress;
        this.actualReturnDate = actualReturnDate;
        this.createdAt = createdAt;
        this.bookingStatus = bookingStatus;
        this.identityFrontImg = identityFrontImg;
        this.identityBackImg = identityBackImg;
        this.licenseFrontImg = licenseFrontImg;
        this.licenseBackImg = licenseBackImg;
        this.isVerified = isVerified;
        this.verifiedAt = verifiedAt;
    }

    public int getBookingID() {
        return bookingID;
    }

    public void setBookingID(int bookingID) {
        this.bookingID = bookingID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public int getBikeID() {
        return bikeID;
    }

    public void setBikeID(int bikeID) {
        this.bikeID = bikeID;
    }

    public Timestamp getStartDate() {
        return startDate;
    }

    public void setStartDate(Timestamp startDate) {
        this.startDate = startDate;
    }

    public Timestamp getEndDate() {
        return endDate;
    }

    public void setEndDate(Timestamp endDate) {
        this.endDate = endDate;
    }

    public String getPickupType() {
        return pickupType;
    }

    public void setPickupType(String pickupType) {
        this.pickupType = pickupType;
    }

    public String getPickupAddress() {
        return pickupAddress;
    }

    public void setPickupAddress(String pickupAddress) {
        this.pickupAddress = pickupAddress;
    }

    public String getReturnType() {
        return returnType;
    }

    public void setReturnType(String returnType) {
        this.returnType = returnType;
    }

    public String getReturnAddress() {
        return returnAddress;
    }

    public void setReturnAddress(String returnAddress) {
        this.returnAddress = returnAddress;
    }

    public Timestamp getActualReturnDate() {
        return actualReturnDate;
    }

    public void setActualReturnDate(Timestamp actualReturnDate) {
        this.actualReturnDate = actualReturnDate;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public String getBookingStatus() {
        return bookingStatus;
    }

    public void setBookingStatus(String bookingStatus) {
        this.bookingStatus = bookingStatus;
    }

    public String getIdentityFrontImg() {
        return identityFrontImg;
    }

    public void setIdentityFrontImg(String identityFrontImg) {
        this.identityFrontImg = identityFrontImg;
    }

    public String getIdentityBackImg() {
        return identityBackImg;
    }

    public void setIdentityBackImg(String identityBackImg) {
        this.identityBackImg = identityBackImg;
    }

    public String getLicenseFrontImg() {
        return licenseFrontImg;
    }

    public void setLicenseFrontImg(String licenseFrontImg) {
        this.licenseFrontImg = licenseFrontImg;
    }

    public String getLicenseBackImg() {
        return licenseBackImg;
    }

    public void setLicenseBackImg(String licenseBackImg) {
        this.licenseBackImg = licenseBackImg;
    }

    public boolean isIsVerified() {
        return isVerified;
    }

    public void setIsVerified(boolean isVerified) {
        this.isVerified = isVerified;
    }

    public Timestamp getVerifiedAt() {
        return verifiedAt;
    }

    public void setVerifiedAt(Timestamp verifiedAt) {
        this.verifiedAt = verifiedAt;
    }
    
    
}