<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Nhanvien233" %>
<%@ page import="model.NhanVienKyThuat233" %>
<%@ page import="java.util.List" %>
<%@ page import="model.LichHen233" %>
<%@ page import="model.KhachHang233" %>
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
        <main class="main-content" style="display: flex; justify-content: space-between; margin: 0; height: 289px">
            <div class="search-container" style="width: 45%;">
                <h2 class="customer-info-title">Thông tin khách hàng</h2>
                <div class="customer-info-container">
                    <%
                        LichHen233 lichHen233 = (LichHen233) request.getAttribute("lichhen233");
                        if (lichHen233 != null) {
                            KhachHang233 kh = lichHen233.getKhachHang();
                    %>
                    <ul class="customer-info-list">
                        <li><strong>Tên:</strong> <%= kh != null ? kh.getHovaten() : "Không có thông tin" %></li>
                        <li><strong>SĐT:</strong> <%= kh != null ? kh.getSodienthoai() : "Không có thông tin" %></li>
                        <li><strong>Email:</strong> <%= kh != null ? kh.getEmail() : "Không có thông tin" %></li>
                        <li><strong>Ngày:</strong> <%= lichHen233.getNgay() != null ? lichHen233.getNgay() : "Không có thông tin" %></li>
                        <li><strong>Giờ:</strong> <%= lichHen233.getGio() != null ? lichHen233.getGio() : "Không có thông tin" %></li>
                    </ul>
                    <ul class="customer-service-list">
                        <li><strong>Ghi chú:</strong> <%= lichHen233.getGhichu() != null ? lichHen233.getGhichu() : "Không có ghi chú" %></li>
                        <li><strong>Dịch vụ:</strong></li>
                        <li><strong>Phụ tùng:</strong></li>
                    </ul>
                    <%
                    } else {
                    %>
                    <ul class="customer-info-list">
                        <li><strong>Thông báo:</strong> Không có lịch hẹn để hiển thị.</li>
                    </ul>
                    <%
                        }
                    %>
                </div>
                <div style="display: flex; justify-content: center">
                    <button onclick="window.location.href='/admin/chon-nv-kt'" style="width: fit-content; background-color: #4CAF50; display: block;">Hoan thanh nhan khach <i class="fa-solid fa-check"></i></button>
                </div>
            </div>
            <div class="search-container" style="width: 45%">
                <h2>Tìm kiếm nhân viên kỹ thuật</h2>
                <form id="searchStaffForm" action="/admin/chon-nv-kt" method="get">
                    <label for="staffNameSearch">Tên nhân viên kỹ thuật:</label>
                    <input type="text" id="staffNameSearch" name="staffName"
                           placeholder="Nhập tên nhân viên kỹ thuật"
                           value="<%= request.getAttribute("searchStaffName") != null ? request.getAttribute("searchStaffName") : "" %>">
                    <div style="display: flex; justify-content: center">
                        <button type="button" onclick="resetForm()" style="margin: 0 10px; width: 150px; background-color: #bbb; color: white;">Đặt lại</button>
                        <button type="submit" style="width: 150px; margin: 0 10px">Tìm kiếm</button>
                    </div>
                </form>
            </div>
        </main>
        <main class="main-content" style="max-height: 500px">
            <div>
                <h2>Chọn nhân viên kỹ thuật</h2>
                <table id="staffList" border="1">
                    <thead>
                    <tr>
                        <th>Họ tên</th>
                        <th>Số điện thoại</th>
                        <th>Email</th>
                        <th>Vị trí công việc</th>
                        <th>Trạng thái</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        List<NhanVienKyThuat233> staffList = (List<NhanVienKyThuat233>) request.getAttribute("staffList");
                        if (staffList != null && !staffList.isEmpty()) {
                            for (NhanVienKyThuat233 staff : staffList) {
                    %>
                    <tr>
                        <td><%= staff.getHoTen() %></td>
                        <td><%= staff.getSoDienThoai() %></td>
                        <td><%= staff.getEmail() %></td>
                        <td><%= staff.getViTriCongViec() %></td>
                        <td><%= staff.getStatus() == 1 ? "Đang làm việc" : "Nghỉ việc" %></td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="5">Không tìm thấy nhân viên phù hợp</td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>

        </main>
    </div>
</div>
<script>
    function resetForm() {
        const inputs = document.querySelectorAll('#searchForm input');
        inputs.forEach(input => input.value = '');
    }
</script>
</body>
</html>
