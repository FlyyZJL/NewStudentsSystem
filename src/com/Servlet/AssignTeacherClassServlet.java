package com.Servlet;

        import com.dao.ClassTeacherRelationDao;
        import com.dao.ClassTeacherRelationDaoImpl;
        import com.model.ClassTeacherRelation;

        import javax.servlet.annotation.WebServlet;
        import javax.servlet.http.HttpServlet;
        import javax.servlet.http.HttpServletRequest;
        import javax.servlet.http.HttpServletResponse;
        import java.io.IOException;

@WebServlet("/assignTeacherClass")
public class AssignTeacherClassServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 获取表单数据
        int teacherId = Integer.parseInt(request.getParameter("teacherId"));
        int classId = Integer.parseInt(request.getParameter("classId"));

        // 创建班级与老师关系对象
        ClassTeacherRelation relation = new ClassTeacherRelation();
        relation.setTeacherId(teacherId);
        relation.setClassId(classId);

        // 将关系信息存入数据库
        ClassTeacherRelationDao relationDao = new ClassTeacherRelationDaoImpl();
        relationDao.addRelation(relation);

        // 重定向到管理员界面
        response.sendRedirect("admin.jsp");
    }
}
