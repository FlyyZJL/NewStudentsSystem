<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>本班学生信息</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .search-container {
            text-align: right;
            margin-right: 100px;
        }
        .search-container input {
            width: 300px;
            height: 50px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .student-list {
            list-style-type: none;
            padding: 0;
            margin: 20px auto;
            max-width: 1200px;
        }
        .student-list li {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin: 10px 0;
            padding: 10px;
            background-color: #fff;
        }
        .student-list .header {
            background-color: #4CAF50;
            color: white;
            font-weight: bold;
        }
        .student-list .header li {
            border: none;
        }
        .student-list span {
            flex: 1;
            text-align: center;
        }
        .student-list form {
            display: inline;
        }
        .student-list button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            margin: 5px;
            border-radius: 3px;
            cursor: pointer;
        }
        .student-list button:hover {
            background-color: #45a049;
        }
        .student-list button.delete {
            background-color: #f44336;
        }
        .pagination {
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            margin: 0 auto;
        }
        .pagination button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            margin: 5px;
            border-radius: 3px;
            cursor: pointer;
        }
        .pagination button:hover {
            background-color: #45a049;
        }
        .pagination .page-info {
            margin: 0 10px;
            font-weight: bold;
        }
    </style>
</head>
<body>
<h1>本班学生信息</h1>
<div class="search-container">
    <input type="text" id="search-input" placeholder="搜索学生姓名...">
</div>
<ul class="student-list">
    <!-- 表头 -->
    <li class="header">
        <span>姓名</span>
        <span>性别</span>
        <span>籍贯</span>
        <span>出生日期</span>
        <span>民族</span>
        <span>电话</span>
        <span>邮箱</span>
        <span>操作</span>
    </li>
    <!-- 学生信息 -->
    <c:forEach var="student" items="${students}" varStatus="status">
        <li class="student">
            <span class="name">${student.name}</span>
            <span>${student.gender}</span>
            <span>${student.origin}</span>
            <span>${student.birthDate}</span>
            <span>${student.ethnicity}</span>
            <span>${student.phone}</span>
            <span>${student.email}</span>
            <span>
                <form action="editStudent" method="post">
                    <input type="hidden" name="studentId" value="${student.id}">
                    <button type="submit">修改</button>
                </form>
                <form class="delete-form" action="deleteStudent" method="post">
                    <input type="hidden" name="studentId" value="${student.id}">
                    <button type="submit" class="delete">删除</button>
                </form>
            </span>
        </li>
    </c:forEach>
</ul>
<div class="pagination">
    <!-- 分页控件 -->
    <button class="prev-page">上一页</button>
    <span class="page-info">第 <span id="current-page"></span> 页，共 <span id="total-pages"></span> 页</span>
    <button class="next-page">下一页</button>
</div>
</body>
</html>
