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
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        UserDao userDao = new UserDaoImpl();
        User user = userDao.getUserByUsername(username);
        String classId = user.getClassId();

        StudentInfoDao studentInfoDao = new StudentInfoDaoImpl();
        StudentInfo existingInfo = studentInfoDao.getStudentInfoByUsername(username);

        String alertMessage = "";

        if (existingInfo != null) {
            if ("Pending".equals(existingInfo.getStatus())) {
                alertMessage = "提交正在审核中,请不要重复提交";
            } else if ("Approved".equals(existingInfo.getStatus())) {
                alertMessage = "提交已经通过,请不要重复提交";
            }
        }

        if (!alertMessage.isEmpty()) {
            response.getWriter().write("<script>alert('" + alertMessage + "');window.top.location.href='student.jsp';</script>");
            return;
        }

        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String origin = request.getParameter("origin");
        Date birthDate = Date.valueOf(request.getParameter("birthDate"));
        String ethnicity = request.getParameter("ethnicity");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

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

        studentInfoDao.addStudentInfo(studentInfo);

        response.getWriter().write("<script>alert('提交成功，请等待审核');window.top.location.href='student.jsp';</script>");
    }
}
