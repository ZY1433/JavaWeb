package persistence;

import domain.News;

import java.util.List;

public interface NewsDao {
    public List<News> getAllNews();
}
