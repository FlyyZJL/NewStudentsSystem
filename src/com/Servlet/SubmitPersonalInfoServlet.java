package com.Servlet;

import com.dao.StudentInfoDao;
import com.dao.StudentInfoDaoImpl;
import com.dao.UserDao;
import com.dao.UserDaoImpl;
import com.model.StudentInfo;
import com.model.User;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/submitPersonalInfo")
public class SubmitPersonalInfoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 设置请求和响应的字符编码为UTF-8，防止中文乱码
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        // 获取当前会话对象
        HttpSession session = request.getSession();
        // 从会话中获取用户名
        String username = (String) session.getAttribute("username");

        // 创建UserDao对象，通过用户名获取用户信息
        UserDao userDao = new UserDaoImpl();
        User user = userDao.getUserByUsername(username);
        // 获取用户的班级ID
        String classId = user.getClassId();

        // 创建StudentInfoDao对象，通过用户名获取已有的学生信息
        StudentInfoDao studentInfoDao = new StudentInfoDaoImpl();
        StudentInfo existingInfo = studentInfoDao.getStudentInfoByUsername(username);

        // 初始化提示信息
        String alertMessage = "";

        // 检查是否已有学生信息
        if (existingInfo != null) {
            // 如果状态为Pending，提示正在审核中
            if ("Pending".equals(existingInfo.getStatus())) {
                alertMessage = "提交正在审核中,请不要重复提交";
                // 如果状态为Approved，提示已经通过
            } else if ("Approved".equals(existingInfo.getStatus())) {
                alertMessage = "提交已经通过,请不要重复提交";
            }
        }

        // 如果有提示信息，则显示提示并跳转到学生主页
        if (!alertMessage.isEmpty()) {
            response.getWriter().write("<script>alert('" + alertMessage + "');window.top.location.href='student.jsp';</script>");
            return;
        }

        // 获取表单中的个人信息参数
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String origin = request.getParameter("origin");
        Date birthDate = Date.valueOf(request.getParameter("birthDate"));
        String ethnicity = request.getParameter("ethnicity");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

        // 创建StudentInfo对象，并设置各属性值
        StudentInfo studentInfo = new StudentInfo();
        studentInfo.setName(name);
        studentInfo.setGender(gender);
        studentInfo.setOrigin(origin);
        studentInfo.setBirthDate(birthDate);
        studentInfo.setEthnicity(ethnicity);
        studentInfo.setPhone(phone);
        studentInfo.setEmail(email);
        studentInfo.setClassId(classId);
        studentInfo.setStatus("Pending");

        // 将学生信息添加到数据库中
        studentInfoDao.addStudentInfo(studentInfo);

        // 提示提交成功并跳转到学生主页
        response.getWriter().write("<script>alert('提交成功，请等待审核');window.top.location.href='student.jsp';</script>");
    }
}

