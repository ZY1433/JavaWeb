package web.Filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class UserMangePageFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpSession session = request.getSession();
        Object loginAdmin = session.getAttribute("loginAdmin");
        System.out.println(111);
        if (loginAdmin != null) {
            filterChain.doFilter(request,response);
        } else {
            response.sendRedirect("main");
        }
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
