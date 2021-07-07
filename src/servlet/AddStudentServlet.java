package servlet;

import bean.Student;
import org.apache.commons.beanutils.BeanUtils;
import service.StudentService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Map;
//用于添加学生信息的servlet
public class AddStudentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //创建Student对象，用于封装提交的数据
        Student student = new Student();
        Map paramap = req.getParameterMap();
        //获取前端提交的数据
        try {
            BeanUtils.populate(student,paramap);
        }catch (IllegalAccessException e) {
            e.printStackTrace();
        }catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        //创建StudentService类的对象
        StudentService service = new StudentService();
        try{
            //调用service层方法完成添加
            service.addStudent(student);
            //添加后将请求转发回listStudent，查询所有学生信息并显示首页
            resp.sendRedirect("/ListStudentServlet");
            return;

        }catch (Exception e){
            e.printStackTrace();
            return;
        }


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
