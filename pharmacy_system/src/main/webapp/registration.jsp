<%--
  Created by IntelliJ IDEA.
  User: aminr
  Date: 3/14/2022
  Time: 3:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<html>--%>
<%--    <head>--%>
<%--        <meta name="viewport" content="width=device-width, initial-scale=1">--%>
<%--        <title>Login</title>--%>
<%--        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css"/>--%>
<%--        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"--%>
<%--              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">--%>
<%--    </head>--%>
<%--<body>--%>

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
        <a href="login">Login</a>
    </div>

    <div class="container">
        <div class="inner">
            <div class="row">
                <div class="col-md-12">
                    <h3>Input User Information</h3>

                    <form action="register" method="post">
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

                    <br>
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
