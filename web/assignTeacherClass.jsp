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
    <title>分配班级和老师的关系</title>
</head>
<body>
<h1>分配班级和老师的关系</h1>
<form action="assignTeacherClass" method="post">
    <label for="teacherId">老师ID：</label>
    <input type="text" id="teacherId" name="teacherId" required><br>
    <label for="classId">班级ID：</label>
    <input type="text" id="classId" name="classId" required><br>
    <button type="submit">确定</button>
</form>
</body>
</html>

