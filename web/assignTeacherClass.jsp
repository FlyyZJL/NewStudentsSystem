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
    <link href="bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: auto;
            background: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            text-align: center;
            margin-bottom: 30px;
        }
        form {
            margin-top: 20px;
        }
        label {
            font-weight: bold;
        }
        select, input[type="submit"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            margin-bottom: 15px;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>分配班级和老师的关系</h1>
    <form action="assignTeacherClass" method="post">
        <div class="form-group">
            <label for="teacherId">选择老师：</label>
            <select id="teacherId" name="teacherId" class="form-control" required>
                <!-- 从数据库加载教师列表 -->
                <%
                    UserDao userDao = new UserDaoImpl();
                    List<User> teachers = userDao.getAllTeachers();
                    for (User teacher : teachers) {
                        out.println("<option value=\"" + teacher.getId() + "\">" + teacher.getUsername() + "</option>");
                    }
                %>
            </select>
        </div>
        <div class="form-group">
            <label for="classId">选择班级：</label>
            <select id="classId" name="classId" class="form-control" required>
                <!-- 从数据库加载班级列表 -->
                <%
                    DepartmentClassDao departmentClassDao = new DepartmentClassDaoImpl();
                    List<DepartmentClass> departmentClasses = departmentClassDao.getAllDepartmentClasses();
                    for (DepartmentClass departmentClass : departmentClasses) {
                        out.println("<option value=\"" + departmentClass.getClassId() + "\">" + departmentClass.getClassName() + "</option>");
                    }
                %>
            </select>
        </div>
        <input type="submit" value="提交" class="btn btn-primary">
    </form>
</div>
</body>
</html>

