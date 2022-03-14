<%--
  Created by IntelliJ IDEA.
  User: aminr
  Date: 3/14/2022
  Time: 7:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@page import="java.util.List"%>
<%@page import="com.example.pharmacy_system.order.Orders"%>
<%@page import="com.example.pharmacy_system.ConnectionData"%>
<%@page import="com.example.pharmacy_system.order.OrdersData"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%
    OrdersData ordersData = new OrdersData(ConnectionData.getCon());
    List<Orders> orders = ordersData.getAllOrders();
    request.setAttribute("order_list", orders);
%>


<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

        <title>All Data Show</title>

        <style>
            .inner{
                margin: 15px 0;
            }
        </style>
    </head>
<body>

    <div  class="container-fluid">
        <nav class="navbar navbar-light">
            <a class="navbar-brand">User Information</a>
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
                <div class="col-md-4">
                    <h3>Input Order data</h3>
                    <form action="order" method="post">
                        <div class="form-group">
                            <label>Total Amount</label>
                            <input type="number" class="form-control" name="total_amount" id="total_amount" place-holder="total amount" required>
                        </div>

                        <div class="form-group">
                            <label>Discount</label>
                            <input type="text" class="form-control" name="discount" id="discount" place-holder="Discount" required>
                        </div>

                        <div class="form-group" >
                            <label>Status</label>
                            <select id="inputState" class="form-control" name="status" required>
                                <option selected disabled>Choose Status</option>
                                <option value="Due">Due</option>
                                <option value="Paid">Paid</option>
                            </select>
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

                <div class="col-md-8">
                    <h3>Order Information From Database</h3>
                    <table class="table">
                        <thead class="bg-light">
                        <tr>
                            <th scope="col">Total Amount</th>
                            <th scope="col">Status</th>
                            <th scope="col">Discount</th>
                            <th scope="col">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="tempOrder" items="${order_list}">
                                <tr>
                                    <td>${tempOrder.total_amount }</td>
                                    <td>${tempOrder.status }</td>
                                    <td>${tempOrder.discount }</td>
                                    <td>
                                        <a href="#">Edit</a> |
                                        <a href="#">Delete</a>
                                    </td>
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
