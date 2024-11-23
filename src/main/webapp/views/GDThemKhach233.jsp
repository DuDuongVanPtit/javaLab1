<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Nhanvien233" %>
<%@ page session="true" %>
<%
    Nhanvien233 user = (Nhanvien233) session.getAttribute("user");
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
    <link rel="stylesheet" href="/css/nhanxe.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp" />
<div class="dashboard-container">
    <!-- Sidebar -->
    <jsp:include page="sidebar.jsp" />

    <!-- Main Content -->
    <div class="content-container">
        <main class="main-content">
            <div id="addCustomerForm" class="step-content">
                <h2>Thêm Khách Hàng Mới</h2>
                <form id="newCustomerForm" action="/admin/them-khach-hang" method="post">
                    <div style="display: flex; justify-content: space-between; padding: 20px 0">
                        <div style="width: 45%">
                            <label for="name">Họ tên:</label>
                            <input type="text" id="name" name="name" placeholder="Nhập họ tên" required>
                        </div>

                        <div style="width: 45%">
                            <label for="phone">Số điện thoại:</label>
                            <input type="text" id="phone" name="phone" placeholder="Nhập số điện thoại" pattern="[0-9]{10}" required>
                        </div>
                    </div>

                    <div style="display: flex; justify-content: space-between; padding: 20px 0">
                        <div style="width: 45%">
                            <label for="email">Email:</label>
                            <input type="email" id="email" name="email" placeholder="Nhập email" required>
                        </div>

                        <div style="width: 45%">
                            <label for="appointmentTime">Thời gian đăng ký:</label>
                            <input type="datetime-local" id="appointmentTime" name="appointmentTime" required>
                        </div>
                    </div>

                    <label for="notes">Ghi chú:</label>
                    <textarea id="notes" name="notes" placeholder="Nhập ghi chú" rows="3"></textarea>

                    <div style="display: flex; justify-content: flex-start">
                        <button style="margin-right: 10px; width: 150px;" type="submit">Lưu khách hàng</button>
                        <button onclick="window.location.href='/admin/nhan-xe'" style="margin-left: 10px; width: 150px;" type="button" id="cancelAddCustomer">Hủy</button>
                    </div>
                </form>
                <% if (request.getAttribute("error") != null) { %>
                    <p style="color: red;"><%= request.getAttribute("error") %></p>
                <% } %>
            </div>
        </main>

    </div>
</div>
</body>
</html>
