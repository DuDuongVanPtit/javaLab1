package model;

import lombok.Data;

@Data
public class Nhanvien233 {
    private int id;
    private String username;
    private String password;
    private String email;

    public Nhanvien233() {}

    public Nhanvien233(String username, String password, String email) {
        this.username = username;
        this.password = password;
        this.email = email;
    }
}

