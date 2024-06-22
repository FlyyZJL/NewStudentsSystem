<%--
  Created by IntelliJ IDEA.
  User: 枫翎月影
  Date: 2024/6/3
  Time: 18:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录</title>
</head>
<body>
<h1>登录</h1>
<form action="login" method="post">
    <label for="username">用户名：</label>
    <input type="text" id="username" name="username" required><br>
    <label for="password">密码：</label>
    <input type="password" id="password" name="password" required><br>
    <button type="submit">登录</button>
</form>
<% if (request.getParameter("error") != null) { %>
<p style="color: red;">用户名或密码错误，请重试。</p>
<% } %>
</body>
</html>
