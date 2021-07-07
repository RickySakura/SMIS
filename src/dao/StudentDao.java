package dao;

import bean.Count;
import bean.Student;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.DataSourceUtils;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentDao {
    QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
    //查询所有学生信息，并封装列表中

    public List<Student> listAll(int index,int colnum) throws SQLException{
        String sql = "select * from students limit ?,?";
        return runner.query(sql,new BeanListHandler<Student>(Student.class),index,colnum);
    }
   //后台系统，通过id查询学生信息
    public Student findById(String id) throws SQLException {
        String sql = "select * from students where id=?";
        return runner.query(sql,new BeanHandler<Student>(Student.class),id);
    }
    //向数据库中添加字段
    public void addStudent(Student student) throws SQLException{
        String sql = "insert into students values(?,?,?,?,?)";
        //将封装在bean中的数据添加到表中
        runner.update(sql,student.getId(),student.getName(),student.getGender(),student.getAddress(),student.getTelephone());
    }
    //后台系统，根据id删除学生信息
    public void deleteStudent(String id) throws SQLException{
        String sql = "delete from students where id=?";
        runner.update(sql,id);
    }
    //后台系统，通过id修改学生信息
    public void editStudent(Student student,String id) throws SQLException{
        String sql = "update students set id=?,name=?,gender=?,address=?,telephone=? where id=?";
        //创建集合并将信息添加到集合中
        runner.update(sql,student.getId(),student.getName(),student.getGender(),student.getAddress(),student.getTelephone(),id);
    }

    //由于mysql的聚集函数（count，sum等等...）查询出来的值都没有名字，所以数据库引擎无法识别他们的结果也就无法放到bean中封装，所以最简单的解决办法就是用as给别名。
    public Count count() throws SQLException {
        String sql = "SELECT COUNT(*) AS COUNT FROM students";
        return runner.query(sql,new BeanHandler<Count>(Count.class));
    }

}
