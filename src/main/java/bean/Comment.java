package bean;

public class Comment {
    private  int id;
    private  String  contentId;
    private String userId;
    private String comment;

    public Comment() {
    }

    public Comment(String contentId, String userId, String comment) {
        this.contentId = contentId;
        this.userId = userId;
        this.comment = comment;
    }

    public Comment(int id, String contentId, String userId, String comment) {
        this.id = id;
        this.contentId = contentId;
        this.userId = userId;
        this.comment = comment;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContentId() {
        return contentId;
    }

    public void setContentId(String contentId) {
        this.contentId = contentId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", contentId=" + contentId +
                ", userId=" + userId +
                ", comment='" + comment + '\'' +
                '}';
    }
}
