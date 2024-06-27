package com.Servlet;

import com.dao.StudentInfoDao;
import com.dao.StudentInfoDaoImpl;
import com.model.StudentInfo;
import com.model.User;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/viewPendingStudents")
public class ViewPendingStudentsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        // 获取当前用户
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        // 获取待审核学生信息
        StudentInfoDao studentInfoDao = new StudentInfoDaoImpl();
        List<StudentInfo> pendingStudents = studentInfoDao.getPendingStudents(user.getId());

        // 将待审核学生信息存入请求中并转发到JSP页面
        request.setAttribute("students2", pendingStudents);
        try {
            request.getRequestDispatcher("viewPendingStudentsContent.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
