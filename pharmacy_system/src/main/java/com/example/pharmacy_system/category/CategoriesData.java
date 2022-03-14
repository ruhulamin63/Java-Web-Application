package com.example.pharmacy_system.category;

import java.sql.*;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

public class CategoriesData {

    static Connection con;
    private PreparedStatement preparedStatement;

    public CategoriesData(Connection con) {
        this.con = con;
    }


    //add books information to database
    public boolean addCategories(Categories category){
        boolean test = false;

        try{
            String query =  "insert into categories (name, desc, created_at) values(?,?,?)";

            PreparedStatement pst = this.con.prepareStatement(query);

            pst.setString(1, category.getName());
            pst.setString(2, category.getDesc());
            pst.setTimestamp(3, Timestamp.from(Instant.now()));

            pst.executeUpdate();
            //pst.executeQuery();
            test= true;

        }catch(Exception e){
            e.printStackTrace();
        }
        return test;
    }

    //    retrieve the user details from databse
    public List<Categories> getAllCategories(){
        List<Categories> categories = new ArrayList<>();

        try{
            String query = "select * from categories";
            PreparedStatement pt = this.con.prepareStatement(query);
            ResultSet rs = pt.executeQuery();

            while(rs.next()){
                String name = rs.getString("name");
                String desc = rs.getString("desc");

                Categories row = new Categories(name, desc);
                categories.add(row);
            }
        }catch(Exception e){
            e.printStackTrace();;
        }
        return categories;
    }
}
