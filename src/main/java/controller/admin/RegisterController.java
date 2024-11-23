package controller.admin;

import model.Nhanvien233;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class RegisterController extends HttpServlet {
    // Hiển thị trang đăng ký
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("views/register.jsp").forward(request, response);
    }

    // Xử lý yêu cầu đăng ký
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String username = request.getParameter("username");
//        String password = request.getParameter("password");
//        String email = request.getParameter("email");
//
//        Nhanvien233 user = new Nhanvien233(username, password, email);
//        boolean result = userService.registerUser(user);
//
//        if (result) {
//            response.sendRedirect("login.jsp");
//        } else {
//            request.setAttribute("errorMessage", "Registration failed. Try again.");
//            request.getRequestDispatcher("register.jsp").forward(request, response);
//        }
//    }
}