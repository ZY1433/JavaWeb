package persistence;

import domain.News;
import domain.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class NewsDaoImpl implements NewsDao{
    private static final String FIND_ALL_NEWS =
            "SELECT * FROM news;";
    @Override
    public List<News> getAllNews() {
        List<News> result = new ArrayList<>();
        try {
            Connection connection = DBUtil.getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(FIND_ALL_NEWS);
            while(resultSet.next()){
                result.add(this.resultsetToNews(resultSet));
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closeStatement(statement);
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    private News resultsetToNews(ResultSet resultSet) throws SQLException {
        News news = new News();
        news.setNewsId(resultSet.getInt("NewsID"));
        news.setContent(resultSet.getString("Content"));
        news.setPublishTime(resultSet.getDate("PublishTime"));

        return news;
    }
}
