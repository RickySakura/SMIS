package servlet;

import bean.FileBean;
import bean.User;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

@WebServlet("/ShowImage")
public class ShowImageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //通过表单提交得到要下载的文件名和文件地
        String fileUrl = (String)request.getParameter("fileurl");
        String fileName = (String) request.getParameter("filename");
        System.out.println(fileUrl+fileName);

        //得到要下载的文件
        File file = new File(fileUrl);
        //如果文件不存在
        if(!file.exists()){
            request.setAttribute("message", "您要下载的资源已被删除！！");
            request.getRequestDispatcher("/message.jsp").forward(request, response);
            return;
        }
        //处理文件名，在使用UUID的情况下
        String lastname = fileName.substring(fileName.indexOf(".")+1);
        //设置响应头，控制浏览器下载该文件
        if("jpg".equals(lastname)||"jpeg".equals(lastname)||"JPG".equals(lastname)||"JPEG".equals(lastname)){response.addHeader("Content-Type","image/jpg");};
        if("png".equals(lastname)||"PNG".equals(lastname)){response.addHeader("Content-Type","image/png");};
        if ("doc".equals(lastname)||"docx".equals(lastname)){response.addHeader("Content-Type","application/msword");}
        if("txt".equals(lastname)){response.addHeader("Content-Type","text/plain");};
        //读取要下载的文件，保存到文件输入流,输入的数据是字节类型的byte
        FileInputStream in = new FileInputStream(fileUrl);
        //创建输出流
        OutputStream out = response.getOutputStream();
        //创建缓冲区
        byte buffer[] = new byte[1024];
        int len = 0;
        //循环将输入流中的内容读取到缓冲区当中
        //in.read方法返回的是一个int类型的数
        while((len=in.read(buffer))>0){
            //输出缓冲区的内容到浏览器，实现文件下载
            out.write(buffer, 0, len);
        }
        //关闭文件输入流
        in.close();
        //关闭输出流
        out.close();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
