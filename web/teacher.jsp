<%--
  Created by IntelliJ IDEA.
  User: 枫翎月影
  Date: 2024/6/3
  Time: 18:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>教师主页</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .sidebar {
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #343a40;
            color: white;
            width: 250px;
            padding-top: 20px;
        }
        .sidebar a {
            color: white;
            padding: 15px;
            text-decoration: none;
            display: block;
        }
        .sidebar a:hover {
            background-color: #575d63;
        }
        .content {
            margin-left: 250px;
            padding: 20px;
        }
        .header {
            padding: 15px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="sidebar">
    <div class="header">
        <p>欢迎，${user.username}老师！</p>
    </div>
    <a href="#" onclick="showSection('viewClassStudents')">查看班级学生</a>
    <%--<a href="#" onclick="showSection('addStudent')">添加学生</a>--%>
    <%--<a href="#" onclick="showSection('modifyStudentInfo')">修改学生信息</a>--%>

    <%--<a href="#" onclick="showSection('submitPersonalInfo')">提交个人信息</a>--%>
    <a href="#" onclick="showSection('reviewStudents')">审核学生信息</a> <!-- 新增审核学生信息链接 -->
    <a href="#" onclick="showSection('changePassword')">修改密码</a>
</div>

<div class="content">
    <div id="viewClassStudents" class="section">
        <!-- 通过 AJAX 动态加载学生信息 -->
    </div>
    <%--<div id="addStudent" class="section" style="display:none;">--%>
        <%--<%@ include file="addStudent.jsp" %>--%>
    <%--</div>--%>
    <%--<div id="modifyStudentInfo" class="section" style="display:none;">--%>
        <%--<%@ include file="modifyStudentInfo.jsp" %>--%>
    <%--</div>--%>
    <div id="changePassword" class="section" style="display:none;">
        <%@ include file="changePassword.jsp" %>
    </div>
    <%--<div id="submitPersonalInfo" class="section" style="display:none;">--%>
        <%--<%@ include file="submitPersonalInfo.jsp" %>--%>
    <%--</div>--%>
    <div id="reviewStudents" class="section" style="display:none;">
        <!-- 通过 AJAX 动态加载待审核学生信息 -->
    </div>
</div>

<script src="jquery-3.3.1.min.js"></script>
<script>
    function showSection(sectionId) {
        $('.section').hide();
        $('#' + sectionId).show();

        if (sectionId === 'viewClassStudents') {
            loadClassStudents();
        } else if (sectionId === 'reviewStudents') {
            loadPendingStudents();
        }
    }

    function loadClassStudents() {
        $.ajax({
            url: 'viewClassStudents',
            method: 'GET',
            success: function(response) {
                $('#viewClassStudents').html(response);
                initClassStudentList(); // 初始化学生列表功能
            }
        });
    }

    function loadPendingStudents() {
        $.ajax({
            url: 'viewPendingStudents',
            method: 'GET',
            success: function(response) {
                $('#reviewStudents').html(response);
                initReviewStudentList(); // 初始化审核列表功能
            }
        });
    }

    function initClassStudentList() {
        const studentsPerPage = 10;
        let currentPage = 1;
        const $students = $('#viewClassStudents .student');
        const totalPages = Math.ceil($students.length / studentsPerPage);

        function showPage(page) {
            $students.hide().slice((page - 1) * studentsPerPage, page * studentsPerPage).show();
            $('#viewClassStudents #current-page').text(page);
            $('#viewClassStudents #total-pages').text(totalPages);
        }

        function nextPage() {
            if (currentPage < totalPages) {
                currentPage++;
                showPage(currentPage);
            }
        }

        function prevPage() {
            if (currentPage > 1) {
                currentPage--;
                showPage(currentPage);
            }
        }

        $('#viewClassStudents .next-page').on('click', nextPage);
        $('#viewClassStudents .prev-page').on('click', prevPage);

        $('#viewClassStudents #search-input').on('input', function() {
            const filter = $(this).val().toLowerCase();
            $students.each(function() {
                const name = $(this).find('.name').text().toLowerCase();
                $(this).toggle(name.includes(filter));
            });
        });

        $('#viewClassStudents .delete-form').on('submit', function(event) {
            event.preventDefault();
            if (confirm('确定要删除这个学生吗？')) {
                const $form = $(this);
                $.ajax({
                    url: $form.attr('action'),
                    method: 'POST',
                    data: $form.serialize(),
                    success: function() {
                        loadClassStudents(); // 重新加载学生列表
                    }
                });
            }
        });

        // 初始显示第一页
        showPage(currentPage);
    }

    function initReviewStudentList() {
        const studentsPerPage = 10;
        let currentPage = 1;
        const $students = $('#reviewStudents .student');
        const totalPages = Math.ceil($students.length / studentsPerPage);

        function showPage(page) {
            $students.hide().slice((page - 1) * studentsPerPage, page * studentsPerPage).show();
            $('#reviewStudents #current-page').text(page);
            $('#reviewStudents #total-pages').text(totalPages);
            updatePaginationButtons();
        }

        function nextPage() {
            if (currentPage < totalPages) {
                currentPage++;
                showPage(currentPage);
            }
        }

        function prevPage() {
            if (currentPage > 1) {
                currentPage--;
                showPage(currentPage);
            }
        }

        function updatePaginationButtons() {
            $('#reviewStudents .prev-page').toggleClass('disabled', currentPage === 1);
            $('#reviewStudents .next-page').toggleClass('disabled', currentPage === totalPages);
        }

        $('#reviewStudents .next-page').on('click', nextPage);
        $('#reviewStudents .prev-page').on('click', prevPage);

        $('#reviewStudents #search-input').on('input', function() {
            const filter = $(this).val().toLowerCase();
            $students.each(function() {
                const name = $(this).find('.name').text().toLowerCase();
                $(this).toggle(name.includes(filter));
            });
        });

        $('#reviewStudents .approve-form').on('submit', function(event) {
            event.preventDefault();
            const $form = $(this);
            $.ajax({
                url: $form.attr('action'),
                method: 'POST',
                data: $form.serialize(),
                success: function() {
                    loadPendingStudents(); // 重新加载待审核学生列表
                }
            });
        });

        $('#reviewStudents .reject-form').on('submit', function(event) {
            event.preventDefault();
            const $form = $(this);
            $.ajax({
                url: $form.attr('action'),
                method: 'POST',
                data: $form.serialize(),
                success: function() {
                    loadPendingStudents(); // 重新加载待审核学生列表
                }
            });
        });

        // 初始显示第一页
        showPage(currentPage);
    }

    // 初始加载班级学生信息
    $(document).ready(function() {
        loadClassStudents();
    });
</script>
</body>
</html>
