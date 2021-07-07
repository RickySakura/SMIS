package service;

import bean.Task;
import dao.TaskDao;

import javax.xml.crypto.Data;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class TaskService {
    private TaskDao taskDao = new TaskDao();
    //分页功能：分页后封装到列表中,根据判别符flag判断是超级用户查询全部还是按用户查询。
    //1代表超级用户 0代表普通用户
    //000和100
    public List<Task> listByType(int flag,int index,int colnum,String username) throws SQLException {
        if(flag==1){
            return taskDao.listAll(index,colnum);
        }
        return taskDao.list(username,index,colnum);
    }
    //提供根据flag的值来判断是全部查询还是按用户名查询
    public Task count(int flag,String username) throws SQLException {
        if(flag==1){
            return taskDao.count();
        }
        return taskDao.count2(username);
    }
    //提供根据任务状态查询 0代表未完成，1代表已完成
    //如果需要按任务状态分组，就不查询全部,同时也要有分页和按用户查询功能
    //110和010
    public List<Task> listByStatus(int stat,int flag,String username) throws SQLException {
       if(flag==1){
          if(stat==0){
              return taskDao.listByStatus("未完成");
          }else return taskDao.listByStatus("已完成");
       }else {
           if(stat==0){
               return taskDao.listByStatusAndName("未完成",username);
           }else return taskDao.listByStatusAndName("已完成",username);
       }
    }
    //按日期分组查询,共八种查询方式
    public List<Task> eightMethodQuery(int flag,String beginDate,String endDate,String username,int index,int colnum,int stat) throws SQLException {
        if(stat==2&&null!=beginDate&&null!=endDate){
            if(flag==1){
                return taskDao.listByDate(beginDate,endDate,index,colnum);
            }else{
                return taskDao.listByDateAndUser(beginDate,endDate,username,index,colnum);
            }
        }else if(null!=beginDate&&null!=endDate&&(stat==0||stat==1)){
            if(flag==1){
                if(stat==0){
                    return taskDao.listByDateStat(beginDate,endDate,index,colnum,"未完成");
                }else {
                    return taskDao.listByDateStat(beginDate,endDate,index,colnum,"已完成");
                }
            }else {
                if(stat==0){
                    return taskDao.listByDateUserStat(beginDate,endDate,username,index,colnum,"未完成");
                }else {
                    return taskDao.listByDateUserStat(beginDate,endDate,username,index,colnum,"已完成");
                }
            }
        }else if(null==beginDate&&null==endDate&&(stat==0||stat==1)){
            return this.listByStatus(stat,flag,username);
        }else if(null==beginDate&&null==endDate&&(stat!=0||stat!=1)){
            return this.listByType(flag,index,colnum,username);
        }else {
        return null;
    }}

    //提供完成任务的方法
    public void editStatus(String stat,int num) throws SQLException{
        taskDao.editStatus(stat,num);
    }
    //提供添加任务的方法,时间直接由service生成
    public void addTask(Task task) throws SQLException{
        String datetime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        taskDao.addTask(task,datetime);
    }
    //提供删除任务的方法
    public void deleteTask(String num) throws SQLException{
        int num1 = 0;
        if(null!=num){
            num1=Integer.parseInt(num);
        }
        taskDao.deleteTask(num1);
    }


}
