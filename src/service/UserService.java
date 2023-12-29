package service;

import domain.User;
import persistence.UserDao;
import persistence.UserDaoImpl;

public class UserService {
    private UserDao userDao;
    private  String msg;

    public UserService() {
        this.userDao = new UserDaoImpl();
    }

    public User login(String username, String password) {
        User userLogin = userDao.getUserByUsernameAndPassword(username,password);
        if (userLogin == null) {
            this.msg = "用户名或者密码错误";
        }
        return userLogin;
    }

    public String getMsg() {
        return msg;
    }
}
