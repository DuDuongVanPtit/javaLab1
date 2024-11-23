package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.NhanVienKyThuat233;

public class NhanVienKyThuatDAO {
    private Connection connection;

    public NhanVienKyThuatDAO(Connection connection) {
        this.connection = connection;
    }
    public List<NhanVienKyThuat233> getAllStaff() throws SQLException {
        List<NhanVienKyThuat233> staffList = new ArrayList<>();
        String sql = "SELECT * FROM nhanvienkithuat233";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                NhanVienKyThuat233 staff = new NhanVienKyThuat233();
                staff.setId(rs.getInt("id"));
                staff.setHoTen(rs.getString("hovaten"));
                staff.setSoDienThoai(rs.getString("sodienthoai"));
                staff.setEmail(rs.getString("email"));
                staff.setViTriCongViec(rs.getString("vitricongviec"));
                staff.setStatus(rs.getInt("status"));
                staffList.add(staff);
            }
        }
        return staffList;
    }
    public List<NhanVienKyThuat233> searchStaffByName(String staffName) throws SQLException {
        List<NhanVienKyThuat233> staffList = new ArrayList<>();
        String sql = "SELECT * FROM nhanvienkithuat233 WHERE hovaten LIKE ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, "%" + staffName + "%");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                NhanVienKyThuat233 staff = new NhanVienKyThuat233();
                staff.setId(rs.getInt("id"));
                staff.setHoTen(rs.getString("hovaten"));
                staff.setSoDienThoai(rs.getString("sodienthoai"));
                staff.setEmail(rs.getString("email"));
                staff.setViTriCongViec(rs.getString("vitricongviec"));
                staff.setStatus(rs.getInt("status"));
                staff.setDiachi(rs.getString("diachi"));
                staff.setNgaysinh(rs.getDate("ngaysinh"));
                staffList.add(staff);
            }
        }
        return staffList;
    }
}

