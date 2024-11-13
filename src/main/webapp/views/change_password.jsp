<%--
  Created by IntelliJ IDEA.
  User: ADMIN88
  Date: 10/11/2024
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Change Password</h2>
<form action="<%= request.getContextPath() %>/change-password" method="post">
    <label for="currentPassword">Current Password:</label>
    <input type="password" id="currentPassword" name="currentPassword" required><br>

    <label for="newPassword">New Password:</label>
    <input type="password" id="newPassword" name="newPassword" required><br>

    <label for="confirmPassword">Confirm New Password:</label>
    <input type="password" id="confirmPassword" name="confirmPassword" required><br>

    <button type="submit">Change Password</button>
</form>

<c:if test="${not empty errorMessage}">
    <p style="color: red;">${errorMessage}</p>
</c:if>
<c:if test="${not empty successMessage}">
    <p style="color: green;">${successMessage}</p>
</c:if>
</body>
</html>
