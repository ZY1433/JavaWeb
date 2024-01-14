package web.Servlet;

import domain.News;
import service.NewsService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class NewsMangePageServlet extends HttpServlet {
    private static final String LOGIN_FORM = "/WEB-INF/newsMangePage.jsp";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        NewsService newsService = new NewsService();
        List<News> newsList = newsService.getAllNews();
        session.setAttribute("newsList",newsList);
        req.getRequestDispatcher(LOGIN_FORM).forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
