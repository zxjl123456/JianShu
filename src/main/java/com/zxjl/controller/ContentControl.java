package com.zxjl.controller;

import bean.Comment;
import bean.Content;
import bean.Page;
import bean.User;
import dao.CommentDao;
import dao.ContentDao;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import service.PageService;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class ContentControl {

    @RequestMapping("/express")
    public ModelAndView express(Content content){
        ContentDao contentDao=new ContentDao();
        String viewName1="read";
        String viewName2="expressError";
        ModelAndView modelAndView1=new ModelAndView(viewName1);
        ModelAndView modelAndView2=new ModelAndView(viewName2);
       if (contentDao.insertContent(content)!=null){
           System.out.println("发表内容成功!");
           modelAndView1.addObject("content",content);
           return modelAndView1;
       }else {
           System.out.println("发表内容失败！");
           modelAndView2.addObject("contentMsg","发表失败！");
           return modelAndView2;
       }
    }
    @RequestMapping("/findContent")
    public ModelAndView find(Content content, Map<String,Object>map)throws SQLException {
        String viewName1="show";
        String viewName2="findError";
        ModelAndView modelAndView1=new ModelAndView(viewName1);
        ModelAndView modelAndView2=new ModelAndView(viewName2);
        ContentDao contentDao=new ContentDao();
        ArrayList<Content> contentList =new ArrayList<Content>();
        contentList = contentDao.findContent(content.getKeywords());
        if (!contentList.isEmpty()) {
            modelAndView1.addObject("contentList",contentList);
            return modelAndView1;
        } else {
            modelAndView2.addObject("contentMsg","抱歉，小编没有找到你要的内容~");
            return modelAndView2;
        }
    }
    @RequestMapping( "/pageDiv")
    public ModelAndView page(@RequestParam(value = "pn",required = false, defaultValue = "1") String pn){
        String viewName1="fancy";
        ModelAndView modelAndView1=new ModelAndView(viewName1);
        PageService pageService=new PageService();
        Page<Content> page1=pageService.getPage(pn,"4");
        modelAndView1.addObject("page",page1);
        return modelAndView1;
    }
    @RequestMapping( "/contentList")
    public ModelAndView contentList()throws  SQLException{
        String viewName1="show";
        ModelAndView modelAndView1=new ModelAndView(viewName1);
        ContentDao contentDao=new ContentDao();
        List<Content> contentList=new ArrayList<Content>();
        contentList= (ArrayList<Content>) contentDao.getPageList(1,5);
        modelAndView1.addObject("contentList",contentList);
        return modelAndView1;
    }
    @RequestMapping( "/thumbsUp")
    public  ModelAndView thumbsUp(@RequestParam(value = "id") int id){
        ModelAndView modelAndView=new ModelAndView("read");
        ContentDao contentDao=new ContentDao();
        Content content= contentDao.getThumbsUp(id);
        modelAndView.addObject("content",content);
      return  modelAndView;
}
@RequestMapping("/lookContent")
    public ModelAndView lookContent(@RequestParam(value = "id",required = false,defaultValue = "1") String id) {
    ModelAndView modelAndView=new ModelAndView("read");
    CommentDao commentDao=new CommentDao();
    ArrayList<Comment> comments=commentDao.findAllComment(id);
    int contentId=Integer.parseInt(id);
    ContentDao contentDao=new ContentDao();
    Content content=contentDao.findContentById(contentId);
    modelAndView.addObject("comments",comments);
    modelAndView.addObject("content",content);
    return modelAndView;
    }
    @RequestMapping("/comment")
    public ModelAndView comment(Comment comment){
        ModelAndView modelAndView=new ModelAndView("read");
        CommentDao commentDao=new CommentDao();
        commentDao.insertComment(comment);
        String contentId=comment.getContentId();
        ArrayList<Comment> comments=commentDao.findAllComment(contentId);
       int contentId1=Integer.parseInt(contentId);
        Content content=new ContentDao().findContentById(contentId1);
        modelAndView.addObject("comments",comments);
        modelAndView.addObject("content",content);
        return modelAndView;
    }
}
