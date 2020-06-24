package dao;

import bean.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import utils.DBConnection;

import java.sql.ResultSet;
import java.sql.SQLException;
@Service
public class UserDao {
    public boolean insertUser(User user){
        DBConnection dbConnection=new DBConnection();
        String sql1="insert into user(userName,userPassword)values('"+user.getUserName()+"','"+user.getUserPassword()+"')";
        int num=dbConnection.execute(sql1);
        if( num>0){
            return true;
        }else{
            return false;
        }
    }

    public boolean saveUser(User user){
        UserDao userDao=new UserDao();
        DBConnection dbConnection=new DBConnection();
        //User user1=userDao.findUser(user);
        String sql="update user set userName='"+user.getUserName()+"',gender='"+user.getGender()+"',age="+user.getAge()+",email='"+user.getEmail()+"',gxqm='"+user.getGxqml()+"',nj="+user.getNj()+",zy='"+user.getZy()+"' where id ="+user.getId();
       return dbConnection.execute(sql)>0;
    }
    public User findUser(User user){
        User user1=null;
        DBConnection dbConnection=new DBConnection();
        String sql="select * from user where userName='"+user.getUserName()+"'and userPassword='"+user.getUserPassword()+"'";
       ResultSet resultSet = dbConnection.executeQuery(sql);
       //String hh="hh";
        try{
            if(resultSet!=null&&resultSet.next()){
                user1=new User(resultSet.getString(2),resultSet.getString(3));
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        dbConnection.closeDb();
       return user1;
    }
    @Autowired
    public User Validate(User user){
        DBConnection dbConnection=new DBConnection();
        User user1=null;
        String sql="select * from user where userName='"+user.getUserName()+"'and userPassword='"+user.getUserPassword()+"'";
        ResultSet resultSet=dbConnection.executeQuery(sql);
        try {
            if (resultSet!=null&&resultSet.next()){
                user1=new User(resultSet.getInt(1),
                        resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getString(4),
                        resultSet.getInt(5),
                        resultSet.getString(6));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        dbConnection.closeDb();
        return user1;
    }
}
