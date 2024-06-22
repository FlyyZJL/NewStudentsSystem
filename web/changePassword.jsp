<%--
  Created by IntelliJ IDEA.
  User: 枫翎月影
  Date: 2024/6/22
  Time: 9:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>修改密码</title>
</head>
<body>
<h1>修改密码</h1>
<form action="changePassword" method="post">
    <label for="currentPassword">当前密码：</label>
    <input type="password" id="currentPassword" name="currentPassword" required><br>
    <label for="newPassword">新密码：</label>
    <input type="password" id="newPassword" name="newPassword" required><br>
    <button type="submit">提交</button>
</form>
<% if (request.getParameter("error") != null) { %>
<p style="color: red;">当前密码错误，请重试。</p>
<% } %>
</body>
</html>
