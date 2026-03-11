package model;

import java.sql.Timestamp;

public class Transaction {
    private int transactionID;
    private int bookingID;
    private Integer invoicesID; // Có thể null
    private double amount;
    private String type; // Deposit, Payment, Refund
    private String method; // Cash, Transfer, E-Wallet
    private Timestamp transactionDate;
    private String message;
    private String transactionsStatus; // Success, Failed...

    public Transaction() {}

    public Transaction(int transactionID, int bookingID, Integer invoicesID, double amount, String type, String method, Timestamp transactionDate, String message, String transactionsStatus) {
        this.transactionID = transactionID;
        this.bookingID = bookingID;
        this.invoicesID = invoicesID;
        this.amount = amount;
        this.type = type;
        this.method = method;
        this.transactionDate = transactionDate;
        this.message = message;
        this.transactionsStatus = transactionsStatus;
    }

    public int getTransactionID() {
        return transactionID;
    }

    public void setTransactionID(int transactionID) {
        this.transactionID = transactionID;
    }

    public int getBookingID() {
        return bookingID;
    }

    public void setBookingID(int bookingID) {
        this.bookingID = bookingID;
    }

    public Integer getInvoicesID() {
        return invoicesID;
    }

    public void setInvoicesID(Integer invoicesID) {
        this.invoicesID = invoicesID;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public Timestamp getTransactionDate() {
        return transactionDate;
    }

    public void setTransactionDate(Timestamp transactionDate) {
        this.transactionDate = transactionDate;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getTransactionsStatus() {
        return transactionsStatus;
    }

    public void setTransactionsStatus(String transactionsStatus) {
        this.transactionsStatus = transactionsStatus;
    }
    
}