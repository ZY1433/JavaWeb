package domain;

import java.util.Date;
public class News {
    private int newsId;
    private String content;
    private Date publishTime;

    // 构造函数
    public News() {

    }

    public News(String content,Date publishTime) {
        this.content = content;
        this.publishTime = publishTime;
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

    public  String toString() {
        return newsId+","+content+","+publishTime;
    }


}
