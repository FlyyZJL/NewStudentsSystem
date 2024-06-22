<%@ page import="com.dao.UserDao" %>
<%@ page import="com.dao.UserDaoImpl" %>
<%@ page import="com.model.User" %>
<%@ page import="com.dao.DepartmentClassDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.dao.DepartmentClassDaoImpl" %>
<%@ page import="com.model.DepartmentClass" %><%--
  Created by IntelliJ IDEA.
  User: 枫翎月影
  Date: 2024/6/3
  Time: 18:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>分配班级和老师的关系</title>
</head>
<body>
<h1>分配班级和老师的关系</h1>
<form action="assignTeacherClass" method="post">
    <label for="teacherId">老师：</label>
    <select id="teacherId" name="teacherId" required>
        <!-- 从数据库加载教师列表 -->
        <%
            UserDao userDao = new UserDaoImpl();
            List<User> teachers = userDao.getAllTeachers();
            for (User teacher : teachers) {
                out.println("<option value=\"" + teacher.getId() + "\">" + teacher.getUsername() + "</option>");
            }
        %>
    </select><br>
    <label for="classId">班级：</label>
    <select id="classId" name="classId" required>
        <!-- 从数据库加载班级列表 -->
        <%
            DepartmentClassDao departmentClassDao = new DepartmentClassDaoImpl();
            List<DepartmentClass> departmentClasses = departmentClassDao.getAllDepartmentClasses();
            for (DepartmentClass departmentClass : departmentClasses) {
                out.println("<option value=\"" + departmentClass.getClassId() + "\">" + departmentClass.getClassName() + "</option>");
            }
        %>
    </select><br>
    <input type="submit" value="提交">
</form>
</body>
</html>
