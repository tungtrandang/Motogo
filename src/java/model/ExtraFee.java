package model;

public class ExtraFee {
    private int feeId;
    private int invoicesID;
    private String type;
    private double amount;
    private String note;

    public ExtraFee() {}

    public ExtraFee(int feeId, int invoicesID, String type, double amount, String note) {
        this.feeId = feeId;
        this.invoicesID = invoicesID;
        this.type = type;
        this.amount = amount;
        this.note = note;
    }

    public int getFeeId() {
        return feeId;
    }

    public void setFeeId(int feeId) {
        this.feeId = feeId;
    }

    public int getInvoicesID() {
        return invoicesID;
    }

    public void setInvoicesID(int invoicesID) {
        this.invoicesID = invoicesID;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
    
}