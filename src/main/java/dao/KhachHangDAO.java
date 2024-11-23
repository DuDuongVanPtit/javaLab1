package dao;

import java.sql.*;

public class KhachHangDAO {
    private Connection connection;

    public KhachHangDAO(Connection connection) {
        this.connection = connection;
    }

    public Integer getCustomerIdByPhone(String phone) throws SQLException {
        String sql = "SELECT id FROM khachhang233 WHERE sodienthoai = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, phone);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("id");
            }
        }
        return null;
    }
    public Integer getCustomerIdByEmail(String email) throws SQLException {
        String sql = "SELECT id FROM khachhang233 WHERE email = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("id");
            }
            return null;
        }
    }

    public int addCustomer(String name, String phone, String email) throws SQLException {
        String sql = "INSERT INTO khachhang233 (hovaten, sodienthoai, email) VALUES (?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, name);
            stmt.setString(2, phone);
            stmt.setString(3, email);
            stmt.executeUpdate();

            ResultSet generatedKeys = stmt.getGeneratedKeys();
            if (generatedKeys.next()) {
                return generatedKeys.getInt(1);
            }
        }
        throw new SQLException("Không thể thêm khách hàng.");
    }

    public boolean addLichhen(String date, String time, String notes, int customerId, Object nhanvienkithuat233Id, Object staffId, int status) throws SQLException {
        String sql = "INSERT INTO lichhen233 (ngay, gio, ghichu, khachhang233id, nhanvien233id, nhanvienkithuat233id, status) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setDate(1, Date.valueOf(date));
            stmt.setTime(2, Time.valueOf(time + ":00"));
            stmt.setString(3, notes);
            stmt.setInt(4, customerId);
            if (staffId != null){
                stmt.setInt(5, Integer.parseInt(staffId.toString()));
            } else stmt.setNull(5, java.sql.Types.INTEGER);
            if(nhanvienkithuat233Id !=null){
                stmt.setInt(6, Integer.parseInt(nhanvienkithuat233Id.toString()));
            } else stmt.setNull(6, java.sql.Types.INTEGER);
            stmt.setInt(7, status);
            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        }
    }
}
