<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Đặt Lịch Hẹn</title>
  <link rel="stylesheet" href="/css/customer-css/datlichhen.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
</head>
<body>
<jsp:include page="header.jsp" />
<div class="main-content">
  <div class="booking-container">
    <h1>Đặt Lịch Hẹn</h1>
    <div id="message" style="display: none; color: green;"></div>
    <form id="bookingForm">
      <div class="section">
        <div class="section-title"><span class="section-number">1</span> Thông tin</div>
        <div class="form-group">
          <label for="name">Họ tên <span style="color: red">*</span></label>
          <input type="text" id="name" name="name" placeholder="Nhập họ và tên" required>
          <span class="error-message" id="nameError" style="color: red; display: none;">Vui lòng nhập họ tên.</span>
        </div>
        <div class="form-row">
          <div class="form-group">
            <label for="phone">Số điện thoại <span style="color: red">*</span></label>
            <input type="text" id="phone" name="phone" placeholder="Nhập số điện thoại" required>
            <span class="error-message" id="phoneError" style="color: red; display: none;">Vui lòng nhập số điện thoại.</span>
          </div>
          <div class="form-group">
            <label for="email">Email <span style="color: red">*</span></label>
            <input type="email" id="email" name="email" placeholder="Nhập email" required>
            <span class="error-message" id="emailError" style="color: red; display: none;">Vui lòng nhập email.</span>
          </div>
        </div>
      </div>
      <div class="section">
        <div class="section-title"><span class="section-number">2</span> Thời gian</div>
        <div class="form-row">
          <div class="form-group">
            <label for="date">Ngày <span style="color: red">*</span></label>
            <input type="text" id="date" name="date" placeholder="dd/mm/yyyy" required>
            <span class="error-message" id="dateError" style="color: red; display: none;">Vui lòng chọn ngày.</span>
          </div>
          <div class="form-group">
            <label for="time">Giờ <span style="color: red">*</span></label>
            <select id="time" name="time" required>
              <option value="">Giờ</option>
              <option value="08:00">08:00</option>
              <option value="08:30">08:30</option>
              <option value="09:00">09:00</option>
              <option value="09:30">09:30</option>
              <option value="10:00">10:00</option>
              <option value="10:30">10:30</option>
              <option value="11:00">11:00</option>
              <option value="11:30">11:30</option>
              <option value="12:00">12:00</option>
              <option value="12:30">12:30</option>
              <option value="13:00">13:00</option>
              <option value="13:30">13:30</option>
              <option value="14:00">14:00</option>
              <option value="14:30">14:30</option>
              <option value="15:00">15:00</option>
              <option value="15:30">15:30</option>
              <option value="16:00">16:00</option>
              <option value="16:30">16:30</option>
              <option value="17:00">17:00</option>
              <option value="17:30">17:30</option>
              <option value="18:00">18:00</option>
              <option value="18:30">18:30</option>
              <option value="19:00">19:00</option>
              <option value="19:30">19:30</option>
              <option value="20:00">20:00</option>
            </select>
            <span class="error-message" id="timeError" style="color: red; display: none;">Vui lòng chọn giờ.</span>
          </div>
        </div>
        <div class="form-group">
          <label for="note">Ghi chú</label>
          <textarea id="note" name="note" placeholder="Ghi chú"></textarea>
        </div>
      </div>
      <button id="booking-btn" type="button" onclick="submitBooking()">Gửi yêu cầu <i class="fa-solid fa-arrow-right"></i> </button>
    </form>
  </div>
</div>

<script>
  function submitBooking() {
    event.preventDefault();
    if (!validateForm()) {
      return;
    }
    var formData = $("#bookingForm").serialize();

    $.ajax({
      type: "POST",
      url: "/booking",
      data: formData,
      success: function(response) {
        if (response.status === "success") {
          Swal.fire({
            title: 'Thành công!',
            text: response.message,
            icon: 'success',
            confirmButtonText: 'OK',
            timer: 2000,
            timerProgressBar: true,
            willClose: () => {
              location.reload();
            }
          }).then((result) => {
            if (result.isConfirmed) {
              location.reload();
            }
          });
        }
      },
      error: function(jqXHR, textStatus, errorThrown) {
        console.log("Error:", textStatus, errorThrown);
        console.log(jqXHR.responseText);
        $("#message").text("Có lỗi xảy ra khi đặt lịch hẹn. Vui lòng thử lại!").css("color", "red").show();
      }
    });
  }

  function validateForm() {
    let isValid = true;
    const name = document.getElementById("name").value.trim();
    const phone = document.getElementById("phone").value.trim();
    const email = document.getElementById("email").value.trim();
    const date = document.getElementById("date").value.trim();
    const time = document.getElementById("time").value;
    if (!name) {
      document.getElementById("nameError").style.display = "block";
      isValid = false;
    } else {
      document.getElementById("nameError").style.display = "none";
    }

    if (!phone) {
      document.getElementById("phoneError").style.display = "block";
      isValid = false;
    } else {
      document.getElementById("phoneError").style.display = "none";
    }

    if (!email) {
      document.getElementById("emailError").style.display = "block";
      isValid = false;
    } else {
      document.getElementById("emailError").style.display = "none";
    }
    if (!date) {
      document.getElementById("dateError").style.display = "block";
      isValid = false;
    } else {
      document.getElementById("dateError").style.display = "none";
    }

    if (!time) {
      document.getElementById("timeError").style.display = "block";
      isValid = false;
    } else {
      document.getElementById("timeError").style.display = "none";
    }
    return isValid;
  }

  $(function() {
    $("#date").datepicker({
      dateFormat: "dd/mm/yy",
      showButtonPanel: true,
      changeMonth: true,
      changeYear: true,
      yearRange: "1900:2100",
      closeText: "Clear",
      currentText: "Today"
    });
  });
</script>
</body>
</html>

