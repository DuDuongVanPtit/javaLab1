<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String currentPath = request.getRequestURI();
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/css/welcome.css">
</head>
<body>
<nav class="sidebar">
<%--    <p>Current Path: <%= currentPath %></p>--%>
    <ul>
        <a href="/admin/nhan-xe"
           class="<%= currentPath.contains("GDChonkhach233.jsp") ||
           currentPath.contains("GDThemKhach233.jsp") ||
           currentPath.contains("GDChonNVKT233.jsp")||
           currentPath.contains("GDChonDVPT233.jsp") ? "active" : "" %>">
            Nhận Xe Vào Sửa
        </a>
        <li><a href="#customer-info">Thông Tin Khách Hàng</a></li>
        <li><a href="#supplier-info">Thông Tin Nhà Cung Cấp</a></li>
    </ul>
</nav>
</body>
</html>
