package dao;

import model.KhachHang233;
import model.LichHen233;
import utils.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LichHenDAO {
    private Connection connection;

    public LichHenDAO() {
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

    public List<LichHen233> getLichHenWithKhachHang() throws SQLException {
        List<LichHen233> resultList = new ArrayList<>();
        String sql = "SELECT lh.id, lh.ngay, lh.gio, lh.ghichu, lh.status, "
                + "kh.hovaten, kh.sodienthoai, kh.email "
                + "FROM lichhen233 lh "
                + "JOIN khachhang233 kh ON lh.khachhang233id = kh.id";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
             ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                LichHen233 lichHen = new LichHen233();
                lichHen.setId(rs.getInt("id"));
                lichHen.setNgay(rs.getDate("ngay"));
                lichHen.setGio(rs.getTime("gio"));
                lichHen.setGhichu(rs.getString("ghichu"));
                lichHen.setStatus(rs.getString("status"));

                KhachHang233 khachHang = new KhachHang233();
                khachHang.setHovaten(rs.getString("hovaten"));
                khachHang.setSodienthoai(rs.getString("sodienthoai"));
                khachHang.setEmail(rs.getString("email"));

                lichHen.setKhachHang(khachHang);
                resultList.add(lichHen);
            }
        }
        return resultList;
    }
    public List<LichHen233> searchLichHen(String name, String phone, String email) throws SQLException {
        List<LichHen233> resultList = new ArrayList<>();
        String sql = "SELECT lh.id, lh.ngay, lh.gio, lh.ghichu, lh.status, "
                + "kh.hovaten, kh.sodienthoai, kh.email "
                + "FROM lichhen233 lh "
                + "JOIN khachhang233 kh ON lh.khachhang233id = kh.id "
                + "WHERE (kh.hovaten LIKE ? OR ? IS NULL) "
                + "AND (kh.sodienthoai LIKE ? OR ? IS NULL) "
                + "AND (kh.email LIKE ? OR ? IS NULL)";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, name != null && !name.isEmpty() ? "%" + name + "%" : null);
            stmt.setString(2, name != null && !name.isEmpty() ? "%" + name + "%" : null);
            stmt.setString(3, phone != null && !phone.isEmpty() ? "%" + phone + "%" : null);
            stmt.setString(4, phone != null && !phone.isEmpty() ? "%" + phone + "%" : null);
            stmt.setString(5, email != null && !email.isEmpty() ? "%" + email + "%" : null);
            stmt.setString(6, email != null && !email.isEmpty() ? "%" + email + "%" : null);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                LichHen233 lichHen = new LichHen233();
                lichHen.setId(rs.getInt("id"));
                lichHen.setNgay(rs.getDate("ngay"));
                lichHen.setGio(rs.getTime("gio"));
                lichHen.setGhichu(rs.getString("ghichu"));
                lichHen.setStatus(rs.getString("status"));

                KhachHang233 khachHang = new KhachHang233();
                khachHang.setHovaten(rs.getString("hovaten"));
                khachHang.setSodienthoai(rs.getString("sodienthoai"));
                khachHang.setEmail(rs.getString("email"));

                lichHen.setKhachHang(khachHang);
                resultList.add(lichHen);
            }
        }
        return resultList;
    }
    public LichHen233 getLichHenById(int id) throws SQLException {
        String sql = "SELECT lh.id, lh.ngay, lh.gio, lh.ghichu, lh.status, "
                + "kh.hovaten, kh.sodienthoai, kh.email "
                + "FROM lichhen233 lh "
                + "JOIN khachhang233 kh ON lh.khachhang233id = kh.id "
                + "WHERE lh.id = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    LichHen233 lichHen = new LichHen233();
                    lichHen.setId(rs.getInt("id"));
                    lichHen.setNgay(rs.getDate("ngay"));
                    lichHen.setGio(rs.getTime("gio"));
                    lichHen.setGhichu(rs.getString("ghichu"));
                    lichHen.setStatus(rs.getString("status"));
                    KhachHang233 khachHang = new KhachHang233();
                    khachHang.setHovaten(rs.getString("hovaten"));
                    khachHang.setSodienthoai(rs.getString("sodienthoai"));
                    khachHang.setEmail(rs.getString("email"));
                    lichHen.setKhachHang(khachHang);
                    return lichHen;
                }
            }
        }
        return null;
    }

}
