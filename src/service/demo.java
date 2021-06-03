package service;

import bean.User;
import dao.UserDao;

import java.sql.SQLException;

public class demo {
    public static void main(String[] args) throws SQLException {
        String username = "root";
        String password = "root";
        UserDao userDao = new UserDao();
        try {
            User user = userDao.findUser(username,password);
            System.out.println(user.getType());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
