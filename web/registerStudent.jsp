<%--
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
    <title>注册学生账号</title>
</head>
<body>
<h1>注册学生账号</h1>
<form action="addStudent" method="post">
    <label for="studentUsername">用户名：</label>
    <input type="text" id="studentUsername" name="studentUsername" required>
    <label for="studentPassword">密码：</label>
    <input type="password" id="studentPassword" name="studentPassword" required>
    <button type="submit">注册</button>
</form>
</body>
</html>
