<%--
  Created by IntelliJ IDEA.
  User: aminr
  Date: 3/14/2022
  Time: 11:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
                <div class="col-md-12">
                    <h3>Input Supplier Information</h3>
                    <form action="supplier" method="post">
                        <div class="form-group">
                            <label>Supplier Name</label>
                            <input type="text" class="form-control" name="name" id="name" place-holder="Name" required>
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
