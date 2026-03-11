package model;

import java.sql.Timestamp;

public class Invoice {
    private int invoicesID;
    private int bookingID;
    private Timestamp invoiceDate;
    private double rentFee;
    private double totalExtraFee;
    private double depositUsed;
    private double totalAmount;
    private String invoiceStatus;
    private String note;

    public Invoice() {}

    public Invoice(int invoicesID, int bookingID, Timestamp invoiceDate, double rentFee, double totalExtraFee, double depositUsed, double totalAmount, String invoiceStatus, String note) {
        this.invoicesID = invoicesID;
        this.bookingID = bookingID;
        this.invoiceDate = invoiceDate;
        this.rentFee = rentFee;
        this.totalExtraFee = totalExtraFee;
        this.depositUsed = depositUsed;
        this.totalAmount = totalAmount;
        this.invoiceStatus = invoiceStatus;
        this.note = note;
    }

    public int getInvoicesID() {
        return invoicesID;
    }

    public void setInvoicesID(int invoicesID) {
        this.invoicesID = invoicesID;
    }

    public int getBookingID() {
        return bookingID;
    }

    public void setBookingID(int bookingID) {
        this.bookingID = bookingID;
    }

    public Timestamp getInvoiceDate() {
        return invoiceDate;
    }

    public void setInvoiceDate(Timestamp invoiceDate) {
        this.invoiceDate = invoiceDate;
    }

    public double getRentFee() {
        return rentFee;
    }

    public void setRentFee(double rentFee) {
        this.rentFee = rentFee;
    }

    public double getTotalExtraFee() {
        return totalExtraFee;
    }

    public void setTotalExtraFee(double totalExtraFee) {
        this.totalExtraFee = totalExtraFee;
    }

    public double getDepositUsed() {
        return depositUsed;
    }

    public void setDepositUsed(double depositUsed) {
        this.depositUsed = depositUsed;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getInvoiceStatus() {
        return invoiceStatus;
    }

    public void setInvoiceStatus(String invoiceStatus) {
        this.invoiceStatus = invoiceStatus;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
    
}