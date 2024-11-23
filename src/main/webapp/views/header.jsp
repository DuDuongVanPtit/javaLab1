<%@ page import="model.Nhanvien233" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String currentPath = request.getRequestURI();
%>
<%
    Nhanvien233 user = (Nhanvien233) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/css/welcome.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>
<body>
    <div id="header">
        <div class="logo">
            <a href="/admin/home" style="color: #ddd"><i class="fa-solid fa-warehouse"></i> GARA MAN</a>
        </div>
        <div class="user-info">
            <span class="username" style="color: #ddd"><%= user.getUsername() %></span>
            <i style="padding-right: 5px; color: #ddd" class="fa-solid fa-chevron-down"></i>
            <img src="/image/avatar/default.jpg" alt="User Avatar" class="avatar">
            <div class="user-menu">
                <a href="profile.jsp">Thông tin cá nhân</a>
                <a href="<%= request.getContextPath() %>/admin/logout">Đăng xuất</a>
            </div>
        </div>
    </div>
    <script>
        document.querySelector('.user-info').addEventListener('click', function(event) {
            // Tìm phần tử menu
            var userMenu = document.querySelector('.user-menu');

            // Kiểm tra nếu menu đang hiển thị, thì ẩn nó
            if (userMenu.style.display === 'block') {
                userMenu.style.display = 'none';
            } else {
                // Nếu không thì hiển thị nó
                userMenu.style.display = 'block';
            }

            // Ngăn không cho sự kiện click tiếp tục truyền xuống các phần tử con
            event.stopPropagation();
        });

        // Đảm bảo nếu click bên ngoài user-info thì menu sẽ ẩn
        document.addEventListener('click', function(event) {
            var userMenu = document.querySelector('.user-menu');
            if (!event.target.closest('.user-info')) {
                userMenu.style.display = 'none';
            }
        });
    </script>
</body>
</html>
