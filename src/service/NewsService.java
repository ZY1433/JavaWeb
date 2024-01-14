package service;


import domain.News;
import persistence.NewsDao;
import persistence.NewsDaoImpl;

import java.util.List;

public class NewsService {
    private NewsDao newsDao;
    private String Msg;
    public NewsService() {
        this.newsDao = new NewsDaoImpl();
    }
    public List<News> getAllNews() {
        return newsDao.getAllNews();
    }
    public boolean insertNews(String title, String content) {
        boolean result = false;
        News news = new News(title,content);
        result = newsDao.insertNews(news);
        return result;
    }

    public boolean newsUpdate(int newsId, String title, String content) {
        boolean result = false;
        News news = newsDao.getNewsById(newsId);
        if (news == null){
            this.Msg = "该新闻不存在";
        } else {
            result = newsDao.updateNews(new News(newsId,title,content));
        }
        return result;
    }

    public boolean newsDelete(int newsId) {
        boolean result = false;
        News news = newsDao.getNewsById(newsId);
        if (news == null){
            this.Msg = "该新闻不存在";
        } else {
            result = newsDao.deleteNews(new News(newsId));
        }
        return result;
    }

    public String getMsg() {
        return Msg;
    }
}
