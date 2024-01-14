package web.Servlet;

import service.NewsService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

public class NewsMangeServlet extends HttpServlet {
    private int newsId;
    private String title;
    private String content;
    private Date publishTime;
    private String type;
    private String newsMsg;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        this.type = req.getParameter("type");
        if (type.equals("add")) {
            this.title = req.getParameter("title");
            this.content = req.getParameter("content");

            if (!validate()){
                req.setAttribute("newsMsg",newsMsg);
                req.getRequestDispatcher("newsMangePage").forward(req,resp);
            }
            else {
                NewsService newsService = new NewsService();
                boolean flag = newsService.insertNews(this.title,this.content);
                if (flag) {
                    req.setAttribute("newsMsg","添加成功！");
                } else {
                    req.setAttribute("newsMsg","添加失败");
                }
                req.getRequestDispatcher("newsMangePage").forward(req,resp);
            }
        }
    }
    private boolean validate() {
        if(this.title == null || this.title.equals("")) {
            this.newsMsg = "新闻标题不能为空";
            return false;
        } else if (this.content  == null || this.content.equals("")) {
            this.newsMsg = "新闻内容不能为空";
            return false;
        }
        return true;
    }
}
