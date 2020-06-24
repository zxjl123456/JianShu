package service;

import bean.User;
import dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import utils.DBConnection;

import java.sql.ResultSet;
import java.sql.SQLException;

@Service
public class UserService  {
   @Autowired
    public boolean register (User user) {
       DBConnection dbConnection = new DBConnection();
       UserDao userDao = new UserDao();
       String sql = "select * from user where userName='" + user.getUserName() + "'";
       ResultSet resultSet = dbConnection.executeQuery(sql);
       try {
           if (resultSet != null && resultSet.next()) {
               user.setUserMsg("用户名已存在");
               System.out.println("用户名已存在！");
               return false;
           }
       } catch (SQLException e) {
           e.printStackTrace();
       }
           return userDao.insertUser(user);
   }

}