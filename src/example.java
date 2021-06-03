import com.mchange.v2.c3p0.ComboPooledDataSource;

import javax.sql.DataSource;
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

    public static void main(String[] args) throws SQLException {
        Connection connection = ds.getConnection();
        System.out.println(connection);
    }
}
