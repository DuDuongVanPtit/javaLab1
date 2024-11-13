<%--
  Created by IntelliJ IDEA.
  User: ADMIN88
  Date: 11/11/2024
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String currentPath = request.getRequestURI();
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/customer-css/home.css">
</head>
<body>
<header class="top-header">
    <div class="container">
        <div class="left-header">
            <a href="#">Hệ thống cửa hàng</a>
            <a href="#">Tin tức</a>
            <a href="#">Liên hệ</a>
        </div>
        <div class="right-header">
            <a href="#">Zalo</a>
            <a href="#">YouTube</a>
            <a href="#">Instagram</a>
            <a href="#">Facebook</a>
        </div>
    </div>
</header>

<!-- Logo và thanh điều hướng chính -->
<nav class="main-nav">
    <div class="container">
        <%--        <div class="logo">--%>
        <%--            <img src="logo.png" alt="Logo">--%>
        <%--        </div>--%>
        <ul class="nav-links">
            <li><a href="xe-may.jsp" class="<%= currentPath.contains("xe-may.jsp") ? "active" : "" %>">Xe máy</a></li>
            <li><a href="oto.jsp" class="<%= currentPath.contains("oto.jsp") ? "active" : "" %>">Ô tô</a></li>
            <li><a href="tuvan.jsp" class="<%= currentPath.contains("tuvan.jsp") ? "active" : "" %>">Tư vấn mua bán xe</a></li>
            <li><a href="muatraagop.jsp" class="<%= currentPath.contains("muatraagop.jsp") ? "active" : "" %>">Mua xe trả góp</a></li>
            <li><a href="/dat-lich-hen" class="<%= currentPath.contains("datlichhen.jsp") ? "active" : "" %>">Đặt lịch hẹn</a></li>
            <li><a href="dichvu.jsp" class="<%= currentPath.contains("dichvu.jsp") ? "active" : "" %>">Dịch vụ</a></li>
        </ul>
    </div>
</nav>
</body>
</html>
