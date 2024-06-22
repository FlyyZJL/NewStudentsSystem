package com.Servlet;

        import com.dao.UserDao;
        import com.dao.UserDaoImpl;
        import com.model.User;
        import javax.servlet.annotation.WebServlet;
        import javax.servlet.http.HttpServlet;
        import javax.servlet.http.HttpServletRequest;
        import javax.servlet.http.HttpServletResponse;
        import javax.servlet.http.HttpSession;
        import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        // 获取用户名和密码
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // 根据用户名查询用户
        UserDao userDao = new UserDaoImpl();
        User user = userDao.getUserByUsername(username);

        // 验证用户名和密码
        if (user != null && user.getPassword().equals(password)) {
            // 将用户信息存储到 session 中
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            session.setAttribute("username",user.getUsername());

            // 根据用户类型跳转到不同的主页
            String userType = user.getUserType();
            if ("admin".equals(userType)) {
                response.sendRedirect("admin.jsp");
            } else if ("teacher".equals(userType)) {
                response.sendRedirect("teacher.jsp");
            } else if ("student".equals(userType)) {
                response.sendRedirect("student.jsp");
            }
        } else {
            // 用户名或密码错误，重定向到登录页面并显示错误消息
            response.sendRedirect("login.jsp?error=1");
        }
    }
}
