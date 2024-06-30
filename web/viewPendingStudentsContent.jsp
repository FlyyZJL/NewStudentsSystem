<%--
  Created by IntelliJ IDEA.
  User: 枫翎月影
  Date: 2024/6/27
  Time: 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>审核学生信息</title>
    <link rel="stylesheet" href="bootstrap.min.css">
    <style>
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
        .search{
            display: flex;
            justify-content: flex-end; /* 对齐到右边 */
            margin-right: 100px;
            margin-bottom: 0;
        }
        #search-input{
            width: 300px;
            height: 50px;
            padding: 10px;
            margin-bottom: 0;
        }
        .student-list button:hover {
            background-color: #45a049;
        }
        .student-list button.reject {
            background-color: #f44336;
        }
        .pagination {
            display: flex;
            justify-content: center;
            margin: 20px 0;
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
        .pagination .disabled {
            background-color: #ccc;
            cursor: not-allowed;
        }
    </style>
</head>
<body>
<h1>审核学生信息</h1>
<div class="search">
    <input type="text" id="search-input" placeholder="搜索学生姓名..." class="form-control">
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
    <!-- 待审核学生信息 -->
    <c:forEach var="students" items="${students2}" varStatus="status">
        <li class="student">
            <span class="name">${students.name}</span>
            <span>${students.gender}</span>
            <span>${students.origin}</span>
            <span>${students.birthDate}</span>
            <span>${students.ethnicity}</span>
            <span>${students.phone}</span>
            <span>${students.email}</span>
            <span>
                <form action="reviewStudentInfo" method="post" class="approve-form">
                    <input type="hidden" name="studentId" value="${students.id}">
                    <input type="hidden" name="studentName" value="${students.name}">
                    <input type="hidden" name="action" value="approve">
                    <button type="submit">通过</button>
                </form>
                <form action="reviewStudentInfo" method="post" class="reject-form">
                    <input type="hidden" name="studentId" value="${students.id}">
                    <input type="hidden" name="studentName" value="${students.name}">
                    <input type="hidden" name="action" value="reject">
                    <button type="submit" class="reject">打回</button>
                </form>
            </span>
        </li>
    </c:forEach>
</ul>

<div class="pagination">
    <button class="prev-page">上一页</button>
    <span>当前页: <span id="current-page">1</span> / <span id="total-pages">1</span></span>
    <button class="next-page">下一页</button>
</div>

<%--<script>--%>
    <%--function initReviewList() {--%>
        <%--const studentsPerPage = 10;--%>
        <%--let currentPage = 1;--%>
        <%--const $students = $('.student');--%>
        <%--const totalPages = Math.ceil($students.length / studentsPerPage);--%>

        <%--function showPage(page) {--%>
            <%--$students.hide().slice((page - 1) * studentsPerPage, page * studentsPerPage).show();--%>
            <%--$('#current-page').text(page);--%>
            <%--$('#total-pages').text(totalPages);--%>
            <%--updatePaginationButtons();--%>
        <%--}--%>

        <%--function nextPage() {--%>
            <%--if (currentPage < totalPages) {--%>
                <%--currentPage++;--%>
                <%--showPage(currentPage);--%>
            <%--}--%>
        <%--}--%>

        <%--function prevPage() {--%>
            <%--if (currentPage > 1) {--%>
                <%--currentPage--;--%>
                <%--showPage(currentPage);--%>
            <%--}--%>
        <%--}--%>

        <%--function updatePaginationButtons() {--%>
            <%--$('.prev-page').toggleClass('disabled', currentPage === 1);--%>
            <%--$('.next-page').toggleClass('disabled', currentPage === totalPages);--%>
        <%--}--%>

        <%--$('.next-page').on('click', nextPage);--%>
        <%--$('.prev-page').on('click', prevPage);--%>

        <%--$('#search-input').on('input', function() {--%>
            <%--const filter = $(this).val().toLowerCase();--%>
            <%--$students.each(function() {--%>
                <%--const name = $(this).find('.name').text().toLowerCase();--%>
                <%--$(this).toggle(name.includes(filter));--%>
            <%--});--%>
        <%--});--%>

        <%--$('.approve-form').on('submit', function(event) {--%>
            <%--event.preventDefault();--%>
            <%--const $form = $(this);--%>
            <%--$.ajax({--%>
                <%--url: $form.attr('action'),--%>
                <%--method: 'POST',--%>
                <%--data: $form.serialize(),--%>
                <%--success: function() {--%>
                    <%--loadPendingStudents(); // 重新加载待审核学生列表--%>
                <%--}--%>
            <%--});--%>
        <%--});--%>

        <%--$('.reject-form').on('submit', function(event) {--%>
            <%--event.preventDefault();--%>
            <%--const $form = $(this);--%>
            <%--$.ajax({--%>
                <%--url: $form.attr('action'),--%>
                <%--method: 'POST',--%>
                <%--data: $form.serialize(),--%>
                <%--success: function() {--%>
                    <%--loadPendingStudents(); // 重新加载待审核学生列表--%>
                <%--}--%>
            <%--});--%>
        <%--});--%>

        <%--// 初始显示第一页--%>
        <%--showPage(currentPage);--%>
    <%--}--%>

    <%--$(document).ready(function() {--%>
        <%--initReviewList();--%>
    <%--});--%>
<%--</script>--%>
</body>
</html>

