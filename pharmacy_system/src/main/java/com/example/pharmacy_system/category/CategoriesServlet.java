package com.example.pharmacy_system.category;

import com.example.pharmacy_system.ConnectionData;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet("/category")
public class CategoriesServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/category.jsp");
        requestDispatcher.forward(request, response);

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        //Categories categories = new Categories(request.getParameter("name"), request.getParameter("desc"));

        try(PrintWriter out = response.getWriter()) {

            String name = request.getParameter("name");
            String desc = request.getParameter("desc");

            Categories categories = new Categories(name,desc);

            try {
                CategoriesData categoriesData = new CategoriesData(ConnectionData.getCon());

                if(categoriesData.addCategories(categories)) {
                    //response.sendRedirect("index.jsp");
                    HttpSession session = request.getSession();
                    session.setAttribute("success", "Added Category Successful");

                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("/category.jsp");
                    requestDispatcher.forward(request, response);
                } else {
                    out.println("Something wrong");
//                    HttpSession session = request.getSession();
//                    session.setAttribute("error", "Something Wrong !");
//                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("/category.jsp");
//                    requestDispatcher.forward(request, response);
                }

            } catch (Exception e) {

                e.printStackTrace();
            }
        }
    }
}
