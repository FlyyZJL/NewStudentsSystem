package com.Servlet;

import com.dao.UserDao;
import com.dao.UserDaoImpl;
import com.dao.StudentInfoDao;
import com.dao.StudentInfoDaoImpl;
import com.model.User;
import com.model.StudentInfo;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/addStudent")
public class AddStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        // 获取表单数据
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String nativePlace = request.getParameter("nativePlace");
        String birthDate = request.getParameter("birthDate");
        String ethnicity = request.getParameter("ethnicity");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

        // 创建用户对象
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setUserType("student");

        // 将用户存入数据库
        UserDao userDao = new UserDaoImpl();
        userDao.addUser(user);

        // 获取新创建的用户ID
        int userId = userDao.getUserIdByUsername(username);

        // 创建学生信息对象
        StudentInfo studentInfo = new StudentInfo();
        studentInfo.setId(userId);
        studentInfo.setName(name);
        studentInfo.setGender(gender);
        studentInfo.setOrigin(nativePlace);
        studentInfo.setBirthDate(Date.valueOf(birthDate));
        studentInfo.setEthnicity(ethnicity);
        studentInfo.setPhone(phone);
        studentInfo.setEmail(email);

        // 将学生信息存入数据库
        StudentInfoDao studentInfoDao = new StudentInfoDaoImpl();
        studentInfoDao.addStudentInfo(studentInfo);

        // 重定向到教师主页
        response.sendRedirect("teacher.jsp");
    }
}
