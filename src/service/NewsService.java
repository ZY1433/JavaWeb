package service;


import domain.News;
import persistence.NewsDao;
import persistence.NewsDaoImpl;

import java.util.List;

public class NewsService {
    private NewsDao newsDao;
    public NewsService() {
        this.newsDao = new NewsDaoImpl();
    }
    public List<News> getAllNews() {
        return newsDao.getAllNews();
    }
}
