<%--
  Created by IntelliJ IDEA.
  User: 枫翎月影
  Date: 2024/6/22
  Time: 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>修改学生信息</title>
</head>
<body>
<h1>修改学生信息</h1>
<form action="modifyStudentInfo" method="post">
    <input type="hidden" name="studentId" value="${student.userId}">
    <ul>
        <li>
            <label for="name">姓名：</label>
            <input type="text" id="name" name="name" value="${student.name}" required>
        </li>
        <li>
            <label for="gender">性别：</label>
            <input type="text" id="gender" name="gender" value="${student.gender}" required>
        </li>
        <li>
            <label for="nativePlace">籍贯：</label>
            <input type="text" id="nativePlace" name="nativePlace" value="${student.nativePlace}" required>
        </li>
        <li>
            <label for="birthDate">出生日期：</label>
            <input type="date" id="birthDate" name="birthDate" value="${student.birthDate}" required>
        </li>
        <li>
            <label for="ethnicity">民族：</label>
            <input type="text" id="ethnicity" name="ethnicity" value="${student.ethnicity}" required>
        </li>
        <li>
            <label for="phone">电话：</label>
            <input type="text" id="phone" name="phone" value="${student.phone}" required>
        </li>
        <li>
            <label for="email">邮箱：</label>
            <input type="email" id="email" name="email" value="${student.email}" required>
        </li>
    </ul>
    <button type="submit">提交</button>
</form>
</body>
</html>
