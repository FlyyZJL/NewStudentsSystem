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
    <title>创建院系班级</title>
</head>
<body>
<h1>创建院系班级</h1>
<form action="createDepartmentClass" method="post">
    <ul>
        <li>
            <label for="departmentId">院系ID：</label>
            <input type="text" id="departmentId" name="departmentId" required>
        </li>
        <li>
            <label for="classId">班级ID：</label>
            <input type="text" id="classId" name="classId" required>
        </li>
        <li>
            <label for="departmentName">院系名称：</label>
            <input type="text" id="departmentName" name="departmentName" required>
        </li>
        <li>
            <label for="className">班级名称：</label>
            <input type="text" id="className" name="className" required>
        </li>
    </ul>
    <button type="submit">提交</button>
</form>
</body>
</html>

