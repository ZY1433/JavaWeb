package service;

import domain.User;
import persistence.UserDao;
import persistence.UserDaoImpl;

import java.util.List;

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
    public boolean adminRegister(String username, String email, String password, boolean isAdmin) {
        boolean result = false;
        User oldUser = userDao.getUserByUsername(username);
        User oldEmail = userDao.getUserByUsername(username);
        if (oldUser != null) {
            this.msg = "用户名已存在，请更换";
        } else if (oldEmail != null){
            this.msg = "邮箱已使用，请更换";
        } else {
            User newUser = new User(username,email,password,isAdmin);
            result = userDao.insertUser(newUser);
        }
        return result;
    }
    public boolean adminUpdate(String userId, String username, String email, String password, boolean isAdmin) {
        boolean result = false;
        User oldUser = userDao.getUserById(Integer.parseInt(userId));
        if (oldUser == null) {
            this.msg = "该用户不存在，无法更新";
        } else {
            User newUser = new User(Integer.parseInt(userId),username,email,password,isAdmin);
            result = userDao.updateUser(newUser);
        }
        return result;
    }
    public boolean adminDelete(String userId) {
        boolean result = false;
        User oldUser = userDao.getUserById(Integer.parseInt(userId));
        if (oldUser == null) {
            this.msg = "用户不存在，无法删除";
        } else {
            result = userDao.deleteUser(oldUser);
        }
        return result;
    }
    public List<User> getAllUsers() {
        return userDao.getAllUsers();
    }
    public String getMsg() {
        return msg;
    }
}
