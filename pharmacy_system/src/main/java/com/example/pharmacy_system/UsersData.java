package com.example.pharmacy_system;

import java.sql.*;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

public class UsersData {

    static Connection con;
    private PreparedStatement preparedStatement;

    public UsersData(Connection con) {
        this.con = con;
    }

    public static boolean isValidUser(String username, String password){
        boolean test = false;

        try{
            String sql = "SELECT username, password FROM USERS where username = ? and password = ?";

            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, username);
            pst.setString(2, password);
            //pst.executeUpdate();

            ResultSet result = pst.executeQuery();

            if (result.next()) {
                if (username.equals(result.getString("username")) && password.equals(result.getString("password"))) {
                    test= true;
                }
            }else{
                test= false;
            }

        }catch(Exception e){
            e.printStackTrace();
        }
        return test;
    }


    //add books information to database
    public boolean addUsers(Users user){
        boolean test = false;

        try{
            String query =  "insert into users (username, password, email, phone, address, role, created_at) values(?,?,?,?,?,?,?)";

            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setString(1, user.getUsername());
            pst.setString(2, user.getPassword());
            pst.setString(3, user.getEmail());
            pst.setString(4, user.getPhone());
            pst.setString(5, user.getAddress());
            pst.setInt(6, 1);
            //Integer.parseInt(request.getParameter("role"));
            pst.setTimestamp(7, Timestamp.from(Instant.now()));
            pst.executeUpdate();
            test= true;

        }catch(Exception e){
            e.printStackTrace();
        }
        return test;
    }

    //    retrieve the user details from databse
    public List<Users> getAllUsers(){
        List<Users> user = new ArrayList<>();

        try{
            String query = "select * from users";
            PreparedStatement pt = this.con.prepareStatement(query);
            ResultSet rs = pt.executeQuery();

            while(rs.next()){
                //int id = rs.getInt("id");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                //String is_active = rs.getString("is_active");
                int role = Integer.parseInt(rs.getString("role"));
                String address = rs.getString("address");

                Users row = new Users(username, password, email, phone, address, role);
                user.add(row);
            }

        }catch(Exception e){
            e.printStackTrace();;
        }
        return user;
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

