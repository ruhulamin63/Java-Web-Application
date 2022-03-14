<%--
  Created by IntelliJ IDEA.
  User: aminr
  Date: 3/14/2022
  Time: 9:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.util.List"%>
<%@page import="com.example.pharmacy_system.ConnectionData"%>
<%@ page import="com.example.pharmacy_system.category.CategoriesData" %>
<%@ page import="com.example.pharmacy_system.category.Categories" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%
    CategoriesData categoriesData = new CategoriesData(ConnectionData.getCon());
    List<Categories> categories = categoriesData.getAllCategories();
    request.setAttribute("category_list", categories);
%>


<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

        <title>Category</title>

        <style>
            .inner{
                margin: 15px 0;
            }
        </style>
    </head>
<body>

<div  class="container-fluid">
    <nav class="navbar navbar-light">
        <a class="navbar-brand">Category Information</a>
        <form class="form-inline">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </nav>
</div>

<div class="container-fluid">
    <a href="hello-servlet">Hello Servlet</a> |
    <a href="register">Register</a> |
    <a href="login">Login</a> |
    <a href="order">Order</a> |
    <a href="medicine">Medicine</a> |
    <a href="category">Category</a> |
    <a href="supplier">Supplier</a>
</div>

<div class="container">
    <div class="inner">
        <div class="row">
            <div class="col-md-3">
                <h3>Input Category Information</h3>
                <form action="category" method="post">
                    <div class="form-group">
                        <label>Category Name</label>
                        <input type="text" class="form-control" name="name" id="name" place-holder="Name" required>
                    </div>

                    <div class="form-group">
                        <label>Description</label>
                        <input type="text" class="form-control" name="desc" id="desc" place-holder="Description" required>
                    </div>

                    <button type="submit" class="btn btn-primary">Submit</button>
                    <button type="reset" class="btn btn-primary">Reset</button>
                </form>

                <br>
                <p>
                    <%
                        if (request.getSession().getAttribute("success") != null) {
                            String msg = request.getSession().getAttribute("success").toString();
                            out.println(msg);
                        }
                    %>
                </p>
                </section>

                <footer>
                    <p>Copyright@2022</p>
                </footer>

            </div>
            <div class="col-md-9">
                <h3>Category Information From Database</h3>
                <table class="table">
                    <thead class="bg-light">
                    <tr>
                        <th scope="col">Name</th>
                        <th scope="col">Description</th>
                        <th scope="col">Action</th>
                    </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="tempCategory" items="${category_list}">
                            <tr>
                                <td>${tempCategory.name }</td>
                                <td>${tempCategory.desc }</td>
                                <td><a href="#">Edit</a>
                                    <a href="#">Delete</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

</body>
</html>
