package service;

import bean.User;
import dao.UserDao;

import javax.security.auth.login.LoginException;
import java.sql.SQLException;

public class UserService {
    //操作dao提供登录服务
    private UserDao userDao = new UserDao();
    public User login(String username, String password) throws SQLException, LoginException {
        try {
            //根据登陆时表单输入的用户名和密码，查找用户
            User user = userDao.findUser(username,password);
            //如果找不到，则提示“用户名或密码错误”
            if(user!=null){
                return user;
            }
            throw new LoginException("用户名或密码错误");
        } catch (SQLException e) {
            e.printStackTrace();
            throw new LoginException("登录失败");
        }
    }
}
