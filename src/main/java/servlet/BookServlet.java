package servlet;

import dao.BookDAO;
import model.Book;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/list-books")
public class BookServlet extends HttpServlet {
    private BookDAO bookDAO;

    public void init() {
        bookDAO = new BookDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            listBooks(request, response);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void listBooks(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Book> listBooks = bookDAO.selectAllBooks();
        request.setAttribute("books", listBooks);
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/list-books.jsp");
        dispatcher.forward(request, response);
    }

    // Các phương thức khác cho CRUD...
}
