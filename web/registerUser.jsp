<%@ page import="com.model.DepartmentClass" %>
<%@ page import="java.util.List" %>
<%@ page import="com.dao.DepartmentClassDao" %>
<%@ page import="com.dao.DepartmentClassDaoImpl" %><%--
  Created by IntelliJ IDEA.
  User: 枫翎月影
  Date: 2024/6/22
  Time: 16:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>创建用户</title>
</head>
<body>
<h1>创建用户</h1>
<form action="registerUser" method="post">
    <label for="username">用户名：</label>
    <input type="text" id="username" name="username" required><br>
    <label for="password">密码：</label>
    <input type="password" id="password" name="password" required><br>
    <label for="userType">用户类型：</label>
    <input type="radio" id="teacher" name="userType" value="teacher" onclick="showClassSelection(false)" required> 老师
    <input type="radio" id="student" name="userType" value="student" onclick="showClassSelection(true)"> 学生<br>
    <div id="classSelection" style="display:none;">
        <label for="department">院系：</label>
        <select id="department" name="department">
            <!-- 从数据库加载院系列表 -->
            <%-- Populate this with options from the database --%>
            <%
                DepartmentClassDao departmentClassDao = new DepartmentClassDaoImpl();
                List<DepartmentClass> departmentClasses = departmentClassDao.getAllDepartmentClasses();
                for (DepartmentClass departmentClass : departmentClasses) {
                    out.println("<option value=\"" + departmentClass.getDepartmentName() + "\">" + departmentClass.getDepartmentName() + "</option>");
                }
            %>
        </select><br>
        <label for="classId">班级：</label>
        <select id="classId" name="classId">
            <!-- 从数据库加载班级列表 -->
            <%-- Populate this with options from the database --%>
            <%
                for (DepartmentClass departmentClass : departmentClasses) {
                    out.println("<option value=\"" + departmentClass.getClassId() + "\">" + departmentClass.getClassName() + "</option>");
                }
            %>
        </select><br>
    </div>
    <input type="submit" value="提交">
</form>

<script>
    function showClassSelection(isStudent) {
        document.getElementById('classSelection').style.display = isStudent ? 'block' : 'none';
    }
</script>
</body>
</html>

