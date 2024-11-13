<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Nhanvien233" %>
<%@ page session="true" %>
<%
    // Lấy đối tượng user từ session
    Nhanvien233 user = (Nhanvien233) session.getAttribute("user");

    // Nếu user chưa đăng nhập, chuyển hướng về trang login
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quản Lý Trang Chủ</title>
    <link rel="stylesheet" type="text/css" href="/css/welcome.css">
</head>
<body>
<div class="dashboard-container">
    <!-- Sidebar -->
    <nav class="sidebar">
        <h2>Quản lý</h2>
        <ul>
            <li><a href="#vehicle-intake">Nhận Xe Vào Sửa</a></li>
            <li><a href="#customer-info">Thông Tin Khách Hàng</a></li>
            <li><a href="#supplier-info">Thông Tin Nhà Cung Cấp</a></li>
        </ul>
    </nav>

    <!-- Main Content -->
    <div class="content-container">
        <!-- Header -->
        <header class="header">
            <h1>Trang Quản Lý</h1>
            <div class="user-info">
                <img src="images/avatar.png" alt="User Avatar" class="avatar">
                <span class="username"><%= user.getUsername() %></span>
                <div class="user-menu">
                    <a href="profile.jsp">Thông tin cá nhân</a>
                    <a href="<%= request.getContextPath() %>/logout">Đăng xuất</a>
                </div>
            </div>
        </header>

        <!-- Main Sections -->
        <main class="main-content">
            <section id="vehicle-intake" class="section">
                <h2>Nhận Xe Vào Sửa</h2>
                <p>Quản lý danh sách các xe vào sửa và trạng thái sửa chữa của từng xe.</p>
            </section>

            <section id="customer-info" class="section">
                <h2>Thông Tin Khách Hàng</h2>
                <p>Thông tin chi tiết của khách hàng và lịch sử sửa chữa.</p>
            </section>

            <section id="supplier-info" class="section">
                <h2>Thông Tin Nhà Cung Cấp</h2>
                <p>Quản lý danh sách nhà cung cấp và sản phẩm cung cấp cho cửa hàng.</p>
            </section>
        </main>
    </div>
</div>
</body>
</html>
