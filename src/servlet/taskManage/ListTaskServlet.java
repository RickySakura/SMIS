package servlet.taskManage;

import bean.Task;
import bean.User;
import service.TaskService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/ListTask")
public class ListTaskServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获得LoginServlet中放到session域中的user对象
        User user = (User) request.getSession().getAttribute("user");
        TaskService service = new TaskService();
        //获得当前用户登录的用户类型
        int type = user.getType();
        //获得用户提交的按任务状态查询请求
        String status = (request.getParameter("stat"));
        System.out.println(status);
        //把请求状态发到jsp页面，给<c:when>判断
        request.setAttribute("stat",status);
        //公共部分：
        //创建列表分页索引
        int index= Integer.parseInt(request.getParameter("index"));
        if(index<=0){
            index=1;
        }
        int colnum=13;
        index = (index-1)*colnum;
        //将页码上传到域中，给jsp显示
        request.setAttribute("index",index);
        //调用服务根据用户类型查询
        try {
            Task num = service.count(type,user.getUsername());
            int count = num.getNum();
            //查询总数据条数除以每页的条数得到总页数，发送到req域中
            if(count%colnum!=0){
                count=(count/colnum)+1;
            }else count=count/colnum;
            request.setAttribute("count",count);

        } catch (SQLException e) {
            e.printStackTrace();
        }

//        获得所有从表单提交上来的查询请求
        //接收从jsp提交来的所有参数

        String date = request.getParameter("date");
        String beginDate = null;
        String endDate=null;
        if(null!=date&&!("0".equals(date))){
            beginDate = date.substring(0,date.indexOf("~"));
            endDate = date.substring(date.lastIndexOf("~")+1);
        }
        try {
           int stat;
            if(null!=status){
                stat=Integer.parseInt(status);
            }else stat=2;
            List<Task>list = service.eightMethodQuery(user.getType(),beginDate,endDate,user.getUsername(),index,colnum,stat);
            request.getSession().setAttribute("list",list);
            if(type==1){request.getRequestDispatcher(request.getContextPath()+"/pages/adminView/tasklist.jsp").forward(request,response);}
            else{request.getRequestDispatcher(request.getContextPath()+"/pages/userView/mytask.jsp").forward(request,response);}
        } catch (SQLException e) {
            e.printStackTrace();
        }

//        //分离部分：根据用户请求，如果需要按任务状态分组，就不查询全部,同时也要有分页和按用户查询功能
//        //1.有分类查询请求 未完成/已完成
//        if(null!=status){
//            int stat = Integer.parseInt(status);
//            try {
//                List<Task>list = service.listByStatus(stat,user.getType(),user.getUsername());
//                request.getSession().setAttribute("list",list);
//                if(type==1){request.getRequestDispatcher(request.getContextPath()+"/pages/adminView/tasklist.jsp").forward(request,response);}
//                else{request.getRequestDispatcher(request.getContextPath()+"/pages/userView/mytask.jsp").forward(request,response);}
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//        }else {
//            //2.无分类请求 所有任务
//            try {
//                List<Task>list = service.listByType(type,index,colnum,user.getUsername());
//                //按照用户类型查询总记录数，用Task的num属性封装
//                request.getSession().setAttribute("list",list);
//                if(type==1){request.getRequestDispatcher(request.getContextPath()+"/pages/adminView/tasklist.jsp").forward(request,response);}
//                else{request.getRequestDispatcher(request.getContextPath()+"/pages/userView/mytask.jsp").forward(request,response);}
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);

    }
}
