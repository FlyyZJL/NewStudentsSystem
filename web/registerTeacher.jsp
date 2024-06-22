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
    <title>注册老师账号</title>
</head>
<body>
<h1>注册老师账号</h1>
<form action="addTeacher" method="post">
    <label for="teacherUsername">用户名：</label>
    <input type="text" id="teacherUsername" name="teacherUsername" required>
    <label for="teacherPassword">密码：</label>
    <input type="password" id="teacherPassword" name="teacherPassword" required>
    <button type="submit">注册</button>
</form>
</body>
</html>
