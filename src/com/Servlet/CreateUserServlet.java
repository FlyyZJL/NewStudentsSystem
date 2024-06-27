package com.Servlet;

import com.dao.DepartmentClassDao;
import com.dao.DepartmentClassDaoImpl;
import com.dao.UserDao;
import com.dao.UserDaoImpl;
import com.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/createUser")
public class CreateUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String userType = request.getParameter("userType");

        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setUserType(userType);

        if ("student".equals(userType)) {
            String department = request.getParameter("department");
            String studentClass = request.getParameter("class");
            DepartmentClassDao departmentClassDao = new DepartmentClassDaoImpl();
            String departmentId = departmentClassDao.getDepartmentIdByName(department);
            String classId = departmentClassDao.getClassIdByName(studentClass);

            user.setDepartment(departmentId);
            user.setClassId(classId);
        }

        UserDao userDao = new UserDaoImpl();
        userDao.addUser(user);

        String message = "用户创建成功！";
        String script = "<script>alert('" + message + "'); window.top.location.href='admin.jsp';</script>";
        response.getWriter().write(script);
    }
}
