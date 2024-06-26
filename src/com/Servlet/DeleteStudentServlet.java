package com.Servlet;

        import com.dao.StudentInfoDao;
        import com.dao.StudentInfoDaoImpl;

        import javax.servlet.ServletException;
        import javax.servlet.annotation.WebServlet;
        import javax.servlet.http.HttpServlet;
        import javax.servlet.http.HttpServletRequest;
        import javax.servlet.http.HttpServletResponse;
        import java.io.IOException;

@WebServlet("/deleteStudent")
public class DeleteStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        StudentInfoDao studentInfoDao = new StudentInfoDaoImpl();
        studentInfoDao.deleteStudentById(studentId);
        response.sendRedirect("viewClassStudents");
    }
}
