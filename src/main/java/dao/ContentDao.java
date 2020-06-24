package dao;

import bean.Content;
import utils.DBConnection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContentDao {
    DBConnection dbConnection=new DBConnection();

    /**
     * 插入内容
     * @param content
     * @return
     */
    public Content insertContent(Content content){
        String sql="insert into content(keywords,content) values('"+content.getKeywords()+"','"+content.getContent()+"')";
        int num=dbConnection.execute(sql);
        if (num>0){
            return content;
        }
        else {
            return null;
        }
    }

    /**
     * 查询内容   返回查询到的数组
     * @param keywords
     * @return
     */
    public ArrayList<Content> findContent(String keywords)throws SQLException {
        int num = 0;
        ResultSet resultSet = null;
        ArrayList<Content> contentList = new ArrayList<Content>();
        String sql = "select * from content where keywords='" + keywords + "'";
        resultSet = dbConnection.executeQuery(sql);
        if (resultSet != null && resultSet.next()) {

            do {
                contentList.add(new Content(resultSet.getString(2), resultSet.getString(3)));
                System.out.println("搜索到内容:"+ contentList.get(num));
                num++;
            }while (resultSet.next());
            resultSet.close();
        }
        return contentList;
    }

    /**
     * 根据id查找内容
     * @param id
     * @return
     */
    public Content findContentById(int id){
        Content content=null;
        String sql="select * from content where id="+id;
        ResultSet resultSet=dbConnection.executeQuery(sql);
        try {
            if (resultSet!=null&&resultSet.next()){
                content=new Content(id,resultSet.getString(2),resultSet.getString(3),resultSet.getInt(5));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return content;
    }
    public Content getThumbsUp(int id) {
        ContentDao contentDao = new ContentDao();
        Content content = contentDao.findContentById(id);
        int num = content.getThumbsUp();
        num++;
        String sql="update content set thumbsUp="+num+"where id="+id+"";
        dbConnection.execute(sql);
        content=contentDao.findContentById(id);

      content.setThumbsUp(num);
            return content;
    }
        public List<Content> getPageList(int index,int size)throws SQLException{
        List < Content> contentList=new ArrayList<Content>();
        String sql="select * from content limit"+" "+index+","+size;
        ResultSet resultSet=dbConnection.executeQuery(sql);
            if (resultSet!=null){
                while (resultSet.next()) {
                    contentList.add(new Content(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3)));
                }
            }
            return contentList;
        }
        public  int getTotalCount() throws Exception{
            int count=0;
            List < Content> contentList=new ArrayList<Content>();
            String sql="select * from content ";
            ResultSet resultSet=dbConnection.executeQuery(sql);
            System.out.println(resultSet);
          // count=Integer.parseInt(resultSet.toString());
            if (resultSet!=null){
                while (resultSet.next()) {
                    contentList.add(new Content(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3)));
                }
            }
            count=contentList.size();
            System.out.println(count);
        // String sql="select count(*)from content";
        //int count=dbConnection.execute(sql);
       /*ResultSet resultSet=dbConnection.executeQuery(sql);
                int count= 0;
                if (resultSet!=null) {
                    while (resultSet.next()) {
                        count++;
                    }
            }*/
            return count;
        }

    }
