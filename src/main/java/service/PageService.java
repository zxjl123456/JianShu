package service;

import bean.Content;
import bean.Page;
import dao.ContentDao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 获取分页数据
 */
public class PageService {
    ContentDao contentDao=new ContentDao();

    /**
     * 返回分页数据
     * @param pageNo
     * @param pageSize
     * @return
     */
  /*  public Page<Content> getPage(String pageNo,String pageSize){
     Page<Content> page=new Page<Content>();
     //设置默认值
     int pn=1;
     int ps=4;
     int index=1;
        //int ps=page.getPageSize();
        try {
            pn=Integer.parseInt(pageNo);
            ps=Integer.parseInt(pageSize);
            int totalCount=contentDao.getTotalCount();
            page.setPageSize(ps);
            page.setTotalCount(totalCount);
            page.setTotalPage(page.getTotalPage());
             System.out.println("总记录数："+totalCount);
            page.setPageNo(pn);
            page.setIndex();
            index=page.getIndex();

     }catch (Exception e){
         e.printStackTrace();
     }
        List<Content> contentList=new ArrayList<Content>();
        try {
            contentList=contentDao.getPageList(index,ps);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        page.setPageData(contentList);
        Page<Content> page1=new Page<Content>(pn, page.getTotalPage(), page.getTotalCount(), ps, index, page.getPageData());
        return  page;
    }*/
    public Page<Content> getPage(String pageNo,String pageSize) {
        Page<Content> page = new Page<Content>();
    //设置默认值
            int pn=1;
            int ps=page.getPageSize();
        int totalCount = 0;
        List<Content> list= new ArrayList<Content>();
        try {
            pn=Integer.parseInt(pageNo);
            ps=Integer.parseInt(pageSize);
             totalCount=contentDao.getTotalCount();
        } catch (Exception e) {
            e.printStackTrace();
        }

        page.setPageSize(ps);
        page.setTotalCount(totalCount);
        page.setPageNo(pn);
        try {
             list=contentDao.getPageList(page.getIndex(),page.getPageSize());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        page.setPageData(list);
        return  page;
    }
}
