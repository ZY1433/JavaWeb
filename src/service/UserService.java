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

    public User userLogin(String username, String password) {
        User userLogin = userDao.getUserByUsernameAndPassword(username,password);
        if (userLogin == null) {
            this.msg = "用户名或者密码错误";
        }
        return userLogin;
    }

    public User adminLogin(String username, String password) {
        User userLogin = userDao.getUserByUsernameAndPassword(username,password);
        if (userLogin == null) {
            this.msg = "用户名或者密码错误";
        } else if (!userLogin.isAdmin()) {
            this.msg = "该用户不是管理员";
            return null;
        }
        return userLogin;
    }
    public boolean userRegister(String username, String email,String password) {
        boolean result = false;
        User oldUser = userDao.getUserByUsername(username);
        User oldEmail = userDao.getUserByUsername(username);
        if (oldUser != null) {
            this.msg = "用户名已存在，请更换";
        } else if (oldEmail != null){
            this.msg = "邮箱已使用，请更换";
        } else {
            User newUser = new User(username,email,password);
            result = userDao.insertUser(newUser);
        }
        return result;
    }
    public String getMsg() {
        return msg;
    }
}
