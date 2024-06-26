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
        import java.sql.Date;

@WebServlet("/updateStudent")
public class UpdateStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        int studentId = Integer.parseInt(request.getParameter("studentId"));
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String origin = request.getParameter("origin");
        Date birthDate = Date.valueOf(request.getParameter("birthDate"));
        String ethnicity = request.getParameter("ethnicity");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

        StudentInfo studentInfo = new StudentInfo();
        studentInfo.setId(studentId);
        studentInfo.setName(name);
        studentInfo.setGender(gender);
        studentInfo.setOrigin(origin);
        studentInfo.setBirthDate(birthDate);
        studentInfo.setEthnicity(ethnicity);
        studentInfo.setPhone(phone);
        studentInfo.setEmail(email);

        StudentInfoDao studentInfoDao = new StudentInfoDaoImpl();
        studentInfoDao.updateStudentInfo(studentInfo);

        response.sendRedirect("viewClassStudents");
    }
}
