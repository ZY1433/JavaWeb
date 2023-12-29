package domain;

public class User {
    private int userId;
    private String username;
    private String password;
    private boolean isAdmin;

    // 构造函数
    public User() {
    }

    // 带参数的构造函数，用于创建对象时设置属性值
    public User(String username, String password, boolean isAdmin) {
        this.username = username;
        this.password = password;
        this.isAdmin = isAdmin;
    }

    public User(int userId, String username, String password, boolean isAdmin) {
        this.userId = userId;
        this.username = username;
        this.password = password;
        this.isAdmin = isAdmin;
    }

    public User(int userId) {
        this.userId = userId;
    }

    // Getter 和 Setter 方法
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isAdmin() {
        return isAdmin;
    }

    public void setAdmin(boolean admin) {
        isAdmin = admin;
    }

    public  String toString() {
        return userId+","+username+","+isAdmin;
    }
}
