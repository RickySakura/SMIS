package dao;

import bean.FileBean;
import bean.User;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.DataSourceUtils;

import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDao {
    private QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
    //根据用户名和密码查找用户
    public User findUser(String username, String password) throws SQLException {
        String sql = "select * from user where username=? and password=?";
        return runner.query(sql, new BeanHandler<User>(User.class), username, password);
    }
    //上传用户指定文件的地址到数据库中
    public void addFile(String username, FileBean fileBean) throws SQLException {
        String sql = "insert into filelist (username,filename,fileurl,datetime) values(?,?,?,?)";
        runner.update(sql,username,fileBean.getFilename(),fileBean.getFileurl(),fileBean.getDatetime());
    }
    //查询属于用户的文件信息，并封装到列表中
    public List<FileBean> list(String username,int index,int colnum) throws SQLException{
        String sql = "select * from filelist where username=? limit ?,?";
        return runner.query(sql,new BeanListHandler<FileBean>(FileBean.class),username,index,colnum);
    }

    //管理员权限：查询所有用户的文件信息并分页，后封装到列表中
    public List<FileBean> listAll(int index,int colnum) throws SQLException{
        String sql = "select * from filelist limit ?,?";
        return runner.query(sql,new BeanListHandler<FileBean>(FileBean.class),index,colnum);
    }
    //查询数据库里的总数据条数
    //由于mysql的聚集函数（count，sum等等...）查询出来的值都没有名字，所以数据库引擎无法识别他们的结果也就无法放到bean中封装，所以最简单的解决办法就是用as给别名。
    public FileBean count() throws SQLException {
        String sql = "SELECT COUNT(*) AS num FROM filelist";
        return runner.query(sql,new BeanHandler<FileBean>(FileBean.class));
    }
    public FileBean count2(String username) throws SQLException{
        String sql="SELECT COUNT(*) AS num FROM filelist where username=?";
        return runner.query(sql,new BeanHandler<FileBean>(FileBean.class),username);
    }


    //根据文件地址删除数据库中的文件信息
    public void DeletFile(String fileurl) throws SQLException {
        String sql = "delete from filelist where fileurl=?";
        runner.update(sql,fileurl);
    }


}
