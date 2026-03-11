/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class Bike {

    private int bikeId;
    private String plateNumber;
    private String brand;
    private String model;
    private String imgBike;
    private String color;
    private double pricePreDay;
    private String status;

    public Bike() {
    }

    public Bike(int bikeId, String plateNumber, String brand, String model, String imgBike, String color, double pricePreDay, String status) {
        this.bikeId = bikeId;
        this.plateNumber = plateNumber;
        this.brand = brand;
        this.model = model;
        this.imgBike = imgBike;
        this.color = color;
        this.pricePreDay = pricePreDay;
        this.status = status;
    }

    // Getters and Setters
    public int getBikeId() {
        return bikeId;
    }

    public void setBikeId(int bikeId) {
        this.bikeId = bikeId;
    }

    public String getPlateNumber() {
        return plateNumber;
    }

    public void setPlateNumber(String plateNumber) {
        this.plateNumber = plateNumber;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getImgBike() {
        return imgBike;
    }

    public void setImgBike(String imgBike) {
        this.imgBike = imgBike;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public double getPricePreDay() {
        return pricePreDay;
    }

    public void setPricePreDay(double pricePreDay) {
        this.pricePreDay = pricePreDay;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
