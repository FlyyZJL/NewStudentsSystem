package com.Servlet;

        import com.dao.UserDao;
        import com.dao.UserDaoImpl;
        import com.model.User;

        import javax.servlet.annotation.WebServlet;
        import javax.servlet.http.HttpServlet;
        import javax.servlet.http.HttpServletRequest;
        import javax.servlet.http.HttpServletResponse;
        import java.io.IOException;

@WebServlet("/registerStudent")
public class RegisterStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 获取注册信息
        String username = request.getParameter("studentUsername");
        String password = request.getParameter("studentPassword");

        // 创建学生用户对象
        User student = new User();
        student.setUsername(username);
        student.setPassword(password);
        student.setUserType("student"); // 设置用户类型为学生

        // 将学生用户信息存入数据库
        UserDao userDao = new UserDaoImpl();
        userDao.addUser(student);

        // 重定向到管理员界面
        response.sendRedirect("admin.jsp");
    }
}
