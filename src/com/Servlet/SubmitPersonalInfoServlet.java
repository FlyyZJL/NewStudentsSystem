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
        import java.sql.Date;

@WebServlet("/submitPersonalInfo")
public class SubmitPersonalInfoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        // 获取表单数据
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String nativePlace = request.getParameter("nativePlace");
        String birthDate = request.getParameter("birthDate");
        String ethnicity = request.getParameter("ethnicity");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");

        // 获取当前用户
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        // 创建学生信息对象
        StudentInfo studentInfo = new StudentInfo();
        studentInfo.setId(user.getUserid());
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

        // 重定向到主页
        if ("student".equals(user.getUserType())) {
            response.sendRedirect("student.jsp");
        } else if ("teacher".equals(user.getUserType())) {
            response.sendRedirect("teacher.jsp");
        }
    }
}
