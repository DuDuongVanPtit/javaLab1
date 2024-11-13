package service;


import dao.NhanvienDAO;
import model.Nhanvien233;

public class UserService {
    private NhanvienDAO nhanvienDAO = new NhanvienDAO();

    public boolean registerUser(Nhanvien233 user) {
        return nhanvienDAO.registerUser(user);
    }

    public Nhanvien233 loginUser(String username, String password) {
        return nhanvienDAO.loginUser(username, password);
    }

    public boolean checkPassword(String username, String password) {
        Nhanvien233 user = nhanvienDAO.loginUser(username, password);
        return user != null;
    }

    public boolean updatePassword(String username, String newPassword) {
        return nhanvienDAO.updatePassword(username, newPassword);
    }
}
