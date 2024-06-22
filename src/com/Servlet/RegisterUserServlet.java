package com.Servlet;

import com.dao.UserDao;
import com.dao.UserDaoImpl;
import com.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/registerUser")
public class RegisterUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String userType = request.getParameter("userType");
        String department = request.getParameter("department");
        String classIdStr = request.getParameter("classId");

        String classId = null;
        if (classIdStr != null && !classIdStr.isEmpty()) {
            classId = classIdStr;
        }

        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setUserType(userType);
        user.setDepartment(department);
        user.setClassId(classId);
        user.setFirstLogin(true);

        UserDao userDao = new UserDaoImpl();
        userDao.addUser(user);

        response.sendRedirect("admin.jsp");
    }
}
