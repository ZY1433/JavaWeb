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
    private String password;
    private String registerMsg;


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.username = req.getParameter("username");
        this.password = req.getParameter("password");
        UserService userService = new UserService();
        if (!validate()) {
            req.setAttribute("registerMsg",registerMsg);
            req.getRequestDispatcher("registerForm").forward(req,resp);
        } else {
            boolean flag = userService.userRegister(this.username,this.password);
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
        } else if (this.password  == null || this.password.equals("")) {
            this.registerMsg = "密码不能为空";
            return false;
        }
        return true;
    }
}
