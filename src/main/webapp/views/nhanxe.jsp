<%--
  Created by IntelliJ IDEA.
  User: ADMIN88
  Date: 16/11/2024
  Time: 08:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nhận Xe Vào Sửa</title>
    <link rel="stylesheet" href="/css/nhanxe.css">
</head>
<body>

<div class="container">
    <!-- Thanh tiến trình -->
    <div class="stepper">
        <div class="step active" id="step1-header">
            <div class="circle">1</div>
            <p>Chọn khách hàng</p>
        </div>
        <div class="line"></div>
        <div class="step" id="step2-header">
            <div class="circle">2</div>
            <p>Chọn dịch vụ</p>
        </div>
        <div class="line"></div>
        <div class="step" id="step3-header">
            <div class="circle">3</div>
            <p>Chọn nhân viên</p>
        </div>
    </div>

    <!-- Bước 1: Chọn khách hàng -->
    <div id="step1" class="step-content active">
        <h2>Chọn Khách Hàng</h2>
        <input type="text" id="searchCustomer" placeholder="Tìm kiếm khách hàng...">

        <!-- Cập nhật bảng với cột checkbox để chọn khách hàng -->
        <table id="customerList" border="1">
            <thead>
            <tr>
                <th><input type="checkbox" id="selectAllCheckbox"></th>
                <th>Họ tên</th>
                <th>Số điện thoại</th>
                <th>Email</th>
                <th>Hãng xe</th>
                <th>Loại dịch vụ</th>
                <th>Thời gian đăng ký</th>
                <th>Ghi chú</th>
                <th>status</th>
            </tr>
            </thead>
            <tbody>
            <!-- Thông tin mẫu khách hàng với checkbox -->
            <tr>
                <td><input type="checkbox" class="customerCheckbox"></td>
                <td>Khách hàng C</td>
                <td>0123456789</td>
                <td>khachhangC@gmail.com</td>
                <td>Toyota</td>
                <td>Sửa chữa máy</td>
                <td>2024-11-01 10:00</td>
                <td>Không có ghi chú</td>
                <td>chưa xử lý</td>
            </tr>
            <tr>
                <td><input type="checkbox" class="customerCheckbox"></td>
                <td>Khách hàng D</td>
                <td>0987654321</td>
                <td>khachhangD@gmail.com</td>
                <td>Honda</td>
                <td>Thay lốp</td>
                <td>2024-11-01 11:30</td>
                <td>Ưu tiên buổi sáng</td>
                <td>chưa xử lý</td>
            </tr>
            </tbody>
        </table>

        <button id="addCustomerBtn">Thêm khách hàng mới</button>
        <button class="nextBtn" id="nextStep1" disabled>Tiếp tục</button>
    </div>

    <!-- Giao diện thêm khách hàng -->
    <div id="addCustomerForm" class="step-content">
        <h2>Thêm Khách Hàng Mới</h2>
        <form id="newCustomerForm">
            <label for="name">Họ tên:</label>
            <input type="text" id="name" placeholder="Nhập họ tên" required>

            <label for="phone">Số điện thoại:</label>
            <input type="text" id="phone" placeholder="Nhập số điện thoại" required>

            <label for="email">Email:</label>
            <input type="email" id="email" placeholder="Nhập email" required>

            <label for="carBrand">Hãng xe:</label>
            <select id="carBrand" required>
                <option value="Toyota">Toyota</option>
                <option value="Honda">Honda</option>
                <option value="Ford">Ford</option>
                <option value="Mercedes">Mercedes</option>
                <option value="BMW">BMW</option>
            </select>

            <label for="serviceType">Loại dịch vụ:</label>
            <select id="serviceType" required>
                <option value="Thay lốp">Thay lốp</option>
                <option value="Sửa chữa máy">Sửa chữa máy</option>
                <option value="Bảo dưỡng định kỳ">Bảo dưỡng định kỳ</option>
                <option value="Sửa chữa thân vỏ">Sửa chữa thân vỏ</option>
            </select>

            <label for="appointmentTime">Thời gian đăng ký:</label>
            <input type="datetime-local" id="appointmentTime" required>

            <label for="notes">Ghi chú:</label>
            <textarea id="notes" placeholder="Nhập ghi chú" rows="3"></textarea>

            <button type="submit">Lưu khách hàng</button>
            <button type="button" id="cancelAddCustomer">Hủy</button>
        </form>
    </div>

    <!-- Bước 2: Chọn dịch vụ -->
    <div id="step2" class="step-content">
        <h2>Chọn Dịch Vụ</h2>
        <label for="serviceSelect">Chọn dịch vụ sửa chữa:</label>
        <select id="serviceSelect" multiple>
            <option value="service1">Sửa chữa máy</option>
            <option value="service2">Thay lốp</option>
            <option value="service3">Bảo dưỡng định kỳ</option>
            <option value="service4">Sửa chữa thân vỏ</option>
        </select>
        <button class="prevBtn">Quay lại</button>
        <button class="nextBtn" id="nextStep2" disabled>Tiếp tục</button>
    </div>

    <!-- Bước 3: Chọn nhân viên -->
    <div id="step3" class="step-content">
        <h2>Chọn Nhân Viên Kỹ Thuật</h2>
        <label for="technicianSelect">Chọn nhân viên kỹ thuật:</label>
        <select id="technicianSelect" required>
            <option value="tech1">Nhân viên A</option>
            <option value="tech2">Nhân viên B</option>
            <option value="tech3">Nhân viên C</option>
            <option value="tech4">Nhân viên D</option>
        </select>
        <button class="prevBtn">Quay lại</button>
        <button id="confirmBtn">Xác Nhận</button>
    </div>

    <!-- Thông báo -->
    <p id="successMessage" style="display:none; color:green;">Nhận xe thành công!</p>
</div>

<script src="/js/nhanxe.js"></script>
</body>
</html>
