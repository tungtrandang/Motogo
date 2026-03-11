package model;

import java.sql.Date;

public class Employee {
    private int employeeID;
    private String position;
    private double salary;
    private Date hireDate;
    private String fullName;
    private String phone;
    private String status;

    public Employee() {}

    public Employee(int employeeID, String position, double salary, Date hireDate, String fullName, String phone, String status) {
        this.employeeID = employeeID;
        this.position = position;
        this.salary = salary;
        this.hireDate = hireDate;
        this.fullName = fullName;
        this.phone = phone;
        this.status = status;
    }

    public int getEmployeeID() {
        return employeeID;
    }

    public void setEmployeeID(int employeeID) {
        this.employeeID = employeeID;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public Date getHireDate() {
        return hireDate;
    }

    public void setHireDate(Date hireDate) {
        this.hireDate = hireDate;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}