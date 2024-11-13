<%--
  Created by IntelliJ IDEA.
  User: ADMIN88
  Date: 11/11/2024
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Đặt Lịch Hẹn</title>
  <link rel="stylesheet" href="/css/customer-css/datlichhen.css">
</head>
<body>
<!-- Nhúng header -->
<jsp:include page="header.jsp" />

<!-- Nội dung chính của trang đặt lịch hẹn -->
  <div class="main-content">
    <div class="booking-container">
      <h1>Đặt Lịch Hẹn</h1>
      <p>Điền Vào Mẫu Bên Dưới Để Chúng Tôi Có Thể Lên Lịch Bảo Dưỡng Cho Quý Khách Sớm Nhất!</p>

      <form action="<%= request.getContextPath() %>/booking" method="POST">
        <div class="section">
          <div class="section-title">
            <span class="section-number">1</span> Thông tin
          </div>
          <div class="form-group">
            <label for="name">Họ tên *</label>
            <input type="text" id="name" name="name" placeholder="Nhập họ và tên" required>
          </div>
          <div class="form-row">
            <div class="form-group">
              <label for="phone">Số điện thoại *</label>
              <input type="text" id="phone" name="phone" placeholder="Nhập số điện thoại" required>
            </div>
            <div class="form-group">
              <label for="email">Email *</label>
              <input type="email" id="email" name="email" placeholder="Nhập email" required>
            </div>
          </div>
          <div class="form-group">
            <label for="brand">Hãng xe *</label>
            <select id="brand" name="brand" required>
              <option value="">Chọn hãng xe</option>
              <option value="Honda">Honda</option>
              <option value="Yamaha">Yamaha</option>
              <option value="Ford">Ford</option>
            </select>
          </div>
        </div>

        <div class="section">
          <div class="section-title">
            <span class="section-number">2</span> Dịch vụ
          </div>
          <div class="form-group">
            <label>Dịch vụ *</label>
            <div class="checkbox-group">
              <label><input type="checkbox" name="service" value="Bảo Dưỡng"> Bảo Dưỡng</label>
              <label><input type="checkbox" name="service" value="Sửa chữa chung"> Sửa chữa chung</label>
              <label><input type="checkbox" name="service" value="Bảo hành"> Bảo hành</label>
              <label><input type="checkbox" name="service" value="Sửa chữa khác"> Sửa chữa khác</label>
            </div>
          </div>
        </div>

        <div class="section">
          <div class="section-title">
            <span class="section-number">3</span> Showroom & Thời gian
          </div>
          <div class="form-group">
            <label for="showroom">Showroom *</label>
            <select id="showroom" name="showroom" required>
              <option value="">Chọn showroom</option>
              <option value="Showroom 1">Showroom 1</option>
              <option value="Showroom 2">Showroom 2</option>
              <option value="Showroom 3">Showroom 3</option>
            </select>
          </div>
          <div class="form-row">
            <div class="form-group">
              <label for="date">Thời gian *</label>
              <input type="text" id="date" name="date" placeholder="dd/mm/yyyy" required>
            </div>
            <div class="form-group">
              <label for="time">Giờ *</label>
              <select id="time" name="time" required>
                <option value="">Giờ</option>
                <option value="09:00">09:00</option>
                <option value="10:00">10:00</option>
                <option value="11:00">11:00</option>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label for="note">Ghi chú</label>
            <textarea id="note" name="note" placeholder="Ghi chú"></textarea>
          </div>
        </div>

        <button type="submit">Đặt Lịch</button>
      </form>

    </div>
  </div>
</body>
</html>

