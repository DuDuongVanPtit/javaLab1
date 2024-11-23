package model;

import java.sql.Date;
import java.sql.Time;

public class LichHen233 {
    private int id;
    private Date ngay;
    private Time gio;
    private String ghichu;
    private String status;
    private KhachHang233 khachHang;

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public Date getNgay() { return ngay; }
    public void setNgay(Date ngay) { this.ngay = ngay; }
    public Time getGio() { return gio; }
    public void setGio(Time gio) { this.gio = gio; }
    public String getGhichu() { return ghichu; }
    public void setGhichu(String ghichu) { this.ghichu = ghichu; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public KhachHang233 getKhachHang() { return khachHang; }
    public void setKhachHang(KhachHang233 khachHang) { this.khachHang = khachHang; }
}
