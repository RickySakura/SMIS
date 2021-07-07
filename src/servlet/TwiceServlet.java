package servlet;

import bean.Student;
import service.StudentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
@WebServlet("/TwiceServlet")
public class TwiceServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //判断是否插入两次相同的数据
        String id = req.getParameter("id");
        StudentService service = new StudentService();
        try {
            Student student = service.find(id);
            if(student!=null){
                resp.sendRedirect(req.getContextPath()+"/error/TwiceInsertError.jsp");
                return;
            }
            req.getRequestDispatcher("/AddStudentServlet").forward(req,resp);
            return;
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       this.doGet(req, resp);
    }
}
