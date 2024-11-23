package controller.admin;

import dao.*;
import model.*;
import utils.DatabaseConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet(urlPatterns = {"/admin/nhan-xe", "/admin/them-khach-hang", "/admin/chon-dv-pt", "/admin/chon-nv-kt"})
public class NhanxeController extends HttpServlet {
    private LichHenDAO lichHenDAO = new LichHenDAO();
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String path = request.getServletPath();
        Nhanvien233 user = (Nhanvien233) session.getAttribute("user");
        switch (path){
            case "/admin/nhan-xe":
                if (user == null) {
                    response.sendRedirect(request.getContextPath() + "/admin/login");
                } else {
                    try {
                        String name = request.getParameter("name");
                        String phone = request.getParameter("phone");
                        String email = request.getParameter("email");
                        List<LichHen233> lichHenList = null;
                        if ((name == null || name.isEmpty()) &&
                                (phone == null || phone.isEmpty()) &&
                                (email == null || email.isEmpty())) {
                            lichHenList = lichHenDAO.getLichHenWithKhachHang();
                        } else {
                            lichHenList = lichHenDAO.searchLichHen(name, phone, email);
                        }
                        request.setAttribute("lichHenList", lichHenList);
                        request.setAttribute("searchName", name);
                        request.setAttribute("searchPhone", phone);
                        request.setAttribute("searchEmail", email);
                        request.getRequestDispatcher("/views/GDChonkhach233.jsp").forward(request, response);
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                }
                break;
            case "/admin/them-khach-hang":
                if (user == null) {
                    response.sendRedirect(request.getContextPath() + "/admin/login");
                } else {
                    request.getRequestDispatcher("/views/GDThemKhach233.jsp").forward(request, response);
                }
                break;
            case "/admin/chon-dv-pt":
                if (user == null) {
                    response.sendRedirect(request.getContextPath() + "/admin/login");
                } else {
                    String partName = request.getParameter("partName");
                    String serviceName = request.getParameter("serviceName");
                    Integer lichhenId = null;
                    String lichhenIdParam = request.getParameter("lichhenId");
                    if (lichhenIdParam != null && !lichhenIdParam.isEmpty()) {
                        try {
                            lichhenId = Integer.valueOf(lichhenIdParam);
                        } catch (NumberFormatException e) {
                            System.err.println("Lỗi định dạng lichhenId: " + e.getMessage());
                        }
                    }
                    if(lichhenId != null){
                        try (Connection connection = DatabaseConnection.getConnection()) {
                            LichHen233 lichHen233 = lichHenDAO.getLichHenById(lichhenId);
                            request.setAttribute("lichhen233", lichHen233);
                        } catch (SQLException e) {
                            throw new RuntimeException(e);
                        }
                    }

                    try (Connection connection = DatabaseConnection.getConnection()) {
                        DichVuDAO dichVuDAO = new DichVuDAO(connection);
                        PhuTungDAO phuTungDAO = new PhuTungDAO(connection);
                        List<DichVu233> serviceList = (serviceName == null || serviceName.isEmpty())
                                ? dichVuDAO.getAllServices()
                                : dichVuDAO.searchServices(serviceName);

                        List<PhuTung233> partList = (partName == null || partName.isEmpty())
                                ? phuTungDAO.getAllParts()
                                : phuTungDAO.searchParts(partName);
                        request.setAttribute("serviceList", serviceList);
                        request.setAttribute("partList", partList);
                        request.setAttribute("searchServiceName", serviceName);
                        request.setAttribute("searchPartName", partName);
                        request.getRequestDispatcher("/views/GDChonDVPT233.jsp").forward(request, response);
                    } catch (Exception e) {
                        e.printStackTrace();
                        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi tìm kiếm");
                    }
                }
                break;
            case "/admin/chon-nv-kt":
                if (user == null) {
                    response.sendRedirect(request.getContextPath() + "/admin/login");
                } else {
                    String lichhenIdParam = request.getParameter("lichhenId");
                    Integer lichhenId = null;
                    if (lichhenIdParam != null && !lichhenIdParam.isEmpty()) {
                        try {
                            lichhenId = Integer.parseInt(lichhenIdParam);
                        } catch (NumberFormatException e) {
                            System.err.println("Lỗi định dạng lichhenId: " + e.getMessage());
                        }
                    }
                    String[] serviceIds = request.getParameterValues("services");
                    String[] partIds = request.getParameterValues("parts");
                    String[] quantities = request.getParameterValues("quantities");
                    if(lichhenId != null){
                        try (Connection connection = DatabaseConnection.getConnection()) {
                            LichHen233 lichHen233 = lichHenDAO.getLichHenById(lichhenId);
                            request.setAttribute("lichhen233", lichHen233);
                        } catch (SQLException e) {
                            throw new RuntimeException(e);
                        }
                    }
                    String staffName = request.getParameter("staffName");
                    try (Connection connection = DatabaseConnection.getConnection()) {
                        NhanVienKyThuatDAO nvktDAO = new NhanVienKyThuatDAO(connection);

                        List<NhanVienKyThuat233> staffList = (staffName == null || staffName.isEmpty())
                                ? nvktDAO.getAllStaff()
                                : nvktDAO.searchStaffByName(staffName);

                        request.setAttribute("staffList", staffList);
                        request.setAttribute("searchStaffName", staffName);
                        request.getRequestDispatcher("/views/GDChonNVKT233.jsp").forward(request, response);
                    } catch (Exception e) {
                        e.printStackTrace();
                        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi tìm kiếm nhân viên kỹ thuật");
                    }
                }
                break;
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession(false);
        String path = request.getServletPath();
        Nhanvien233 user = (Nhanvien233) session.getAttribute("user");
        switch (path) {
            case "/admin/them-khach-hang":
                if (user == null) {
                    response.sendRedirect(request.getContextPath() + "/admin/login");
                } else {
                    String name = request.getParameter("name");
                    String phone = request.getParameter("phone");
                    String email = request.getParameter("email");
                    String appointmentTime = request.getParameter("appointmentTime");
                    String notes = request.getParameter("notes");

                    try (Connection connection = DatabaseConnection.getConnection()) {
                        KhachHangDAO khachHangDAO = new KhachHangDAO(connection);
                        String[] dateTimeParts = appointmentTime.split("T");
                        if (dateTimeParts.length != 2) {
                            throw new IllegalArgumentException("Sai định dạng thời gian.");
                        }
                        String date = dateTimeParts[0];
                        String time = dateTimeParts[1];
                        Integer customerId = khachHangDAO.getCustomerIdByPhone(phone);
                        customerId = khachHangDAO.getCustomerIdByEmail(email);
                        if (customerId == null) {
                            customerId = khachHangDAO.addCustomer(name, phone, email);
                        }
                        boolean isAdded = khachHangDAO.addLichhen(date, time, notes, customerId, null, null, 0);
                        if (isAdded) {
                            response.sendRedirect(request.getContextPath() + "/admin/nhan-xe?success=1");
                        } else {
                            request.setAttribute("error", "Không thể thêm lịch hẹn. Vui lòng thử lại.");
                            request.getRequestDispatcher("/views/GDThemKhach233.jsp").forward(request, response);
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi xử lý khách hàng và lịch hẹn");
                    }
                }
                break;
        }
    }
}
