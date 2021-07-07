package utils;
import com.mchange.v2.c3p0.ComboPooledDataSource;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

//该类用于获取数据源和数据库连接
public class DataSourceUtils {
    private static DataSource dataSource = new ComboPooledDataSource();
    //已经再c3p0-config.xml中配置好了，直接new就行
    private static ThreadLocal<Connection> t1 = new ThreadLocal<Connection>();
    public static DataSource getDataSource(){
        return dataSource;
    }
    /*
    当DBUtils需要手动控制事务时，调用该方法获得一个连接
     */
    //获得连接的方法，并给线程t1 设置一个独立的连接。 ThreadLocal的set方法会复制一个副本，线程只操作副本
    public static Connection getConnection() throws SQLException{
        Connection connection = t1.get();
        if(connection==null){
            connection = dataSource.getConnection();
            t1.set(connection);
        }
        return connection;
    }
    //开启事务
    public static void startTransaction() throws SQLException{
        //使用自身的静态方法getC获得同一个连接
        Connection connection = getConnection();
        if(connection!=null){
            connection.setAutoCommit(false);
        }
    }
    /*
    从ThreadLocal中释放并关闭Connection，并结束事务
     */
    public static void releaseAndCloseConnection() throws SQLException{
        Connection connection = getConnection();
        if(connection!=null){
            connection.commit();
            t1.remove();
            connection.close();
        }
    }
    //事务回滚
    public static void roolback() throws SQLException{
        Connection connection = getConnection();
        if(connection!=null){
            connection.rollback();
        }
    }

}
