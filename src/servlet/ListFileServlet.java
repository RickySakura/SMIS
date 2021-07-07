package servlet;

import bean.FileBean;
import bean.Student;
import bean.User;
import service.StudentService;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@WebServlet("/ListFileServlet")
public class ListFileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //创建service层的对象
        UserService service1 = new UserService();
        int index= Integer.parseInt(req.getParameter("index"));
        System.out.println(index);
        if(index<=0){
            index=1;
        }
        //colnum:一页展示多少条记录
        int colnum=12;
        int startIndex = (index-1)*colnum;
        try{
            //获取session域中的user对象，获得username
            User user = (User)req.getSession().getAttribute("user");
            //获取用户的类型，判断是普通用户还是管理员
            int type = user.getType();
            //将count函数查询的总条数封装到filebean对象的num属性中。

            if(type==1){
                //如果是超级用户
                //调用service层的listAll()方法，查询文件列表并分页
                List<FileBean> list = service1.listAll(startIndex,colnum);
                //将页码上传到域中，给jsp显示
                req.setAttribute("index",index);
                FileBean num=service1.count();
                int count = num.getNum();
                if(count%colnum!=0){
                    count=(count/colnum)+1;
                }else count=count/colnum;
                req.setAttribute("count",count);
                //查询总数据条数除以每页的条数得到总页数，发送到req域中
                req.getSession().setAttribute("list",list);
                req.getRequestDispatcher(req.getContextPath()+"/pages/adminView/filelist.jsp").forward(req,resp);
                return;
            }else {
                //如果是普通用户
                //调用service层用于的list()方法，按照用户名查询文件列表
                List<FileBean> list = service1.list(user.getUsername(),startIndex,colnum);
                //将页码上传到域中，给jsp显示
                req.setAttribute("index",index);
                //将查询出的对象列表放入session域中
                FileBean num=service1.CountByName(user.getUsername());
                int count = num.getNum();
                if(count%colnum!=0){
                    count=(count/colnum)+1;
                }else count=count/colnum;
                req.setAttribute("count",count);
                //查询总数据条数除以每页的条数得到总页数，发送到req域中
                req.getSession().setAttribute("list",list);
                req.getRequestDispatcher(req.getContextPath()+"/pages/adminView/filelist.jsp").forward(req,resp);
            }
        }catch (Exception e){
            e.printStackTrace();
            resp.getWriter().write(e.getMessage());
            return;
        }
    }
}
