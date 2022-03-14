package com.example.pharmacy_system.supplier;

import com.example.pharmacy_system.category.Categories;

import javax.servlet.http.HttpServlet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

public class SuppliersData extends HttpServlet {

    static Connection con;
    private PreparedStatement preparedStatement;

    public SuppliersData(Connection con) {
        this.con = con;
    }


    //add books information to database
    public boolean addSuppliers(Suppliers suppliers){
        boolean test = false;

        try{
            String query =  "insert into suppliers (name,) values(?)";

            PreparedStatement pst = this.con.prepareStatement(query);

            pst.setString(1, suppliers.getName());

            pst.executeUpdate();
            //pst.executeQuery();
            test= true;

        }catch(Exception e){
            e.printStackTrace();
        }
        return test;
    }

    //    retrieve the user details from databse
    public List<Suppliers> getAllSuppliers(){
        List<Suppliers> suppliers = new ArrayList<>();

        try{
            String query = "select * from suppliers";

            PreparedStatement pt = this.con.prepareStatement(query);
            ResultSet rs = pt.executeQuery();

            while(rs.next()){
                String name = rs.getString("name");

                Suppliers row = new Suppliers(name);
                suppliers.add(row);
            }
        }catch(Exception e){
            e.printStackTrace();;
        }
        return suppliers;
    }
}
