<%--
  Created by IntelliJ IDEA.
  User: ADMIN88
  Date: 11/11/2024
  Time: 11:06
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ</title>
    <link rel="stylesheet" href="/css/customer-css/home.css">
</head>
<body>
<!-- Header-->
<jsp:include page="header.jsp" />

<!-- Phần banner -->
<section class="banner">
    <div class="banner-content">
        <div class="carousel-dots">
            <span class="dot"></span>
            <span class="dot"></span>
            <span class="dot"></span>
            <span class="dot"></span>
        </div>
    </div>
</section>

<!-- Phần "Top xe máy bán chạy" -->
<section class="top-products">
    <div class="container">
        <h2>Top xe máy bán chạy</h2>
        <div class="search-bar">
            <input type="text" placeholder="Nhập tên sản phẩm bạn cần tìm kiếm">
            <button>Tìm kiếm</button>
        </div>
        <div class="product-filters">
            <button class="filter active">Tất cả</button>
            <button class="filter">Xe số</button>
            <button class="filter">Xe tay ga</button>
            <button class="filter">Xe côn tay</button>
        </div>
        <!-- Danh sách sản phẩm -->
        <div class="product-list">
            <!-- Mỗi sản phẩm -->
            <div class="product">
                <img src="product1.jpg" alt="Xe máy 1">
                <h3>Xe máy 1</h3>
            </div>
            <div class="product">
                <img src="product2.jpg" alt="Xe máy 2">
                <h3>Xe máy 2</h3>
            </div>
            <!-- Thêm các sản phẩm khác tương tự -->
        </div>
    </div>
</section>

<!-- Các nút trò chuyện nổi -->
<div class="floating-buttons">
    <button class="btn-chat call">📞</button>
    <button class="btn-chat zalo">Zalo</button>
</div>
</body>
</html>

