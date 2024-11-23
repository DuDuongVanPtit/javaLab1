package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.PhuTung233;

public class PhuTungDAO {
    private Connection connection;

    public PhuTungDAO(Connection connection) {
        this.connection = connection;
    }

    public List<PhuTung233> getAllParts() throws SQLException {
        List<PhuTung233> partList = new ArrayList<>();
        String sql = "SELECT * FROM phutung233";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                PhuTung233 part = new PhuTung233();
                part.setId(rs.getInt("id"));
                part.setTen(rs.getString("ten"));
                part.setDongia(rs.getDouble("dongia"));
                part.setMota(rs.getString("mota"));
                part.setSoLuongTonKho(rs.getInt("soluongtonkho"));
                partList.add(part);
            }
        }
        return partList;
    }

    public List<PhuTung233> searchParts(String partName) throws SQLException {
        List<PhuTung233> partList = new ArrayList<>();
        String sql = "SELECT * FROM phutung233 WHERE ten LIKE ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, "%" + partName + "%");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                PhuTung233 part = new PhuTung233();
                part.setId(rs.getInt("id"));
                part.setTen(rs.getString("ten"));
                part.setDongia(rs.getDouble("dongia"));
                part.setMota(rs.getString("mota"));
                part.setSoLuongTonKho(rs.getInt("soluongtonkho"));
                partList.add(part);
            }
        }
        return partList;
    }
}
