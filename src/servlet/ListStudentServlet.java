package servlet;

import bean.Count;
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
        int index= Integer.parseInt(req.getParameter("index"));
        if(index<=0){
            index=1;
        }
        int colnum=14;
        int startIndex = (index-1)*colnum;

        try{
            //调用service层用于查询所有用户信息的listAll()方法
            List<Student> ls= service.listAll(startIndex,colnum);
            //将查询出的对象列表放入request域中
            req.setAttribute("ls",ls);
            //将页码上传到域中，给jsp显示
            //查询总数据条数除以每页的条数得到总页数，发送到req域中
            req.setAttribute("index",index);
            Count num=service.count();
            int count = num.getCOUNT();
            if(count%colnum!=0){
                count=(count/colnum)+1;
            }else count=count/colnum;
            req.setAttribute("count",count);

            User user = (User)req.getSession().getAttribute("user");
            //获取用户的类型，判断是普通用户还是管理员
            int type = user.getType();
            if(type==1){
                req.getRequestDispatcher(req.getContextPath()+"/pages/adminView/home.jsp").forward(req,resp);

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
