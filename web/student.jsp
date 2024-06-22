<%--
  Created by IntelliJ IDEA.
  User: 枫翎月影
  Date: 2024/6/3
  Time: 18:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生主页</title>
</head>
<body>
<h1>学生主页</h1>
<p>欢迎您，${user.username}！</p>

<!-- 学生功能区域 -->
<ul>
    <li><a href="changePassword.jsp">修改密码</a></li>
    <li><a href="submitPersonalInfo.jsp">提交个人信息</a></li>
</ul>
</body>
</html>
