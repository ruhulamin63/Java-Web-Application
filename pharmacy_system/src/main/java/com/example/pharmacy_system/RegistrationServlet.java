package com.example.pharmacy_system;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {

//    @Resource(name = "jdbc/todo")
//    private DataSource dataSource;

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/registration.jsp");
        requestDispatcher.forward(request, response);

//        try(PrintWriter out = response.getWriter()){
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Register | Page</title>");
//            out.println("</head>");
//
//            out.println("<body");
//
//
//                Users us = new Users(username, password, email);
//
//                try{
//                    UsersData userdata = new UsersData(ConnectionData.getCon());
//
//                    if(userdata.addUsers(us)){
//                        //response.sendRedirect("index.jsp");
//                        HttpSession session = request.getSession();
//                        session.setAttribute("success", "Registration Successful");
//                    }else{
//                        out.print("Something Wrong !");
//                    }
//
//                }catch(Exception e){
//
//                    e.printStackTrace();
//                }
//
//            out.println("</body");
//            out.println("</html");
//        }

    }


    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Users user = new Users(request.getParameter("username"), request.getParameter("password"), request.getParameter("email"), request.getParameter("phone"),
                request.getParameter("address"));

        try(PrintWriter out = response.getWriter()) {

            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            //int role = 1;
            //Integer.parseInt(request.getParameter("role"));

            Users us = new Users(username, password, email, phone, address);

            try {
                UsersData userdata = new UsersData(ConnectionData.getCon());

                if (userdata.addUsers(us)) {
                    //response.sendRedirect("index.jsp");
                    HttpSession session = request.getSession();
                    session.setAttribute("success", "Registration Successful");

                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("/registration.jsp");
                    requestDispatcher.forward(request, response);
                } else {
                    out.print("Something Wrong !");
                }

            } catch (Exception e) {

                e.printStackTrace();
            }
        }
    }
}

