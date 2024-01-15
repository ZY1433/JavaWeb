package web.Servlet;

import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UserMangeServlet extends HttpServlet {
    private String userId;
    private String username;
    private String email;
    private String password;
    private boolean isAdmin;
    private String type;

    private String adminMsg;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        this.type = req.getParameter("type");
        if (type.equals("add")) {
            this.username = req.getParameter("username");
            this.email = req.getParameter("email");
            this.password = req.getParameter("password");
            String admin = req.getParameter("isAdmin");
            if(admin != null) {
                this.isAdmin = true;
            } else {
                this.isAdmin = false;
            }
            if (!validate()){
                req.setAttribute("adminMsg",adminMsg);
                req.getRequestDispatcher("userMangePage").forward(req,resp);
            }
            else {
                UserService userService = new UserService();
                boolean flag = userService.adminRegister(this.username,this.email,this.password,this.isAdmin);
                if (flag) {
                    req.setAttribute("adminMsg","添加成功！");
                } else {
                    req.setAttribute("adminMsg",userService.getMsg());
                }
                req.getRequestDispatcher("userMangePage").forward(req,resp);
            }
        } else if (type.equals("edit")) {
            this.userId = req.getParameter("userId");
            this.username = req.getParameter("username");
            this.email = req.getParameter("email");
            this.password = req.getParameter("password");
            String admin = req.getParameter("isAdmin");
            if(admin != null) {
                this.isAdmin = true;
            } else {
                this.isAdmin = false;
            } if (!validate()){
                req.setAttribute("adminMsg",adminMsg);
                req.getRequestDispatcher("userMangePage").forward(req,resp);
            } else {
                UserService userService = new UserService();
                boolean flag = userService.adminUpdate(this.userId,this.username,this.email,this.password,this.isAdmin);
                if (flag) {
                    req.setAttribute("adminMsg","更新成功！");
                } else {
                    req.setAttribute("adminMsg",userService.getMsg());
                }
                req.getRequestDispatcher("userMangePage").forward(req,resp);
            }

        } else if (type.equals("delete")) {
            this.userId = req.getParameter("userId");
                UserService userService = new UserService();
                boolean flag = userService.adminDelete(this.userId);
                if (flag) {
                    req.setAttribute("adminMsg","删除成功！");
                } else {
                    req.setAttribute("adminMsg",userService.getMsg());
                }
                req.getRequestDispatcher("userMangePage").forward(req,resp);


        }

    }
    private boolean validate() {
        if(this.username == null || this.username.equals("")) {
            this.adminMsg = "用户名不能为空";
            return false;
        } else if (this.password  == null || this.password.equals("")) {
            this.adminMsg = "密码不能为空";
            return false;
        }
        return true;
    }
}
