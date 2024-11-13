package controller.customer;

import model.Nhanvien233;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = {"/home", "/dat-lich-hen", "/booking"})
public class CustomerController extends HttpServlet {
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
                String brand = request.getParameter("brand");
                String[] services = request.getParameterValues("service"); // Lấy nhiều giá trị cho checkbox
                String showroom = request.getParameter("showroom");
                String date = request.getParameter("date");
                String time = request.getParameter("time");
                String note = request.getParameter("note");
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }
}
