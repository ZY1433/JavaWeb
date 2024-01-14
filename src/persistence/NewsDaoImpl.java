package persistence;

import domain.News;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NewsDaoImpl implements NewsDao{
    private static final String FIND_ALL_NEWS =
            "SELECT * FROM news;";
    private static final String INSERT_NEWS =
            "INSERT INTO news (Title,Content,PublishTime)values(?,?,now())";
    private static final String UPDATE_NEWS =
            "UPDATE news SET Title=?,Content=? WHERE NewsID=?;";
    private static final String DELETE_NEWS =
            "DELETE FROM news WHERE NewsID=?;";
    private static final String FIND_NEWS_BY_ID =
            "SELECT * FROM news WHERE NewsID=?;";
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

    @Override
    public boolean insertNews(News news) {
        boolean result = false;
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_NEWS);
            preparedStatement.setString(1,news.getTitle());
            preparedStatement.setString(2,news.getContent());
            int rows = preparedStatement.executeUpdate();
            if (rows == 1) {
                result = true;
            }
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    @Override
    public boolean deleteNews(News news) {
        boolean result = false;
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_NEWS);
            preparedStatement.setInt(1,news.getNewsId());
            int rows = preparedStatement.executeUpdate();
            if (rows == 1) {
                result = true;
            }
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    @Override
    public boolean updateNews(News news) {
        boolean result = false;
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_NEWS);
            preparedStatement.setString(1,news.getTitle());
            preparedStatement.setString(2,news.getContent());
            preparedStatement.setInt(3,news.getNewsId());
            int rows = preparedStatement.executeUpdate();
            if (rows == 1) {
                result = true;
            }
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    @Override
    public News getNewsById(int newsId) {
        News result = null;
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_NEWS_BY_ID);
            preparedStatement.setInt(1,newsId);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()){
                result = this.resultsetToNews(resultSet);
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    private News resultsetToNews(ResultSet resultSet) throws SQLException {
        News news = new News();
        news.setNewsId(resultSet.getInt("NewsID"));
        news.setTitle(resultSet.getString("Title"));
        news.setContent(resultSet.getString("Content"));
        news.setPublishTime(resultSet.getDate("PublishTime"));

        return news;
    }
}
