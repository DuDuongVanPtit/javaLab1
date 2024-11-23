<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Nhanvien233" %>
<%@ page import="model.LichHen233" %>
<%@ page import="java.util.List" %>
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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        .clickable-row {
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .clickable-row:hover {
            background-color: #f1f1f1;
        }

        .selected-row {
            background-color: #ffff99 !important;
        }

    </style>
</head>
<body>
<jsp:include page="header.jsp" />
<div class="dashboard-container">
    <!-- Sidebar -->
    <jsp:include page="sidebar.jsp" />

    <!-- Main Content -->
    <div class="content-container">
        <div id="search-container" style="height: 289px; margin: 0">
            <h2>Tìm kiếm khách hàng</h2>
            <form id="searchForm" action="/admin/nhan-xe" method="get">
                <div style="display: flex; justify-content: space-around; padding: 35px 0">
                    <div class="input-group">
                        <label for="nameSearch">Họ tên:</label>
                        <input type="text" id="nameSearch" name="name"
                               placeholder="Nhập họ tên"
                               value="<%= request.getAttribute("searchName") != null ? request.getAttribute("searchName") : "" %>">
                    </div>
                    <div class="input-group">
                        <label for="phoneSearch">Số điện thoại:</label>
                        <input type="text" id="phoneSearch" name="phone"
                               placeholder="Nhập số điện thoại"
                               value="<%= request.getAttribute("searchPhone") != null ? request.getAttribute("searchPhone") : "" %>">
                    </div>
                    <div class="input-group">
                        <label for="emailSearch">Email:</label>
                        <input type="text" id="emailSearch" name="email"
                               placeholder="Nhập email"
                               value="<%= request.getAttribute("searchEmail") != null ? request.getAttribute("searchEmail") : "" %>">
                    </div>
                </div>
                <div style="display: flex; justify-content: center">
                    <button type="submit" style="width: 10%; margin: 0 10px">Tìm kiếm</button>
                    <button type="button" onclick="resetForm()" style="margin: 0 10px; width: 10%; background-color: #bbb; color: white;">Đặt lại</button>
                </div>
            </form>
        </div>
        <%
            String success = request.getParameter("success");
            if ("1".equals(success)) {
        %>
            <script>
                successPopup();
                function successPopup() {
                    Swal.fire({
                        title: 'Thành công!',
                        text: 'Khách hàng đã được thêm thành công.',
                        icon: 'success',
                        confirmButtonText: 'OK',
                        timer: 2000,
                        timerProgressBar: true
                    });
                }
            </script>
        <%
            }
        %>

        <main class="main-content">
            <div>
                <h2>Chọn Khách Hàng</h2>
                <div  style="max-height: 400px; overflow:auto;">
                    <table id="customerList" border="1">
                        <thead>
                        <tr>
                            <th>Họ tên</th>
                            <th>Số điện thoại</th>
                            <th>Email</th>
                            <th>Thời gian đăng ký</th>
                            <th>Ghi chú</th>
                            <th>status</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            List<LichHen233> lichHenList = (List<LichHen233>) request.getAttribute("lichHenList");
                            if (lichHenList != null) {
                                for (LichHen233 lichHen : lichHenList) {
                                    KhachHang233 kh = lichHen.getKhachHang();
                        %>
                            <tr class="clickable-row" data-id="<%= lichHen.getId() %>">
                                <td><%= kh.getHovaten() %></td>
                                <td><%= kh.getSodienthoai() %></td>
                                <td><%= kh.getEmail() %></td>
                                <td><%= lichHen.getNgay() + " " + lichHen.getGio() %></td>
                                <td><%= lichHen.getGhichu() %></td>
                                <td>
                                    <%
                                        int status = Integer.parseInt( lichHen.getStatus());
                                        String statusText = "";
                                        if (status == 0) {
                                            statusText = "Chưa xử lý";
                                        } else if (status == 1) {
                                            statusText = "Đang xử lý";
                                        } else if (status == 3) {
                                            statusText = "Đã xử lý";
                                        } else if (status == 4) {
                                            statusText = "Đã hủy";
                                        }
                                    %>
                                    <%= statusText %>
                                </td>
                            </tr>
                        <%
                                }
                            } else {
                        %>
                                <tr>
                                    <td colspan="6">Không có lịch hẹn nào</td>
                                </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                </div>
                <button onclick="window.location.href='/admin/them-khach-hang'" id="addCustomerBtn" style="width: 50px; margin-right: 30px"><i class="fa-solid fa-user-plus"></i></button>
                <button id="chooseServiceBtn" style="width: fit-content; background-color: #4CAF50; margin-top: 20px;">
                    Chọn dịch vụ và phụ tùng <i class="fa-solid fa-angles-right"></i>
                </button>
            </div>
        </main>
    </div>
</div>
<script>
    function resetForm() {
        const inputs = document.querySelectorAll('#searchForm input');
        inputs.forEach(input => input.value = '');
    }
    let selectedId = null;
    document.querySelectorAll(".clickable-row").forEach(row => {
        row.addEventListener("click", function () {
            document.querySelectorAll(".clickable-row").forEach(r => r.classList.remove("selected-row"));
            this.classList.add("selected-row");
            selectedId = this.getAttribute("data-id");
        });
    });

    document.getElementById("chooseServiceBtn").addEventListener("click", function () {
        if (!selectedId) {
            Swal.fire({
                title: 'Lỗi!',
                text: 'Vui lòng chọn một khách hàng trước khi tiếp tục.',
                icon: 'error',
                confirmButtonText: 'OK'
            });
        } else {
            window.location.href = `/admin/chon-dv-pt?lichhenId=${selectedId}`;
        }
    });

</script>
</body>
</html>
