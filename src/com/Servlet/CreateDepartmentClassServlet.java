package com.Servlet;

import com.dao.DepartmentClassDao;
import com.dao.DepartmentClassDaoImpl;
import com.model.DepartmentClass;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/createDepartmentClass")
public class CreateDepartmentClassServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        // 获取表单数据
        int departmentId = Integer.parseInt(request.getParameter("departmentId"));
        int classId = Integer.parseInt(request.getParameter("classId"));
        String departmentName = request.getParameter("departmentName");
        String className = request.getParameter("className");

        // 创建院系班级对象
        DepartmentClass departmentClass = new DepartmentClass();
        departmentClass.setDepartmentId(departmentId);
        departmentClass.setClassId(classId);
        departmentClass.setDepartmentName(departmentName);
        departmentClass.setClassName(className);

        // 获取数据访问对象
        DepartmentClassDao departmentClassDao = new DepartmentClassDaoImpl();

        // 检查院系ID和班级ID是否存在
        boolean departmentExists = departmentClassDao.existsDepartmentId(departmentId);
        boolean classExists = departmentClassDao.existsClassId(classId);

        if (departmentExists || classExists) {
            // 如果院系ID或班级ID存在，设置错误消息并转发回表单页面
            request.setAttribute("errorMessage", "院系ID或班级ID已存在！");
            request.getRequestDispatcher("createDepartmentClass.jsp").forward(request, response);
        } else {
            // 将院系班级信息存入数据库
            departmentClassDao.addDepartmentClass(departmentClass);

            // 重定向到管理员界面
            response.sendRedirect("admin.jsp");
        }
    }
}

