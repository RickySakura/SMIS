import bean.Count;
import bean.FileBean;
import com.mchange.v2.c3p0.ComboPooledDataSource;
import dao.UserDao;

import javax.sql.DataSource;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.SQLException;

public class example {
    public static DataSource ds = null;
    //初始化c3p0数据源
    static {
        //使用c3p0-config.xml配置文件中name-config节点中name属性的值，没有则默认default
        ComboPooledDataSource cpds = new ComboPooledDataSource("root");
        ds = cpds;
    }

    public static void main(String[] args) throws SQLException,IOException {
        String a = "2020-06";
        String date = "2020-01~2020-07";
        //index
        String beginDate = date.substring(0,date.indexOf("~"));
        String endDate = date.substring(date.lastIndexOf("~")+1);
        System.out.println(beginDate);
        System.out.println(endDate);
    }
}
