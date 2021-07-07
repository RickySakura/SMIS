package servlet.taskManage;

import service.TaskService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class GroupByDate extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //接收从jsp提交来的所有参数
        String date = req.getParameter("date");
        String num = req.getParameter("num");
        String type = req.getParameter("type");
        //判断是否要按日期查询
        //否，转发到任务列表
        if("0".equals(date)&&"0".equals(type)){
            req.getRequestDispatcher("/ListTask").forward(req,resp);
            return;
        }
        //是,新建服务，提供按时间查询
        TaskService service = new TaskService();

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req,resp);
    }
}
