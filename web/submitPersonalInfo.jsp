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
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 10px;
            max-width: 600px;
        }
        .form-group {
            margin-bottom: 1rem;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="text-center">提交个人信息</h1>
    <form action="submitPersonalInfo" method="post">
        <div class="form-group">
            <label for="name">姓名：</label>
            <input type="text" class="form-control" id="name" name="name" value="${user.username}" required>
        </div>
        <div class="form-group">
            <label for="gender">性别：</label>
            <input type="text" class="form-control" id="gender" name="gender" required>
        </div>
        <div class="form-group">
            <label for="origin">籍贯：</label>
            <input type="text" class="form-control" id="origin" name="origin" required>
        </div>
        <div class="form-group">
            <label for="birthDate">出生日期：</label>
            <input type="date" class="form-control" id="birthDate" name="birthDate" required>
        </div>
        <div class="form-group">
            <label for="ethnicity">民族：</label>
            <input type="text" class="form-control" id="ethnicity" name="ethnicity">
        </div>
        <div class="form-group">
            <label for="phone">电话：</label>
            <input type="text" class="form-control" id="phone" name="phone" pattern="\d{11}" title="请输入11位数字" required>
        </div>
        <div class="form-group">
            <label for="email">邮箱：</label>
            <input type="email" class="form-control" id="email" name="email" pattern="^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$" title="请输入有效的电子邮箱地址" required>
</div>

        <!-- 隐藏域包含班级ID -->
        <input type="hidden" id="classId" name="classId" value="<%= request.getAttribute("classId") %>">

        <button type="submit" class="btn btn-primary btn-block">提交</button>
    </form>
</div>
<script src="jquery-3.3.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
