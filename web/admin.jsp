<%--
  Created by IntelliJ IDEA.
  User: 枫翎月影
  Date: 2024/6/3
  Time: 18:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>管理员界面</title>
</head>
<body>
<h1>管理员界面</h1>
<p>欢迎您，${user.username}！</p>

<!-- 管理员功能区域 -->
<!-- 添加老师账号 -->
<form action="registerTeacher" method="post">
    <label for="teacherUsername">用户名：</label>
    <input type="text" id="teacherUsername" name="teacherUsername" required>
    <label for="teacherPassword">密码：</label>
    <input type="password" id="teacherPassword" name="teacherPassword" required>
    <button type="submit">添加老师账号</button>
</form>

<!-- 添加学生账号 -->
<form action="registerStudent" method="post">
    <label for="studentUsername">用户名：</label>
    <input type="text" id="studentUsername" name="studentUsername" required>
    <label for="studentPassword">密码：</label>
    <input type="password" id="studentPassword" name="studentPassword" required>
    <button type="submit">添加学生账号</button>
</form>

<!-- 创建班级院系 -->
<form action="createDepartmentClass" method="post">
    <!-- 表单项 -->
    <label for="departmentName">院系名称：</label>
    <input type="text" id="departmentName" name="departmentName" required><br>
    <label for="className">班级名称：</label>
    <input type="text" id="className" name="className" required><br>
    <button type="submit">创建班级院系</button>
</form>

<!-- 分配班级和老师的关系 -->
<form action="assignTeacherClass" method="post">
    <!-- 表单项 -->
    <label for="teacherId">老师ID：</label>
    <input type="text" id="teacherId" name="teacherId" required><br>
    <label for="classId">班级ID：</label>
    <input type="text" id="classId" name="classId" required><br>
    <button type="submit">分配班级和老师的关系</button>
</form>
</body>
</html>
