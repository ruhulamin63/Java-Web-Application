package com.example.pharmacy_system;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.IOException;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    @Resource(name = "jdbc/todo")
    private DataSource dataSource;

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

    }
}
