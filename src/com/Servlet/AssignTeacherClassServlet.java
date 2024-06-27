package com.Servlet;


        import com.dao.ClassTeacherRelationDao;
        import com.dao.ClassTeacherRelationDaoImpl;
        import com.model.ClassTeacherRelation;

        import javax.servlet.ServletException;
        import javax.servlet.annotation.WebServlet;
        import javax.servlet.http.HttpServlet;
        import javax.servlet.http.HttpServletRequest;
        import javax.servlet.http.HttpServletResponse;
        import java.io.IOException;

@WebServlet("/assignTeacherClass")
public class AssignTeacherClassServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        // 获取表单数据
        int teacherId = Integer.parseInt(request.getParameter("teacherId"));
        int classId = Integer.parseInt(request.getParameter("classId"));

        // 创建班级与教师关系对象
        ClassTeacherRelation classTeacherRelation = new ClassTeacherRelation();
        classTeacherRelation.setTeacherId(teacherId);
        classTeacherRelation.setClassId(classId);

        // 将关系信息存入数据库
        ClassTeacherRelationDao classTeacherRelationDao = new ClassTeacherRelationDaoImpl();
        classTeacherRelationDao.addRelation(classTeacherRelation);

        // 重定向到管理员界面
        String message = "分配班级成功！";
        String script = "<script>alert('" + message + "'); window.top.location.href='admin.jsp';</script>";
        response.getWriter().write(script);
    }
}

