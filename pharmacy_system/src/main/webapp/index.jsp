<%@page import="java.util.List"%>
<%@page import="com.example.pharmacy_system.Users"%>
<%@page import="com.example.pharmacy_system.ConnectionData"%>
<%@page import="com.example.pharmacy_system.UsersData"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%
    UsersData userData = new UsersData(ConnectionData.getCon());
    List<Users> users = userData.getAllUsers();
    request.setAttribute("users_list", users);
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
                <div class="col-md-3">
                    <h3>
                        Input User Information</h3>
                    <form action="index" method="post">
                        <div class="form-group">
                            <label>Userame</label>
                            <input type="text" class="form-control" name="username" id="username" place-holder="Username" required>
                        </div>

                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" class="form-control" name="password" id="password" place-holder="Password" required>
                        </div>

                        <div class="form-group">
                            <label>Email</label>
                            <input type="email" class="form-control" name="email" id="email" place-holder="@email" required>
                        </div>

                        <div class="form-group">
                            <label>Address</label>
                            <input type="area" class="form-control" name="address" id="address" place-holder="Area" required>
                        </div>

                        <div class="form-group">
                            <label>Phone</label>
                            <input type="text" class="form-control" name="phone" id="phone" place-holder="Phone" required>
                        </div>

<%--                        <div class="form-group" >--%>
<%--                            <label>Category</label>--%>
<%--                            <select id="inputState" class="form-control" name="category" required>--%>
<%--                                <option selected disabled>Choose Category</option>--%>
<%--                                <option value="Novel">Novel</option>--%>
<%--                                <option value="Science Fiction">Science Fiction</option>--%>
<%--                                <option value="Drama">Drama</option>--%>
<%--                                <option value="Programming & Development">Programming & Development</option>--%>
<%--                            </select>--%>
<%--                        </div>--%>

                        <button type="submit" class="btn btn-primary">Submit</button>
                        <button type="reset" class="btn btn-primary">Reset</button>
                    </form>
                </div>
                <div class="col-md-9">
                    <h3>
                        Users Information From Database</h3>
                    <table class="table">
                        <thead class="bg-light">
                        <tr>
                            <th scope="col">Username</th>
                            <th scope="col">Password</th>
                            <th scope="col">Email</th>
<%--                            <th scope="col">Category</th>--%>
                            <th scope="col">Action</th>
                        </tr>
                        </thead>
                        <tbody>
<%--                        <c:forEach var="tempUser" items="${users_list}">--%>
<%--                            <tr>--%>
<%--                                <td>${tempUser.username }</td>--%>
<%--                                <td>${tempUser.password }</td>--%>
<%--                                <td>${tempUser.email }</td>--%>
<%--&lt;%&ndash;                                <td>${tempBook.cat}</td>&ndash;%&gt;--%>
<%--                                <td><a href="edituser.jsp?id=${tempUser.id }">Edit</a>--%>
<%--                                    <a href="DeleteUserServlet?id=${tempUser.id}">Delete</a></td>--%>
<%--                            </tr>--%>
<%--                        </c:forEach>--%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <a href="login">Login</a>
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

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>

