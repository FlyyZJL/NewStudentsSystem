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
        // 切换学生信息字段的显示与隐藏
        function toggleStudentFields() {
            var userType = document.querySelector('input[name="userType"]:checked').value; // 获取选中的用户类型
            var studentFields = document.getElementById("studentFields"); // 获取学生信息字段容器
            var department = document.getElementById("department"); // 获取院系选择框
            var classField = document.getElementById("class"); // 获取班级选择框

            if (userType === "student") {
                studentFields.style.display = "block"; // 如果选中学生，则显示学生信息字段
                department.setAttribute("required", "required"); // 设置院系选择框为必填
                classField.setAttribute("required", "required"); // 设置班级选择框为必填
            } else {
                studentFields.style.display = "none"; // 如果选中老师，则隐藏学生信息字段
                department.removeAttribute("required"); // 移除院系选择框的必填属性
                classField.removeAttribute("required"); // 移除班级选择框的必填属性
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
                <input type="text" id="username" name="username" required> <!-- 用户名输入框，必填 -->
            </li>
            <li>
                <label for="password">密码：</label>
                <input type="password" id="password" name="password" required> <!-- 密码输入框，必填 -->
            </li>
            <li>
                <label>用户类型：</label>
                <input type="radio" id="teacher" name="userType" value="teacher" onclick="toggleStudentFields()" required>
                <label for="teacher">老师</label> <!-- 老师选项，单选按钮 -->
                <input type="radio" id="student" name="userType" value="student" onclick="toggleStudentFields()" required>
                <label for="student">学生</label> <!-- 学生选项，单选按钮 -->
            </li>
        </ul>

        <div id="studentFields">
            <h2>学生信息</h2>
            <ul>
                <li>
                    <label for="department">院系：</label>
                    <select id="department" name="department" required> <!-- 院系选择框，必填 -->
                        <option value="">请选择院系</option>
                        <%
                            DepartmentClassDao departmentClassDao = new DepartmentClassDaoImpl();
                            List<DepartmentClass> departmentClassList = departmentClassDao.getAllDepartmentClasses(); // 获取所有院系和班级信息
                            for (DepartmentClass departmentClass : departmentClassList) {
                        %>
                        <option value="<%= departmentClass.getDepartmentName() %>"><%= departmentClass.getDepartmentName() %></option> <!-- 动态生成院系选项 -->
                        <% } %>
                    </select>
                </li>
                <li>
                    <label for="class">班级：</label>
                    <select id="class" name="class" required> <!-- 班级选择框，必填 -->
                        <option value="">请选择班级</option>
                        <%
                            for (DepartmentClass departmentClass : departmentClassList) {
                        %>
                        <option value="<%= departmentClass.getClassName() %>"><%= departmentClass.getClassName() %></option> <!-- 动态生成班级选项 -->
                        <% } %>
                    </select>
                </li>
            </ul>
        </div>

        <button type="submit">创建用户</button> <!-- 提交按钮 -->
    </form>
</div>
</body>
</html>
