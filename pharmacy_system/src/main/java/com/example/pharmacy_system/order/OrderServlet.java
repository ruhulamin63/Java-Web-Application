package com.example.pharmacy_system.order;

import com.example.pharmacy_system.ConnectionData;
import com.example.pharmacy_system.Users;
import com.example.pharmacy_system.UsersData;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/order.jsp");
        requestDispatcher.forward(request, response);

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
       // Orders order = new Orders(Integer.parseInt(request.getParameter("total_amount")), request.getParameter("discount"), request.getParameter("status"));

        try(PrintWriter out = response.getWriter()) {

            int total_amount = Integer.parseInt(request.getParameter("total_amount"));
            String discount = request.getParameter("discount");
            String status = request.getParameter("status");

            Orders us = new Orders(total_amount, discount, status);

            try {
                OrdersData ordersData = new OrdersData(ConnectionData.getCon());

                if (ordersData.addOrders(us)) {
                    //response.sendRedirect("index.jsp");
                    HttpSession session = request.getSession();
                    session.setAttribute("success", "Added Order Successful");

                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("/order.jsp");
                    requestDispatcher.forward(request, response);
                } else {
                    out.print("Something Wrong !");

                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("/order.jsp");
                    requestDispatcher.forward(request, response);
                }

            } catch (Exception e) {

                e.printStackTrace();
            }
        }
    }
}
