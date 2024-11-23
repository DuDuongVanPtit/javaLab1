package dao;
import model.Nhanvien233;

import java.io.IOException;
import java.sql.*;
import utils.DatabaseConnection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class NhanvienDAO {
    private static final String INSERT_USER_SQL = "INSERT INTO users (username, password, email) VALUES (?, ?, ?);";
    private static final String SELECT_USER_BY_USERNAME_AND_PASSWORD = "SELECT * FROM nhanvien233 WHERE tendangnhap = ? AND matkhau = ?;";
    private static final String UPDATE_PASSWORD_SQL = "UPDATE nhanvien233 SET matkhau = ? WHERE tendangnhap = ?";

    public boolean registerUser(Nhanvien233 user) {
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_SQL)) {
            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getEmail());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public Nhanvien233 loginUser(String username, String password) {
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_USERNAME_AND_PASSWORD)) {

            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);

            try (ResultSet rs = preparedStatement.executeQuery()) {
                if (rs.next()) {
                    return new Nhanvien233(
                            rs.getString("hovaten"),
                            rs.getString("matkhau"),
                            rs.getString("email")
                    );
                }
            }
        } catch (SQLException e) {
            System.err.println("Lỗi khi đăng nhập người dùng: " + e.getMessage());
        }
        return null;
    }

    public boolean updatePassword(String username, String newPassword) {
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PASSWORD_SQL)) {
            preparedStatement.setString(1, newPassword);
            preparedStatement.setString(2, username);

            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
