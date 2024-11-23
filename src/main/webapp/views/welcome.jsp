<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Nhanvien233" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quản Lý Trang Chủ</title>
    <link rel="stylesheet" type="text/css" href="/css/welcome.css">
</head>
<body>
<jsp:include page="header.jsp" />
<div class="dashboard-container">
    <!-- Sidebar -->
    <jsp:include page="sidebar.jsp" />
    <!-- Main Content -->
    <div class="content-container">
        <div class="nav-top">
            <a href="/admin/home"><b>Home</b></a>
        </div>
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
