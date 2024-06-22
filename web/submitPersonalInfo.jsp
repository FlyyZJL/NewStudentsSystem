<%--
  Created by IntelliJ IDEA.
  User: 枫翎月影
  Date: 2024/6/22
  Time: 9:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>提交个人信息</title>
</head>
<body>
<h1>提交个人信息</h1>
<form action="submitPersonalInfo" method="post">
    <label for="name">姓名：</label>
    <input type="text" id="name" name="name" required><br>
    <label for="gender">性别：</label>
    <input type="text" id="gender" name="gender" required><br>
    <label for="origin">籍贯：</label>
    <input type="text" id="origin" name="origin" required><br>
    <label for="birthDate">出生日期：</label>
    <input type="date" id="birthDate" name="birthDate" required><br>
    <label for="ethnicity">民族：</label>
    <input type="text" id="ethnicity" name="ethnicity"><br>
    <label for="phone">电话：</label>
    <input type="text" id="phone" name="phone"><br>
    <label for="email">邮箱：</label>
    <input type="email" id="email" name="email"><br>

    <!-- 隐藏域包含班级ID -->
    <input type="hidden" id="classId" name="classId" value="<%= request.getAttribute("classId") %>">

    <button type="submit">提交</button>
</form>
</body>
</html>

