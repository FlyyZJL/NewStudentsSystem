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
<ul>
    <!-- 添加老师账号 -->
    <li><a href="createUser.jsp">添加用户</a></li>

    <!-- 创建班级院系 -->
    <li><a href="createDepartmentClass.jsp">创建班级院系</a></li>

    <!-- 分配班级和老师的关系 -->
    <li><a href="assignTeacherClass.jsp">分配班级和老师的关系</a></li>
</ul>
</body>
</html>

