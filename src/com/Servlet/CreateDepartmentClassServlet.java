package com.Servlet;


        import com.dao.DepartmentClassDao;
        import com.dao.DepartmentClassDaoImpl;
        import com.model.DepartmentClass;

        import javax.servlet.annotation.WebServlet;
        import javax.servlet.http.HttpServlet;
        import javax.servlet.http.HttpServletRequest;
        import javax.servlet.http.HttpServletResponse;
        import java.io.IOException;

@WebServlet("/createDepartmentClass")
public class CreateDepartmentClassServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        // 获取表单数据
        String departmentName = request.getParameter("departmentName");
        String className = request.getParameter("className");

        // 创建院系班级对象
        DepartmentClass departmentClass = new DepartmentClass();
        departmentClass.setDepartmentName(departmentName);
        departmentClass.setClassName(className);

        // 将院系班级信息存入数据库
        DepartmentClassDao departmentClassDao = new DepartmentClassDaoImpl();
        departmentClassDao.addDepartmentClass(departmentClass);

        // 重定向到管理员界面
        response.sendRedirect("admin.jsp");
    }
}
