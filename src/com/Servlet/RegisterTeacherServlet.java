package com.Servlet;

import com.dao.UserDao;
import com.dao.UserDaoImpl;
import com.model.User;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/registerTeacher")
public class RegisterTeacherServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        // 获取注册信息
        String username = request.getParameter("teacherUsername");
        String password = request.getParameter("teacherPassword");

        // 创建老师用户对象
        User teacher = new User();
        teacher.setUsername(username);
        teacher.setPassword(password);
        teacher.setUserType("teacher"); // 设置用户类型为老师

        // 将老师用户信息存入数据库
        UserDao userDao = new UserDaoImpl();
        userDao.addUser(teacher);

        // 重定向到管理员界面
        response.sendRedirect("admin.jsp");
    }
}
