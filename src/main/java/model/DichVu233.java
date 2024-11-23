package model;

public class DichVu233 {
    private int id;
    private String ten;
    private double dongia;
    private String mota;
    private int status;
    public DichVu233() {
    }
    public DichVu233(int id, String ten, double dongia, String mota, int status) {
        this.id = id;
        this.ten = ten;
        this.dongia = dongia;
        this.mota = mota;
        this.status = status;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public double getDongia() {
        return dongia;
    }

    public void setDongia(double dongia) {
        this.dongia = dongia;
    }

    public String getMota() {
        return mota;
    }

    public void setMota(String mota) {
        this.mota = mota;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
