package test;

import bean.Content;
import bean.Page;
import dao.ContentDao;
import org.junit.Test;
import service.PageService;

public class CeShi {
    ContentDao contentDao=new ContentDao();
    @Test
    public  void  test1(){
        Content content=contentDao.findContentById(2);
        System.out.println(content);
    }
    @Test
    public void test2(){
        PageService pageService=new PageService();
        Page<Content> page=pageService.getPage("3","3");
        System.out.println(page.getPageData());
        System.out.println(page.getPageNo());
        System.out.println(page.getPageSize());
        System.out.println(page.getTotalPage());
        System.out.println(page.getTotalCount());
    }

}
