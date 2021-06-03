package servlet;

import bean.User;
import service.UserService;

import javax.security.auth.login.LoginException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取登录页面输入的用户名和密码
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        //调用service完成登录
        UserService service = new UserService();
        try{
            User user=service.login(username,password);
            req.getSession().setAttribute("user",user);
            resp.sendRedirect("/ListStudentServlet");
        }catch (Exception e){
            //如果出现错误，将错误信息存储到req，并跳转回登录页面显示错误信息
            e.printStackTrace();
            req.setAttribute("error_message",e.getMessage());
            req.getRequestDispatcher("/index.jsp").forward(req,resp);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
