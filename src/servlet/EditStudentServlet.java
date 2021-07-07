package servlet;

import bean.Student;
import jdk.internal.org.objectweb.asm.tree.analysis.Value;
import org.apache.commons.beanutils.BeanUtils;
import service.StudentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.security.Key;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

@WebServlet("/EditServlet")
//用于编辑学生信息的servlet
public class EditStudentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //创建Student对象，用于封装提交的数据
        Student student = new Student();
        String id = req.getParameter("pid");
        Map paramap = req.getParameterMap();
        Map<String,String[]> newMap = new HashMap<>();
        newMap.putAll(paramap);
        newMap.remove("pid");

        //获取前端提交的数据
        try {
            BeanUtils.populate(student,newMap);
        }catch (IllegalAccessException e) {
            e.printStackTrace();
        }catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        //创建StudentService类的对象
        StudentService service = new StudentService();
        try{
            //调用service层方法完成添加
            service.editStudent(student,id);
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
