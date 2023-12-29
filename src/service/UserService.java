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

    public boolean userRegister(String username, String password) {
        boolean result = false;
        User oldUser = userDao.getUserByUsername(username);
        if (oldUser == null) {
            User newUser = new User(username,password,false);
            result = userDao.insertUser(newUser);
        } else {
            this.msg = "用户名已存在，请更换";
        }
        return result;
    }
    public String getMsg() {
        return msg;
    }
}
