<%--
  Created by IntelliJ IDEA.
  User: ADMIN88
  Date: 8/29/2024
  Time: 4:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Book List</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css">
</head>
<body>
<h2>Book List</h2>
<a href="${pageContext.request.contextPath}/new-book.jsp">Add New Book</a>
<table border="1" cellpadding="10" cellspacing="0">
    <thead>
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Author</th>
        <th>Price</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="book" items="${books}">
        <tr>
            <td>${book.id}</td>
            <td>${book.title}</td>
            <td>${book.author}</td>
            <td>${book.price}</td>
            <td>
                <a href="${pageContext.request.contextPath}/edit-book?id=${book.id}">Edit</a>
                <a href="${pageContext.request.contextPath}/delete-book?id=${book.id}">Delete</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
