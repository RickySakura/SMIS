package service;

import bean.Student;
import dao.StudentDao;

import java.sql.SQLException;
import java.util.List;

public class StudentService {
    private StudentDao dao = new StudentDao();
    //查找所有学生信息
    public List<Student> listAll() throws SQLException {
        try {
            return dao.listAll();
        } catch (SQLException e) {
            e.printStackTrace();
            //必须要throw出异常的情况
            throw new SQLException();
        }
    }
    //后台系统，根据id查找信息
    public Student find(String id) throws SQLException{
        try{
            return dao.findById(id);
        }catch (Exception e){
            e.printStackTrace();
            throw new SQLException();
        }
    }
   //插入新的信息
    public void addStudent(Student student){
        try{
            dao.addStudent(student);
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
    //后台系统，根据id删除学生信息
    public void deleteStudent(String id){
        try {
            dao.deleteStudent(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    //修改学生信息
    public void editStudent(Student student,String id)throws SQLException{
        dao.editStudent(student,id);
    }
}
