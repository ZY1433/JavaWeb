package persistence;

import domain.News;

import java.util.List;

public interface NewsDao {
    public List<News> getAllNews();

    public boolean insertNews(News news);
    public boolean deleteNews(News news);
    public boolean updateNews(News news);
    public News getNewsById(int newsId);
}
