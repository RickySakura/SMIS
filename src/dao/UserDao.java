package dao;

import bean.User;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import utils.DataSourceUtils;
import java.sql.SQLException;

public class UserDao {
    //根据用户名和密码查找用户
    public User findUser(String username,String password) throws SQLException{
        String sql = "select * from user where username=? and password=?";
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        return runner.query(sql,new BeanHandler<User>(User.class),username,password);
    }

}
