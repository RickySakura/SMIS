package servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLDecoder;
import java.net.URLEncoder;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DownloadServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //通过a链接得到要下载的文件名和文件地址
        String fileUrl = (String) request.getParameter("fileurl");
        String fileName = (String) request.getParameter("filename");
       // fileUrl = new String(fileUrl.trim().getBytes("iso8859-1"),"UTF-8");
//        fileName = new String(fileName.getBytes("iso8859-1"),"utf-8");
        System.out.println(fileName+" "+fileUrl);
        //上传的文件都是保存在/WEB-INF/upload目录下的子目录当中

        //得到要下载的文件
        File file = new File(fileUrl);
        //如果文件不存在
        if(!file.exists()){
            request.setAttribute("message", "您要下载的资源已被删除！！");
            request.getRequestDispatcher("/message.jsp").forward(request, response);
            return;
        }
        //处理文件名，在使用UUID的情况下
        String realname = fileName.substring(fileName.indexOf("_")+1);
        //设置响应头，控制浏览器下载该文件
        response.addHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));
        response.addHeader("Content-Type","application/octet-stream");
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
