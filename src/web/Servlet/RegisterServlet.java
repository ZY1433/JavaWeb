package web.Servlet;

import domain.User;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class RegisterServlet extends HttpServlet {
    private String username;
    private String email;
    private String password;
    private String repeatPassword;
    private String registerMsg;


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        this.username = req.getParameter("username");
        this.email = req.getParameter("email");
        this.password = req.getParameter("password");
        this.repeatPassword = req.getParameter("repeatPassword");
        UserService userService = new UserService();
        if (!validate()) {
            req.setAttribute("registerMsg",registerMsg);
            req.getRequestDispatcher("registerForm").forward(req,resp);
        } else {
            boolean flag = userService.userRegister(this.username,this.email,this.password);
            if (flag) {
                req.setAttribute("registerSuccessMsg","注册成功！请前往登录");
            } else {
                req.setAttribute("registerMsg",userService.getMsg());
            }
            req.getRequestDispatcher("registerForm").forward(req,resp);
        }
    }

    private boolean validate() {
        if(this.username == null || this.username.equals("")) {
            this.registerMsg = "用户名不能为空";
            return false;
        } else if (this.email == null || this.email.equals("")) {
            this.registerMsg = "邮箱不能为空";
            return false;
        } else if (this.password  == null || this.password.equals("")) {
            this.registerMsg = "密码不能为空";
            return false;
        } else if (this.repeatPassword  == null || this.repeatPassword.equals("")) {
            this.registerMsg = "重复的密码不能为空";
            return false;
        } else if (!this.repeatPassword.equals(password)) {
            this.registerMsg = "两次输入的密码不匹配";
            return false;
        }
        return true;
    }
}
