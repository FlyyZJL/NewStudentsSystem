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
    <a href="#" onclick="showSection('addStudent')">添加学生</a>
    <a href="#" onclick="showSection('modifyStudentInfo')">修改学生信息</a>
    <a href="#" onclick="showSection('changePassword')">修改密码</a>
    <a href="#" onclick="showSection('submitPersonalInfo')">提交个人信息</a>
</div>

<div class="content">
    <div id="viewClassStudents" class="section">
        <!-- 通过 AJAX 动态加载学生信息 -->
    </div>
    <div id="addStudent" class="section" style="display:none;">
        <%@ include file="addStudent.jsp" %>
    </div>
    <div id="modifyStudentInfo" class="section" style="display:none;">
        <%@ include file="modifyStudentInfo.jsp" %>
    </div>
    <div id="changePassword" class="section" style="display:none;">
        <%@ include file="changePassword.jsp" %>
    </div>
    <div id="submitPersonalInfo" class="section" style="display:none;">
        <%@ include file="submitPersonalInfo.jsp" %>
    </div>
</div>

<script>
    function showSection(sectionId) {
        const sections = document.querySelectorAll('.section');
        sections.forEach(section => {
            section.style.display = section.id === sectionId ? 'block' : 'none';
        });

        if (sectionId === 'viewClassStudents') {
            loadClassStudents();
        }
    }

    function loadClassStudents() {
        const xhr = new XMLHttpRequest();
        xhr.open('GET', 'viewClassStudents', true);
        xhr.onload = function() {
            if (xhr.status === 200) {
                document.getElementById('viewClassStudents').innerHTML = xhr.responseText;
                initStudentList(); // 初始化学生列表功能
            }
        };
        xhr.send();
    }

    function initStudentList() {
        const studentsPerPage = 10;
        let currentPage = 1;
        const students = document.querySelectorAll('.student');
        const totalPages = Math.ceil(students.length / studentsPerPage);

        function showPage(page) {
            students.forEach((student, index) => {
                student.style.display = (index >= (page - 1) * studentsPerPage && index < page * studentsPerPage) ? 'flex' : 'none';
            });
            document.getElementById('current-page').textContent = page;
            document.getElementById('total-pages').textContent = totalPages;
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

        document.querySelector('.next-page').addEventListener('click', nextPage);
        document.querySelector('.prev-page').addEventListener('click', prevPage);

        document.getElementById('search-input').addEventListener('input', function() {
            const filter = this.value.toLowerCase();
            students.forEach(student => {
                const name = student.querySelector('.name').textContent.toLowerCase();
                if (name.includes(filter)) {
                    student.style.display = 'flex';
                } else {
                    student.style.display = 'none';
                }
            });
        });

        document.querySelectorAll('.delete-form').forEach(form => {
            form.addEventListener('submit', function(event) {
                if (!confirm('确定要删除这个学生吗？')) {
                    event.preventDefault();
                } else {
                    // 使用 AJAX 提交表单，防止页面跳转
                    event.preventDefault();
                    const xhr = new XMLHttpRequest();
                    xhr.open('POST', form.action, true);
                    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                    xhr.onload = function() {
                        if (xhr.status === 200) {
                            // 重新加载学生列表
                            loadClassStudents();
                        }
                    };
                    const formData = new FormData(form);
                    const params = new URLSearchParams(formData).toString();
                    xhr.send(params);
                }
            });
        });

        // 初始显示第一页
        showPage(currentPage);
    }

    // 初始加载班级学生信息
    loadClassStudents();
</script>
</body>
</html>
