package com.example.pharmacy_system;
import java.time.Instant;

public class Users {

    private int id;
    private String username;
    private String password;
    private String email;
    private  String phone;
    private  String address;
    private int role;
    private  String is_active;
    private Instant created_at;
    //private Instant updated_at;

    public Users() {
    }

    public Users(String username, String password, String email, String phone, String address, int role) {
        //this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.role = role;
        //this.is_active = is_active;
        //this.created_at = created_at;
        //this.updated_at = updated_at;
    }

    public Users(String username, String password, String email, String phone, String address) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.phone = phone;
        this.address = address;
    }


//    public int getId() {
//        return id;
//    }
//    public void setId(int id) {
//        this.id = id;
//    }

    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }
    public void setEmail(String phone) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }

    public String getIs_active() {
        return is_active;
    }
    public void setIs_active(String is_active) {
        this.is_active = is_active;
    }

    public int getRole() {
        return role;
    }
    public void setRole(int role) {
        this.role = role;
    }


    public Instant getCreated_at() {
        return created_at;
    }
    public void setCreated_at(Instant created_at) {
        this.created_at = created_at;
    }

//    public Instant getUpdated_at() {
//        return updated_at;
//    }
//    public void setUpdated_at(Instant updated_at) {
//        this.updated_at = updated_at;
//    }

    @Override
    public String toString() {
        return "users{" + "id=" + id + ", username=" + username + ", password=" + password + ", email=" + email + ", " +
                "phone=" + phone + ", address="+ address +", is_active="+is_active+", role="+role+", created_at=" + created_at + '}';
    }
}


