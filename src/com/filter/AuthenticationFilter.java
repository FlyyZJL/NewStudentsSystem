package com.filter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
public class AuthenticationFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);

        // 获取请求的URI
        String requestURI = httpRequest.getRequestURI();

        // 检查请求是否登录页面、登录处理Servlet或资源文件（如CSS、JS等）
        if (requestURI.endsWith("login.jsp") || requestURI.endsWith("login") || requestURI.contains("/static/")) {
            chain.doFilter(request, response);
            return;
        }

        // 检查用户是否已登录
        if (session == null || session.getAttribute("user") == null) {
            // 用户未登录，重定向到登录页面
            String loginPage = httpRequest.getContextPath() + "/login.jsp";
            String alertMessage = "未登录，请登录！";
            String script = "<script type='text/javascript'>alert('" + alertMessage + "'); window.location.href='" + loginPage + "';</script>";
            httpResponse.setContentType("text/html;charset=UTF-8");
            httpResponse.getWriter().write(script);
        } else {
            // 用户已登录，继续处理请求
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {
    }
}
