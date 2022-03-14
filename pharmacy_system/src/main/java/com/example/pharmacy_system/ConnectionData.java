package com.example.pharmacy_system;

import java.sql.*;

public class ConnectionData {
    private static Connection con;

    public static Connection getCon() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacy_system","root","needhelp");
        }catch (Exception ex) {
            ex.printStackTrace();
        }
        return con;
    }
}