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

@WebServlet("/changePassword")
public class ChangePasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 获取当前密码和新密码
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");

        // 获取当前用户
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        // 验证当前密码是否正确
        if (user.getPassword().equals(currentPassword)) {
            // 更新密码
            user.setPassword(newPassword);
            UserDao userDao = new UserDaoImpl();
            userDao.updateUser(user);

            // 重定向到主页
            if ("teacher".equals(user.getUserType())) {
                response.sendRedirect("teacher.jsp");
            } else if ("student".equals(user.getUserType())) {
                response.sendRedirect("student.jsp");
            }
        } else {
            // 当前密码错误，重定向到修改密码页面并显示错误消息
            response.sendRedirect("changePassword.jsp?error=1");
        }
    }
}
