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
        // 设置请求和响应的字符编码为UTF-8，防止中文乱码
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        // 从请求中获取学生ID，并将其转换为整数类型
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        // 从请求中获取学生的各项个人信息
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String origin = request.getParameter("origin");
        Date birthDate = Date.valueOf(request.getParameter("birthDate"));
        String ethnicity = request.getParameter("ethnicity");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String classid = request.getParameter("classId");

        // 创建StudentInfo对象，并设置各属性值
        StudentInfo studentInfo = new StudentInfo();
        studentInfo.setId(studentId);
        studentInfo.setName(name);
        studentInfo.setGender(gender);
        studentInfo.setOrigin(origin);
        studentInfo.setBirthDate(birthDate);
        studentInfo.setEthnicity(ethnicity);
        studentInfo.setPhone(phone);
        studentInfo.setEmail(email);
        studentInfo.setClassId(classid);

        // 创建StudentInfoDao对象，并调用updateStudentInfo方法更新学生信息
        StudentInfoDao studentInfoDao = new StudentInfoDaoImpl();
        studentInfoDao.updateStudentInfo(studentInfo);

        // 重定向到查看班级学生信息页面
        response.sendRedirect("viewClassStudents");
    }
}

