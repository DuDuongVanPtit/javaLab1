package dao;

import model.User;

import java.sql.*;

public class UserDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/bookstore";
    private String jdbcUsername = "root";
    private String jdbcPassword = "12345";

    private static final String INSERT_USERS_SQL = "INSERT INTO users" +
            "  (username, email, password) VALUES " +
            " (?, ?, ?);";
    private static final String SELECT_USER_BY_USERNAME = "select id, username, email, password from users where username =?";
    private static final String VALIDATE_USER = "SELECT * FROM users WHERE username = ? and password = ?";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public void registerUser(User user) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPassword());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean validateUser(String username, String password) throws SQLException {
        boolean isValid = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(VALIDATE_USER)) {
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            ResultSet rs = preparedStatement.executeQuery();
            isValid = rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isValid;
    }

    public User selectUser(String username) throws SQLException {
        User user = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_USERNAME);) {
            preparedStatement.setString(1, username);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String email = rs.getString("email");
                String password = rs.getString("password");
                user = new User(id, username, email, password);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}
