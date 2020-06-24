package bean;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.SessionAttribute;

@Controller
public class Content {
    private int id;//内容id 主键
    private String keywords;//内容关键字
    private  String content;//内容
    private  String contentMag;//文章操作提示
    private  int thumbsUp;//文章点赞数
    private  String[] comments;//文章评论，数组类型
    public Content() {
    }

    public Content(String keywords) {
        this.keywords = keywords;
    }

    public Content(String keywords, String content) {
        this.keywords = keywords;
        this.content = content;
    }

    public Content(int id, String keywords, String content) {
        this.id = id;
        this.keywords = keywords;
        this.content = content;
    }

    public Content(int id, String keywords, String content, int thumbsUp) {
        this.id = id;
        this.keywords = keywords;
        this.content = content;
        this.thumbsUp = thumbsUp;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getContentMag() {
        return contentMag;
    }

    public void setContentMag(String contentMag) {
        this.contentMag = contentMag;
    }

    public int getThumbsUp() {
        return thumbsUp;
    }

    public void setThumbsUp(int thumbsUp) {
        this.thumbsUp = thumbsUp;
    }

    public String[] getComments() {
        return comments;
    }

    public void setComments(String[] comments) {
        this.comments = comments;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "Content{" +
                "keywords='" + keywords + '\'' +
                ", content='" + content + '\'' +
                '}';
    }
}
