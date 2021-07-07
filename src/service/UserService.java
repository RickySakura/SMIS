package service;

import bean.FileBean;
import bean.User;
import dao.UserDao;

import javax.security.auth.login.LoginException;
import java.io.File;
import java.sql.SQLException;
import java.util.List;

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
    //操作dao提供上传文件的服务
    public void uploadfile(String username, FileBean fileBean) throws SQLException {
        userDao.addFile(username,fileBean);
    }
    //提供根据用户名进行文件列表展示的服务
    public List<FileBean> list(String username,int index,int colnum) throws SQLException {
        return userDao.list(username,index,colnum);
    }
    //管理员权限：查找所有文件列表展示的服务
    public List<FileBean> listAll(int index,int colnum) throws SQLException {
        return userDao.listAll(index,colnum);
    }

    //根据文件名删除数据库里对应的数据
    public void deletefile(String fileurl) throws SQLException {
        userDao.DeletFile(fileurl);
    }
    //查询数据库中的总条数
    public FileBean count() throws SQLException {
        return userDao.count();
    }
    public FileBean CountByName(String username) throws SQLException{
        return userDao.count2(username);
    }
}
