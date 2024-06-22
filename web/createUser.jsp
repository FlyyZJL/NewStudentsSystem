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
    <script>
        function toggleStudentFields() {
            var userType = document.querySelector('input[name="userType"]:checked').value;
            var studentFields = document.getElementById("studentFields");
            if (userType === "student") {
                studentFields.style.display = "block";
            } else {
                studentFields.style.display = "none";
            }
        }
    </script>
</head>
<body>
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

    <div id="studentFields" style="display: none;">
        <h2>学生信息</h2>
        <ul>
            <li>
                <label for="department">院系：</label>
                <select id="department" name="department">
                    <option value="">请选择院系</option>
                    <%
                        DepartmentClassDao departmentClassDao = new DepartmentClassDaoImpl();
                        List<DepartmentClass> departmentClassList = departmentClassDao.getAllDepartmentClasses();
                        for (DepartmentClass departmentClass : departmentClassList) {
                    %>
                    <option value="<%= departmentClass.getDepartmentName() %>"><%= departmentClass.getDepartmentName() %></option>
                    <% } %>
                </select>
            </li>
            <li>
                <label for="class">班级：</label>
                <select id="class" name="class">
                    <option value="">请选择班级</option>
                    <%
                        for (DepartmentClass departmentClass : departmentClassList) {
                    %>
                    <option value="<%= departmentClass.getClassName() %>"><%= departmentClass.getClassName() %></option>
                    <% } %>
                </select>
            </li>
        </ul>
    </div>

    <button type="submit">创建用户</button>
</form>
</body>
</html>
