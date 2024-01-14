package web.Servlet;

import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UserMangeServlet extends HttpServlet {
    private String id;
    private String username;
    private String email;
    private String password;
    private boolean isAdmin;
    private String type;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.type = req.getParameter("type");
        if (type.equals("add")) {
            this.username = req.getParameter("username");
            this.email = req.getParameter("email");
            this.password = req.getParameter("password");
            String admin = req.getParameter("isAdmin");
            if(admin != null) {
                this.isAdmin = true;
            }
            UserService userService = new UserService();
            boolean flag = userService.adminRegister(this.username,this.email,this.password,this.isAdmin);
            if (flag) {
                req.setAttribute("adminMsg","添加成功！");
            } else {
                req.setAttribute("adminMsg",userService.getMsg());
            }
            req.getRequestDispatcher("userMangePage").forward(req,resp);
        }

    }
}
