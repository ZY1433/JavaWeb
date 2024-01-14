package domain;

import java.util.Date;
public class News {
    private int newsId;
    private String title;
    private String content;
    private Date publishTime;

    // 构造函数
    public News() {

    }

    public News(String content,Date publishTime) {
        this.content = content;
        this.publishTime = publishTime;
    }

    public News(String title, String content) {
        this.title = title;
        this.content = content;
    }

    public News(int newsId, String title, String content) {
        this.newsId = newsId;
        this.title = title;
        this.content = content;
    }

    public News(int newsId) {
        this.newsId = newsId;
    }

    public int getNewsId() {
        return newsId;
    }

    public void setNewsId(int newsId) {
        this.newsId = newsId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public  String toString() {
        return newsId+","+content+","+publishTime;
    }


}
