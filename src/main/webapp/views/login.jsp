<%--
  Created by IntelliJ IDEA.
  User: ADMIN88
  Date: 10/11/2024
  Time: 13:41
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="/css/login.css">
</head>
<body>
<div class="login-container">
    <h2>Login</h2>
    <form action="/admin/login" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br>

        <button type="submit">Login</button>
    </form>

    <c:if test="${not empty errorMessage}">
        <p class="error-message">${errorMessage}</p>
    </c:if>

    <%--<p>Don't have an account? <a href="register">Register here</a></p>--%>
</div>
</body>
</html>
