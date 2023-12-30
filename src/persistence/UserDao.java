package persistence;

import java.util.List;
import domain.User;

public interface UserDao {

    public User getUserByUsernameAndPassword(String username, String password);
    //根据账号密码查询用户

    public boolean insertUser(User user);
    // 插入用户

    public boolean updateUser(User user);
    // 更新用户信息

    public boolean deleteUser(User user);
    // 删除用户

    public User getUserById(int userId);
    // 根据用户ID获取用户

    public User getUserByUsername(String userName);
    public User getUserByEmail(String email);
    // 根据用户名获取用户
    public List<User> getAllUsers();
    // 获取所有用户

}
