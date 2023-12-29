package web.Servlet;

import domain.User;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    private String username;
    private String password;
    private String loginMsg;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.username = req.getParameter("username");
        this.password = req.getParameter("password");

        if (!validate()) {
            req.setAttribute("loginMsg",loginMsg);
            req.getRequestDispatcher("loginForm").forward(req,resp);
        } else {
            UserService userService = new UserService();
            User loginUser = userService.login(this.username,this.password);
            if (loginUser != null) {
                HttpSession session = req.getSession();
                session.setAttribute("loginUser",loginUser);
                resp.sendRedirect("main");
            } else {
                req.setAttribute("loginMsg",userService.getMsg());
                req.getRequestDispatcher("loginForm").forward(req,resp);
            }
        }
    }

    private boolean validate() {
        if(this.username == null || this.username.equals("")) {
            this.loginMsg = "用户名不能为空";
            return false;
        } else if (this.password  == null || this.password.equals("")) {
            this.loginMsg = "密码不能为空";
            return false;
        }
        return true;
    }
}
