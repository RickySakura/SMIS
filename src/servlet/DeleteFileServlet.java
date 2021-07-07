package servlet;

import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/DeleteFileServlet")
public class DeleteFileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取需要删除的文件地址
        String fileurl = request.getParameter("fileurl");
        //创建服务层对象提供删除服务
        UserService service = new UserService();
        try {
            service.deletefile(fileurl);
            File file = new File(fileurl);
            if(file.exists()){
                file.delete();
                request.setAttribute("message", "该文件成功删除！！");
                request.getRequestDispatcher("/message.jsp").forward(request, response);
                return;
            }
            request.setAttribute("message", "您要删除的资源不存在！！");
            request.getRequestDispatcher("/message.jsp").forward(request, response);
            return;
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);

    }
}
