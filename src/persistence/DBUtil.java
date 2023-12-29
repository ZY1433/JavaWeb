package persistence;

import domain.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DBUtil {
    private static final String DRIVER = "com.mysql.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/javaweb?useSSL=false";
    private static final String USER = "root";
    private static final String PASSWORD = "123456";

    // 获取数据库连接
    public static Connection getConnection() throws SQLException {
        Connection connection = null;
        try {
            Class.forName(DRIVER);
            connection = DriverManager.getConnection(URL,USER,PASSWORD);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }

    // 关闭数据库资源
    public static void closeConnection(Connection connection) {
        try {
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void closeStatement(Statement statement) {
        if (statement != null) {
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    public static void closePreparedStatement(PreparedStatement preparedStatement) {
        if (preparedStatement != null) {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }public static void closeResultSet(ResultSet resultSet) {
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // 执行查询操作
    public static ResultSet executeQuery(String sql, Object... params) throws SQLException {
        Connection connection = getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(sql);

        // 设置参数
        for (int i = 0; i < params.length; i++) {
            preparedStatement.setObject(i + 1, params[i]);
        }

        // 执行查询
        return preparedStatement.executeQuery();
    }

//    public static void main(String[] args) throws SQLException {
//        System.out.println(DBUtil.getConnection());
//        UserDaoImpl userDao = new UserDaoImpl();
//        userDao.deleteUser(new User(2));
//        userDao.updateUser(new User(2,"asd2","325",false));
//        userDao.insertUser(new User("asd","123",false));
//        List<User> user = userDao.getAllUsers();
//        System.out.println(user);
//    }

}

