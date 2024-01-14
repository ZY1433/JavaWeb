package web.Servlet;

import service.NewsService;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class UserMangePageServlet extends HttpServlet {
    private static final String LOGIN_FORM = "/WEB-INF/userMangePage.jsp";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        UserService userService = new UserService();
        List userList = userService.getAllUsers();
        session.setAttribute("userList",userList);

        req.getRequestDispatcher(LOGIN_FORM).forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
