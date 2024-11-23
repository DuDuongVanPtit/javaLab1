<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.*" %>
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
</head>
<body>
<jsp:include page="header.jsp" />
<div class="dashboard-container">
    <!-- Sidebar -->
    <jsp:include page="sidebar.jsp" />
    <!-- Main Content -->
    <div style="width: calc(100% - 250px); height: calc(100vh - 50px); overflow: auto">
        <div class="content-container">
            <main class="main-content" style="display: flex; justify-content: space-between; margin: 0">
                <div class="search-container" style="width: 45%;">
                    <h2 class="customer-info-title">Thông tin khách hàng</h2>
                    <input type="hidden" id="lichhenId" value="<%= request.getParameter("lichhenId") != null ? request.getParameter("lichhenId") : "" %>">
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
                    <div style="display: flex; justify-content: space-between">
                        <button onclick="window.location.href='/admin/nhan-xe'" style="width: fit-content; background-color: #bbb; display: block;"><i class="fa-solid fa-angles-left"></i> Chon khach hang</button>
                        <button id="chooseStaffBtn"
                                style="width: fit-content; background-color: #4CAF50; display: block;">
                            Chọn nhân viên kỹ thuật <i class="fa-solid fa-angles-right"></i>
                        </button>
                    </div>
                </div>
                <div class="search-container" style="width: 45%">
                    <h2>Tìm kiếm dịch vụ & phụ tùng</h2>
                    <form id="searchPartForm" action="/admin/chon-dv-pt" method="get">
                        <label for="serviceNameSearch">Tên dịch vụ:</label>
                        <input type="text" id="serviceNameSearch" name="serviceName"
                               placeholder="Nhập tên dịch vụ"
                               value="<%= request.getAttribute("searchServiceName") != null ? request.getAttribute("searchServiceName") : "" %>">
                        <label for="partNameSearch">Tên phụ tùng:</label>
                        <input type="text" id="partNameSearch" name="partName"
                               placeholder="Nhập tên phụ tùng"
                               value="<%= request.getAttribute("searchPartName") != null ? request.getAttribute("searchPartName") : "" %>">
                        <div style="display: flex; justify-content: center">
                            <button type="button" onclick="resetForm()" style="margin: 0 10px; width: 150px; background-color: #bbb; color: white;">Đặt lại</button>
                            <button type="submit" style="width: 150px; margin: 0 10px">Tìm kiếm</button>
                        </div>
                    </form>
                </div>
            </main>
            <main class="main-content">
                <div>
                    <h2>Chọn Dịch Vụ</h2>
                    <div style="max-height: 175px; overflow: auto">
                        <table id="serviceList" border="1">
                            <thead>
                            <tr>
                                <th>Chọn</th>
                                <th>Tên dịch vụ</th>
                                <th>Mô tả</th>
                                <th>Giá (VNĐ)</th>
                                <th>Trang thai</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                List<DichVu233> serviceList = (List<DichVu233>) request.getAttribute("serviceList");
                                if (serviceList != null && !serviceList.isEmpty()) {
                                    for (DichVu233 service : serviceList) {
                            %>
                            <tr class="clickable-row" dataServicce-id="<%= service.getId() %>">
                                <td style="text-align: center">
                                    <input type="checkbox" class="service-checkbox" value="<%= service.getId() %>">
                                </td>
                                <td><%= service.getTen() %></td>
                                <td><%= service.getMota() %></td>
                                <td><%= service.getDongia() %></td>
                                <td><%= service.getStatus() == 1 ? "Hoạt động" : "Không hoạt động" %></td>
                            </tr>
                            <%
                                }
                            } else {
                            %>
                            <tr>
                                <td colspan="4">Không tìm thấy dịch vụ phù hợp</td>
                            </tr>
                            <%
                                }
                            %>
                            </tbody>
                        </table>
                    </div>

                </div>
            </main>
            <main class="main-content">
                <div>
                    <h2>Chọn Phu Tung</h2>
                    <div style="max-height: 175px; overflow: auto">
                        <table id="partList" border="1">
                            <thead>
                            <tr>
                                <th>Chọn</th>
                                <th>Tên phụ tùng</th>
                                <th>Mô tả</th>
                                <th>Giá (VNĐ)</th>
                                <th>So luong ton kho</th>
                                <th>Số lượng chọn</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                List<PhuTung233> partList = (List<PhuTung233>) request.getAttribute("partList");
                                if (partList != null && !partList.isEmpty()) {
                                    for (PhuTung233 part : partList) {
                            %>
                            <tr class="clickable-row" dataPart-id="<%= part.getId() %>">
                                <td style="text-align: center">
                                    <input type="checkbox" class="part-checkbox" value="<%= part.getId() %>">
                                </td>
                                <td><%= part.getTen() %></td>
                                <td><%= part.getMota() %></td>
                                <td><%= part.getDongia() %></td>
                                <td style="text-align: center"><%= part.getSoLuongTonKho() %></td>
                                <td style="text-align: center">
                                    <input style="margin: 0; padding: 5px 0; width: 60px; text-align: center" type="number" class="part-quantity" data-stock="<%= part.getSoLuongTonKho() %>"
                                           min="1" max="<%= part.getSoLuongTonKho() %>" value="1" disabled>
                                </td>
                            </tr>
                            <%
                                }
                            } else {
                            %>
                            <tr>
                                <td colspan="4">Không tìm thấy phụ tùng phù hợp</td>
                            </tr>
                            <%
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </main>
        </div>
    </div>
</div>
<script>
    function resetForm() {
        const inputs = document.querySelectorAll('#searchPartForm input');
        inputs.forEach(input => input.value = '');
    }
    document.addEventListener("DOMContentLoaded", () => {
        let selectedServices = [];
        let selectedParts = [];
        document.querySelectorAll(".service-checkbox").forEach(checkbox => {
            checkbox.addEventListener("change", function () {
                if (this.checked) {
                    selectedServices.push(this.value);
                } else {
                    selectedServices = selectedServices.filter(id => id !== this.value);
                }
            });
        });
        document.querySelectorAll(".part-checkbox").forEach(checkbox => {
            checkbox.addEventListener("change", function () {
                const quantityInput = this.closest("tr").querySelector(".part-quantity");
                if (this.checked) {
                    quantityInput.disabled = false;
                    selectedParts.push({
                        id: this.value,
                        quantity: quantityInput.value
                    });
                } else {
                    quantityInput.disabled = true;
                    selectedParts = selectedParts.filter(part => part.id !== this.value);
                }
            });
        });
        document.querySelectorAll(".part-quantity").forEach(input => {
            input.addEventListener("input", function () {
                const maxStock = parseInt(this.getAttribute("data-stock"), 10);

                if (parseInt(this.value, 10) > maxStock) {
                    this.value = maxStock; // Giới hạn giá trị bằng tồn kho
                } else if (parseInt(this.value, 10) < 1 || this.value === "") {
                    this.value = 1;
                }

                const partId = this.closest("tr").querySelector(".part-checkbox").value;
                selectedParts = selectedParts.map(part =>
                    part.id === partId ? { ...part, quantity: this.value } : part
                );
            });
        });
        document.getElementById("chooseStaffBtn").addEventListener("click", function () {
            const lichhenId = document.getElementById("lichhenId").value;
            if (selectedServices.length === 0 && selectedParts.length === 0) {
                Swal.fire({
                    title: "Lỗi!",
                    text: "Vui lòng chọn ít nhất một dịch vụ hoặc phụ tùng trước khi tiếp tục.",
                    icon: "error",
                    confirmButtonText: "OK"
                });
                return;
            }
            let params = new URLSearchParams();
            params.append("lichhenId", lichhenId);
            selectedServices.forEach(serviceId => {
                params.append("services", serviceId);
            });
            selectedParts.forEach(part => {
                params.append("parts", part.id);
                params.append("quantities", part.quantity);
            });
            window.location.href = `/admin/chon-nv-kt?${params.toString()}`;
        });
    });

</script>
</body>
</html>
