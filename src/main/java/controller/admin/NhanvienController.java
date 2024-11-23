package controller.admin;

import dao.NhanvienDAO;
import model.Nhanvien233;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = {"/admin/login", "/admin/logout", "/admin/home", "/admin/change-password"})
public class NhanvienController extends HttpServlet {
    private NhanvienDAO nhanvienDAO = new NhanvienDAO();
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String path = request.getServletPath();
        switch (path) {
            case "/admin/login":
                request.getRequestDispatcher("/views/login.jsp").forward(request, response);
                break;
            case "/admin/logout":
                if (session != null) {
                    session.invalidate();
                }
                response.sendRedirect(request.getContextPath() + "/admin/login");
                break;
            case "/admin/home":
                HttpSession sess = request.getSession(false);
                if (sess != null && sess.getAttribute("user") != null) {
                    request.getRequestDispatcher("/views/welcome.jsp").forward(request, response);
                } else {
                    response.sendRedirect(request.getContextPath() + "/admin/login");
                }
                break;
            case "/admin/change-password":
                Nhanvien233 user = (Nhanvien233) session.getAttribute("user");
                if (user == null) {
                    response.sendRedirect(request.getContextPath() + "/admin/login");
                } else {
                    request.getRequestDispatcher("/views/change_password.jsp").forward(request, response);
                }
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getServletPath();
        HttpSession session1 = request.getSession(); // Đảm bảo session tồn tại

        switch (path) {
            case "/admin/login":
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                Nhanvien233 user = nhanvienDAO.loginUser(username, password);
                if (user != null) {
                    session1.setAttribute("user", user);
                    response.sendRedirect(request.getContextPath() + "/admin/home");
                } else {
                    request.setAttribute("errorMessage", "Invalid username or password");
                    System.out.println("Error message in login: " + request.getAttribute("errorMessage"));
                    request.getRequestDispatcher("/views/login.jsp").forward(request, response);
                }
                break;

//            case "/admin/change-password":
//                Nhanvien233 nhanvien233 = (Nhanvien233) session1.getAttribute("user");
//                if (nhanvien233 == null) {
//                    response.sendRedirect("login.jsp");
//                    return;
//                }
//
//                String currentPassword = request.getParameter("currentPassword");
//                String newPassword = request.getParameter("newPassword");
//                String confirmPassword = request.getParameter("confirmPassword");
//
//                if (!nhanvienDAO.checkPassword(nhanvien233.getUsername(), currentPassword)) {
//                    request.setAttribute("errorMessage", "Current password is incorrect.");
//                    System.out.println("Error message in change-password: " + request.getAttribute("errorMessage"));
//                    request.getRequestDispatcher("/views/change_password.jsp").forward(request, response);
//                    return;
//                }
//
//                if (!newPassword.equals(confirmPassword)) {
//                    request.setAttribute("errorMessage", "New password and confirm password do not match.");
//                    System.out.println("Error message in change-password: " + request.getAttribute("errorMessage"));
//                    request.getRequestDispatcher("/views/change_password.jsp").forward(request, response);
//                    return;
//                }
//
//                boolean updateSuccess = userService.updatePassword(nhanvien233.getUsername(), newPassword);
//                if (updateSuccess) {
//                    request.setAttribute("successMessage", "Password changed successfully.");
//                    request.getRequestDispatcher("/views/change_password.jsp").forward(request, response);
//                } else {
//                    request.setAttribute("errorMessage", "Failed to change password. Please try again.");
//                    request.getRequestDispatcher("/views/change_password.jsp").forward(request, response);
//                }
//                break;

            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

}
