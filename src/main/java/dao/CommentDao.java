package dao;

import bean.Comment;
import bean.Content;
import utils.DBConnection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CommentDao {
    DBConnection dbConnection=new DBConnection();
    public boolean insertComment(Comment comment) {
        String sql = "insert into Comment(contentId,userId,comment) values('" + comment.getContentId() + "','" + comment.getUserId() + "','" + comment.getComment() + "')";
        int num = dbConnection.execute(sql);
        if (num > 0) {
            return true;
        } else {
            return false;
        }
    }
        public ArrayList<Comment> findAllComment(String contentId){
            String sql="select * from Comment where contentId='"+contentId+"'";
            ArrayList<Comment> comments=new ArrayList<Comment>();
            ResultSet resultSet=dbConnection.executeQuery(sql);
            try {
                if (resultSet!=null&&resultSet.next()){
                    comments.add(new Comment(resultSet.getInt(1),resultSet.getString(2),resultSet.getString(3),resultSet.getString(4)));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return comments;
        }
}
