<%--
  Created by IntelliJ IDEA.
  User: 枫翎月影
  Date: 2024/6/22
  Time: 11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.dao.DepartmentClassDao, com.dao.DepartmentClassDaoImpl, com.model.DepartmentClass" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>创建用户</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
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
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            margin-bottom: 15px;
        }
        label {
            display: inline-block;
            width: 120px;
            font-weight: bold;
        }
        input[type="text"],
        input[type="password"],
        select {
            width: calc(100% - 130px);
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }
        button[type="submit"] {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
        }
        button[type="submit"]:hover {
            background-color: #0056b3;
        }
        #studentFields {
            display: none;
        }
        h2 {
            margin-top: 20px;
        }
    </style>
    <script>
        function toggleStudentFields() {
            var userType = document.querySelector('input[name="userType"]:checked').value;
            var studentFields = document.getElementById("studentFields");
            var department = document.getElementById("department");
            var classField = document.getElementById("class");

            if (userType === "student") {
                studentFields.style.display = "block";
                department.setAttribute("required", "required");
                classField.setAttribute("required", "required");
            } else {
                studentFields.style.display = "none";
                department.removeAttribute("required");
                classField.removeAttribute("required");
            }
        }
    </script>
</head>
<body>
<div class="container">
    <h1>创建用户</h1>
    <form action="createUser" method="post">
        <ul>
            <li>
                <label for="username">用户名：</label>
                <input type="text" id="username" name="username" required>
            </li>
            <li>
                <label for="password">密码：</label>
                <input type="password" id="password" name="password" required>
            </li>
            <li>
                <label>用户类型：</label>
                <input type="radio" id="teacher" name="userType" value="teacher" onclick="toggleStudentFields()" required>
                <label for="teacher">老师</label>
                <input type="radio" id="student" name="userType" value="student" onclick="toggleStudentFields()" required>
                <label for="student">学生</label>
            </li>
        </ul>

        <div id="studentFields">
            <h2>学生信息</h2>
            <ul>
                <li>
                    <label for="department">院系：</label>
                    <select id="department" name="department" required>
                        <option value="">请选择院系</option>
                        <% DepartmentClassDao departmentClassDao = new DepartmentClassDaoImpl();
                            List<DepartmentClass> departmentClassList = departmentClassDao.getAllDepartmentClasses();
                            for (DepartmentClass departmentClass : departmentClassList) { %>
                        <option value="<%= departmentClass.getDepartmentName() %>"><%= departmentClass.getDepartmentName() %></option>
                        <% } %>
                    </select>
                </li>
                <li>
                    <label for="class">班级：</label>
                    <select id="class" name="class" required>
                        <option value="">请选择班级</option>
                        <% for (DepartmentClass departmentClass : departmentClassList) { %>
                        <option value="<%= departmentClass.getClassName() %>"><%= departmentClass.getClassName() %></option>
                        <% } %>
                    </select>
                </li>
            </ul>
        </div>

        <button type="submit">创建用户</button>
    </form>
</div>
</body>
</html>

