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
    <title>创建班级院系</title>
</head>
<body>
<h1>创建班级院系</h1>
<form action="createDepartmentClass" method="post">
    <label for="departmentName">院系名称：</label>
    <input type="text" id="departmentName" name="departmentName" required><br>
    <label for="className">班级名称：</label>
    <input type="text" id="className" name="className" required><br>
    <button type="submit">创建</button>
</form>
</body>
</html>
