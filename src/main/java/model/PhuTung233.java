package model;

public class PhuTung233 {
    private int id;
    private String ten;
    private double dongia;
    private String mota;
    private int soLuongTonKho;
    public PhuTung233() {
    }
    public PhuTung233(int id, String ten, double dongia, String mota, int soLuongTonKho) {
        this.id = id;
        this.ten = ten;
        this.dongia = dongia;
        this.mota = mota;
        this.soLuongTonKho = soLuongTonKho;
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

    public int getSoLuongTonKho() {
        return soLuongTonKho;
    }

    public void setSoLuongTonKho(int soLuongTonKho) {
        this.soLuongTonKho = soLuongTonKho;
    }

}
