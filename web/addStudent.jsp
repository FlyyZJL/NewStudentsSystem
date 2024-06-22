<%--
  Created by IntelliJ IDEA.
  User: 枫翎月影
  Date: 2024/6/22
  Time: 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加学生</title>
</head>
<body>
<h1>添加学生</h1>
<form action="addStudent" method="post">
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
            <label for="name">姓名：</label>
            <input type="text" id="name" name="name" required>
        </li>
        <li>
            <label for="gender">性别：</label>
            <input type="text" id="gender" name="gender" required>
        </li>
        <li>
            <label for="nativePlace">籍贯：</label>
            <input type="text" id="nativePlace" name="nativePlace" required>
        </li>
        <li>
            <label for="birthDate">出生日期：</label>
            <input type="date" id="birthDate" name="birthDate" required>
        </li>
        <li>
            <label for="ethnicity">民族：</label>
            <input type="text" id="ethnicity" name="ethnicity" required>
        </li>
        <li>
            <label for="phone">电话：</label>
            <input type="text" id="phone" name="phone" required>
        </li>
        <li>
            <label for="email">邮箱：</label>
            <input type="email" id="email" name="email" required>
        </li>
    </ul>
    <button type="submit">提交</button>
</form>
</body>
</html>
