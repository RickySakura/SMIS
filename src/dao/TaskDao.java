package dao;

import bean.Task;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.DataSourceUtils;

import java.sql.SQLException;
import java.util.List;

public class TaskDao {
    private QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
    //管理员权限：查询所有任务信息
    //分页功能：分页后封装到列表中
    //root 000
    public List<Task> listAll(int index, int colnum) throws SQLException {
        String sql = "select * from task limit ?,?";
        return runner.query(sql,new BeanListHandler<Task>(Task.class),index,colnum);
    }
    //超级用户：按照任务状态分类查询
    //root 010
    public List<Task> listByStatus(String stat) throws SQLException{
        String sql = "select * from task where `status`=?";
        return runner.query(sql,new BeanListHandler<Task>(Task.class),stat);
    }
    //root 001 只查日期
    public List<Task>listByDate (String beginDate,String endDate,int index,int colnum) throws SQLException {
        String sql = "select * from task where datetime BETWEEN ? AND ? limit ?,? ";
        return runner.query(sql,new BeanListHandler<Task>(Task.class),beginDate,endDate,index,colnum);
    }
    //root 011
    public List<Task>listByDateStat(String beginDate,String endDate,int index,int colnum,String stat) throws SQLException {
        String sql = "select * from task where `status`=? AND datetime BETWEEN ? AND ? limit ?,? ";
        return runner.query(sql,new BeanListHandler<Task>(Task.class),stat,beginDate,endDate,index,colnum);
    }

    //查询属于用户的任务信息，并封装到列表中
    //user 100只查用户
    public List<Task> list(String username,int index,int colnum) throws SQLException{
        String sql = "select * from task where username=? limit ?,?";
        return runner.query(sql,new BeanListHandler<Task>(Task.class),username,index,colnum);
    }
    //普通用户：按照任务状态和用户名分类查询
    //user 110
    public List<Task> listByStatusAndName(String stat,String username) throws SQLException{
        String sql = "select * from task where username=? and `status`=?";
        return runner.query(sql,new BeanListHandler<Task>(Task.class), username,stat);
    }
    //按日期,用户，状态分组查询
    //user 111
    public List<Task>listByDateUserStat(String beginDate,String endDate,String username,int index,int colnum,String stat) throws SQLException {
        String sql = "select * from task where username=? AND `status`=? AND datetime BETWEEN ? AND ? limit ?,? ";
        return runner.query(sql,new BeanListHandler<Task>(Task.class),username,stat,beginDate,endDate,index,colnum);
    }
    //按日期、用户查询
    //user 101
    public List<Task>listByDateAndUser(String beginDate,String endDate,String username,int index,int colnum) throws SQLException {
        String sql = "select * from task where username=? AND datetime BETWEEN ? AND ? limit ?,? ";
        return runner.query(sql,new BeanListHandler<Task>(Task.class),username,beginDate,endDate,index,colnum);
    }

    //提供完成任务的方法
    public void editStatus(String stat,int num) throws SQLException{
        String sql = "update task set `status`=? where num=?";
        //创建集合并将信息添加到集合中
        runner.update(sql,stat,num);
    }
    //提供删除任务的方法
    public void deleteTask(int num) throws SQLException{
        String sql = "delete from task where num=?";
        runner.update(sql,num);
    }
    //提供添加任务的方法
    public void addTask(Task task,String datetime) throws SQLException{
        String sql = "insert into task (num,username,type,descr,datetime) values(?,?,?,?,?)";
        //将封装在bean中的数据添加到表中
        runner.update(sql,queryMaxNum()+1,task.getUsername(),task.getType(),task.getDescr(),datetime);
    }



    //分页功能：查询数据库里的总数据条数
    //由于mysql的聚集函数（count，sum等等...）查询出来的值都没有名字，所以数据库引擎无法识别他们的结果也就无法放到bean中封装，所以最简单的解决办法就是用as给别名。
    public Task count() throws SQLException {
        String sql = "SELECT COUNT(*) AS num FROM task";
        return runner.query(sql,new BeanHandler<Task>(Task.class));
    }
    public Task count2(String username) throws SQLException{
        String sql="SELECT COUNT(*) AS num FROM task where username=?";
        return runner.query(sql,new BeanHandler<Task>(Task.class),username);
    }

    //按照用户查询最大序号，从最大序号开始递增   tips：小功能
    public int queryMaxNum()throws SQLException{
        String sql = "select MAX(num) as num from task";
        Task task= runner.query(sql,new BeanHandler<Task>(Task.class));
        return task.getNum();
    }

}
