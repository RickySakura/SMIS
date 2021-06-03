package servlet;

import bean.Student;
import bean.User;
import service.StudentService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
//展示学生信息的列表
public class ListStudentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //创建service层的对象
        StudentService service = new StudentService();

        try{
            //调用service层用于查询所有学生信息的listAll()方法
            List<Student> ls= service.listAll();
            //将查询出的对象列表放入request域中
            req.setAttribute("ls",ls);
            //将请求转发到list.jsp
            User user = (User)req.getSession().getAttribute("user");
            //获取用户的类型，判断是普通用户还是管理员
            int type = user.getType();
            if(type==1){
                req.getRequestDispatcher(req.getContextPath()+"/pages/adminView/home.jsp").forward(req,resp);
                return;
            }else {
                req.getRequestDispatcher(req.getContextPath()+"/pages/userView/list.jsp").forward(req,resp);
            }
        }catch (Exception e){
            e.printStackTrace();
            resp.getWriter().write(e.getMessage());
            return;
        }
    }
}
