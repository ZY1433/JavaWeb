package web.Servlet;

import domain.User;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AdminLoginServlet extends HttpServlet {
    private String adminname;
    private String password;
    private String adminloginMsg;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        this.adminname = req.getParameter("adminname");
        this.password = req.getParameter("password");

        if (!validate()) {
            req.setAttribute("adminloginMsg",adminloginMsg);
            req.getRequestDispatcher("admin").forward(req,resp);
        } else {
            UserService userService = new UserService();
            User loginAdmin = userService.adminLogin(this.adminname,this.password);
            if (loginAdmin != null) {
                HttpSession session = req.getSession();
                session.setAttribute("loginAdmin",loginAdmin);
                resp.sendRedirect("userMangePage");
            } else {
                req.setAttribute("adminloginMsg",userService.getMsg());
                req.getRequestDispatcher("admin").forward(req,resp);
            }
        }
    }

    private boolean validate() {
        if(this.adminname == null || this.adminname.equals("")) {
            this.adminloginMsg = "用户名不能为空";
            return false;
        } else if (this.password  == null || this.password.equals("")) {
            this.adminloginMsg = "密码不能为空";
            return false;
        }
        return true;
    }
}
