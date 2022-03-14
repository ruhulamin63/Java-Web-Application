package com.example.pharmacy_system.order;

import java.sql.*;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

public class OrdersData {

    static Connection con;
    private PreparedStatement preparedStatement;

    public OrdersData(Connection con) {
        this.con = con;
    }


    //add books information to database
    public boolean addOrders(Orders order){
        boolean test = false;

        try{
            String query =  "insert into orders (total_amount, discount, status, user_id, created_at) values(?,?,?,?,?)";

            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setInt(1, order.getTotal_amount());
            pst.setString(2, order.getDiscount());
            pst.setString(3, order.getStatus());
            pst.setInt(4, 1);
            //Integer.parseInt(request.getParameter("role"));
            pst.setTimestamp(5, Timestamp.from(Instant.now()));

            pst.executeUpdate();
            test= true;

        }catch(Exception e){
            e.printStackTrace();
        }
        return test;
    }

    //    retrieve the user details from databse
    public List<Orders> getAllOrders(){
        List<Orders> order = new ArrayList<>();

        try{
            String query = "select * from orders";
            PreparedStatement pt = this.con.prepareStatement(query);
            ResultSet rs = pt.executeQuery();

            while(rs.next()){
                //int id = rs.getInt("id");
                int total_amount = Integer.parseInt(rs.getString("total_amount"));
                String discount = rs.getString("discount");
                String status = rs.getString("status");

                Orders row = new Orders(total_amount, discount, status);
                order.add(row);
            }
        }catch(Exception e){
            e.printStackTrace();;
        }
        return order;
    }


    //    eidt user information
//    public void editUsers(Users book){
//
//        try{
//            String query = "update users set username=?, password=?, email=? where id=?";
//
//            PreparedStatement pt = this.con.prepareStatement(query);
//            pt.setString(1, book.getUsername());
//            pt.setString(2, book.getPassword());
//            pt.setString(3, book.getEmail());
//
////            pt.setInt(5, book.getId());
//
//            pt.executeUpdate();
//        }catch(Exception ex){
//            ex.printStackTrace();;
//        }
//
//
//    }

    //    get single user information in edit page
//    public Users getSingleUser(int id){
//        Users us = null;
//
//        try{
//            String query = "select * from users where id=? ";
//
//            PreparedStatement pt = this.con.prepareStatement(query);
//            pt.setInt(1, id);
//            ResultSet rs= pt.executeQuery();
//
//            while(rs.next()){
//                //int bid = rs.getInt("id");
//                String username = rs.getString("username");
//                String password = rs.getString("password");
//                String email = rs.getString("email");
//
//                us = new Users(username,password,email);
//            }
//        }catch(Exception ex){
//            ex.printStackTrace();;
//        }
//        return us;
//    }


//    delete user from database


//    public void deleteUser(int id){
//        try{
//
//            String query= "delete from users where id=?";
//            PreparedStatement pt = this.con.prepareStatement(query);
//            pt.setInt(1, id);
//            pt.execute();
//
//        }catch(Exception ex){
//            ex.printStackTrace();;
//        }
//    }
}


