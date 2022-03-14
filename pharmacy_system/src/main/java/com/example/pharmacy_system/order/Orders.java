package com.example.pharmacy_system.order;

public class Orders {
    private int total_amount;
    private String discount;
    private String status;

    public Orders() {
    }

    public Orders(int total_amount, String discount, String status) {
        this.total_amount = total_amount;
        this.discount = discount;
        this.status = status;
    }


    public int getTotal_amount() {
        return total_amount;
    }
    public void setTotal_amount(int total_amount) {
        this.total_amount = total_amount;
    }

    public String getDiscount() {
        return discount;
    }
    public void setDiscount(String discount) {
        this.discount = discount;
    }

    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
}


