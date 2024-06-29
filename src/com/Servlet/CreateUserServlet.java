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
        // 设置请求和响应的字符编码为UTF-8，防止中文乱码
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        // 从请求中获取用户名、密码和用户类型参数
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String userType = request.getParameter("userType");

        // 创建User对象并设置属性
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setUserType(userType);

        // 如果用户类型是学生，则获取院系和班级信息
        if ("student".equals(userType)) {
            String department = request.getParameter("department");
            String studentClass = request.getParameter("class");

            // 创建DepartmentClassDao对象，用于获取部门和班级的ID
            DepartmentClassDao departmentClassDao = new DepartmentClassDaoImpl();
            String departmentId = departmentClassDao.getDepartmentIdByName(department);
            String classId = departmentClassDao.getClassIdByName(studentClass);

            // 调用实体类的set方法，传入要存入的院系ID和班级ID
            user.setDepartment(departmentId);
            user.setClassId(classId);
        }

        // 创建UserDao对象，调用DAO实现类中的添加用户方法添加数据到数据库
        UserDao userDao = new UserDaoImpl();
        userDao.addUser(user);

        // 弹出提示信息，并跳转到admin.jsp页面
        String message = "用户创建成功！";
        String script = "<script>alert('" + message + "'); window.top.location.href='admin.jsp';</script>";
        response.getWriter().write(script);
    }
}
