package servlet.taskManage;

import bean.User;
import service.TaskService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/editStatus")
public class editStatusServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //接收表单提交的修改任务状态的参数
        String status = request.getParameter("status");
        String num1 =request.getParameter("num");
        int num = Integer.parseInt(request.getParameter("num"));
        System.out.println(status);
        //服务层对象
        TaskService service = new TaskService();
        User user = (User) request.getSession().getAttribute("user");
        try {
            service.editStatus(status,num);
                response.sendRedirect("/ListTask?index=1");
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          this.doPost(request,response);
    }
}
