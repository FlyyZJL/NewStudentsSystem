<%--
  Created by IntelliJ IDEA.
  User: 枫翎月影
  Date: 2024/6/22
  Time: 9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>查看全班学生信息</title>
</head>
<body>
<h1>全班学生信息</h1>
<c:forEach var="student" items="${students}">
    <ul>
        <li>姓名: ${student.name}</li>
        <li>性别: ${student.gender}</li>
        <li>籍贯: ${student.origin}</li>
        <li>出生日期: ${student.birthDate}</li>
        <li>民族: ${student.ethnicity}</li>
        <li>电话: ${student.phone}</li>
        <li>邮箱: ${student.email}</li>
    </ul>
</c:forEach>
</body>
</html>
