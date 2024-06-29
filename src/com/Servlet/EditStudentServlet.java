package com.Servlet;

        import com.dao.StudentInfoDao;
        import com.dao.StudentInfoDaoImpl;
        import com.model.StudentInfo;

        import javax.servlet.ServletException;
        import javax.servlet.annotation.WebServlet;
        import javax.servlet.http.HttpServlet;
        import javax.servlet.http.HttpServletRequest;
        import javax.servlet.http.HttpServletResponse;
        import java.io.IOException;

@WebServlet("/editStudent")
public class EditStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //从请求中获取学生ID
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        //实例化DAO实现类
        StudentInfoDao studentInfoDao = new StudentInfoDaoImpl();
        //调用根据学生ID找到学生信息的方法
        StudentInfo student = studentInfoDao.getStudentInfoById(studentId);
        //将方法返回的学生信息存入请求域
        request.setAttribute("student", student);
        //转发到编辑页处理
        request.getRequestDispatcher("editStudent.jsp").forward(request, response);
    }
}
