package servlet.taskManage;

import bean.Task;
import org.apache.commons.beanutils.BeanUtils;
import service.TaskService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.Map;

@WebServlet("/AddTask")
public class AddTaskServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        服务层对象
        TaskService service = new TaskService();
        //获得前端提交的表单
        Map paramap = request.getParameterMap();
        Task task = new Task();
        //获取前端提交的数据
        try {
            BeanUtils.populate(task,paramap);
        }catch (IllegalAccessException e) {
            e.printStackTrace();
        }catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        //调用service层方法完成添加
        try {
            service.addTask(task);
            response.sendRedirect("/ListTask?index=1");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);

    }
}
