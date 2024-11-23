package controller.customer;

import dao.KhachHangDAO;
import utils.DatabaseConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

@WebServlet(urlPatterns = {"/home", "/dat-lich-hen", "/booking"})
public class DatLichController extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        String path = request.getServletPath();
        switch (path) {
            case "/home":
                request.getRequestDispatcher("customer-views/home.jsp").forward(request, response);
                break;
            case "/dat-lich-hen":
                request.getRequestDispatcher("customer-views/datlichhen.jsp").forward(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getServletPath();

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        switch (path) {
            case "/booking":
                String name = request.getParameter("name");
                String phone = request.getParameter("phone");
                String email = request.getParameter("email");
                String date = request.getParameter("date");
                String newDate = convertDateFormat(date);
                String time = request.getParameter("time");
                String note = request.getParameter("note");
                response.setContentType("application/json");
                try (Connection connection = DatabaseConnection.getConnection()) {
                    KhachHangDAO khachHangDAO = new KhachHangDAO(connection);
                    Integer customerId = khachHangDAO.getCustomerIdByPhone(phone);
                    customerId = khachHangDAO.getCustomerIdByEmail(email);
                    if (customerId == null) {
                        customerId = khachHangDAO.addCustomer(name, phone, email);
                    }
                    boolean isAdded = khachHangDAO.addLichhen(newDate, time, note, customerId, null, null, 0);
                    if (isAdded) {
                        response.getWriter().write("{\"status\": \"success\", \"message\": \"Đặt lịch hẹn thành công!\"}");
                    } else {
                        request.setAttribute("error", "Không thể thêm lịch hẹn. Vui lòng thử lại.");
                        request.getRequestDispatcher("/customer-views/datlichhen.jsp").forward(request, response);
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi xử lý khách hàng và lịch hẹn");
                }

                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
    }
    private String convertDateFormat(String date) throws ServletException {
        try {
            SimpleDateFormat inputFormat = new SimpleDateFormat("dd/MM/yyyy");
            SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");
            return outputFormat.format(inputFormat.parse(date));
        } catch (Exception e) {
            throw new ServletException("Sai định dạng ngày tháng", e);
        }
    }
}
