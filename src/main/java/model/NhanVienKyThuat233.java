package model;

import java.sql.Date;

public class NhanVienKyThuat233 {
    private int id;
    private String hoTen;
    private String diachi;
    private String soDienThoai;
    private String email;
    private String viTriCongViec;
    private int status;
    private Date ngaysinh;
    public NhanVienKyThuat233() {
    }
    public NhanVienKyThuat233(int id, String hoTen, String diachi, String soDienThoai, String email, String viTriCongViec, int status, Date ngaysinh) {
        this.id = id;
        this.hoTen = hoTen;
        this.diachi = diachi;
        this.soDienThoai = soDienThoai;
        this.email = email;
        this.viTriCongViec = viTriCongViec;
        this.status = status;
        this.ngaysinh = ngaysinh;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public String getDiachi() {
        return diachi;
    }

    public void setDiachi(String diachi) {
        this.diachi = diachi;
    }

    public String getSoDienThoai() {
        return soDienThoai;
    }

    public void setSoDienThoai(String soDienThoai) {
        this.soDienThoai = soDienThoai;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getViTriCongViec() {
        return viTriCongViec;
    }

    public void setViTriCongViec(String viTriCongViec) {
        this.viTriCongViec = viTriCongViec;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getNgaysinh() {
        return ngaysinh;
    }

    public void setNgaysinh(Date ngaysinh) {
        this.ngaysinh = ngaysinh;
    }
}
