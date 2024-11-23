package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.DichVu233;

public class DichVuDAO {
    private Connection connection;

    public DichVuDAO(Connection connection) {
        this.connection = connection;
    }

    public List<DichVu233> getAllServices() throws SQLException {
        List<DichVu233> serviceList = new ArrayList<>();
        String sql = "SELECT * FROM dichvu233";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                DichVu233 service = new DichVu233();
                service.setId(rs.getInt("id"));
                service.setTen(rs.getString("ten"));
                service.setDongia(rs.getDouble("dongia"));
                service.setMota(rs.getString("mota"));
                service.setStatus(rs.getInt("status")); // Thêm trường status
                serviceList.add(service);
            }
        }
        return serviceList;
    }

    public List<DichVu233> searchServices(String serviceName) throws SQLException {
        List<DichVu233> serviceList = new ArrayList<>();
        String sql = "SELECT * FROM dichvu233 WHERE ten LIKE ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, "%" + serviceName + "%");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                DichVu233 service = new DichVu233();
                service.setId(rs.getInt("id"));
                service.setTen(rs.getString("ten"));
                service.setDongia(rs.getDouble("dongia"));
                service.setMota(rs.getString("mota"));
                service.setStatus(rs.getInt("status")); // Thêm trường status
                serviceList.add(service);
            }
        }
        return serviceList;
    }
}
