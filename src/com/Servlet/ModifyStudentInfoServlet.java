package com.Servlet;

import com.dao.StudentInfoDao;
import com.dao.StudentInfoDaoImpl;
import com.model.StudentInfo;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/modifyStudentInfo")
public class ModifyStudentInfoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        // 获取表单数据
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String nativePlace = request.getParameter("nativePlace");
        String birthDate = request.getParameter("birthDate");
        String ethnicity = request.getParameter("ethnicity");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

        // 创建学生信息对象
        StudentInfo studentInfo = new StudentInfo();
        studentInfo.setId(studentId);
        studentInfo.setName(name);
        studentInfo.setGender(gender);
        studentInfo.setOrigin(nativePlace);
        studentInfo.setBirthDate(Date.valueOf(birthDate));
        studentInfo.setEthnicity(ethnicity);
        studentInfo.setPhone(phone);
        studentInfo.setEmail(email);

        // 更新学生信息
        StudentInfoDao studentInfoDao = new StudentInfoDaoImpl();
        studentInfoDao.updateStudentInfo(studentInfo);

        // 重定向到教师主页
        response.sendRedirect("teacher.jsp");
    }
}
