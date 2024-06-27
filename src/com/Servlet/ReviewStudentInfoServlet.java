package com.Servlet;

import com.dao.StudentInfoDao;
import com.dao.StudentInfoDaoImpl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/reviewStudentInfo")
public class ReviewStudentInfoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        // 获取请求参数
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        String action = request.getParameter("action");

        // 更新学生信息状态
        StudentInfoDao studentInfoDao = new StudentInfoDaoImpl();
        if ("approve".equals(action)) {
            studentInfoDao.updateStudentStatus(studentId, "Approved");
        } else if ("reject".equals(action)) {
            studentInfoDao.deleteStudentById(studentId);
//            studentInfoDao.updateStudentStatus(studentId, "Rejected");
        }

        // 重定向到教师主页
        response.sendRedirect("teacher.jsp");
    }
}

