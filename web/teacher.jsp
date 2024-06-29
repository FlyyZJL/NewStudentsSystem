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
    <a href="login.jsp">退出系统</a>

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
    // 显示指定的section
    function showSection(sectionId) {
        $('.section').hide(); // 隐藏所有section
        $('#' + sectionId).show(); // 显示指定的section

        // 根据sectionId加载相应的学生列表
        if (sectionId === 'viewClassStudents') {
            loadClassStudents();
        } else if (sectionId === 'reviewStudents') {
            loadPendingStudents();
        }
    }

    // 加载班级学生列表
    function loadClassStudents() {
        $.ajax({
            url: 'viewClassStudents', // 请求的URL
            method: 'GET', // 请求方法
            success: function(response) {
                $('#viewClassStudents').html(response); // 将响应的HTML插入到页面中
                initClassStudentList(); // 初始化学生列表功能
            }
        });
    }

    // 加载待审核学生列表
    function loadPendingStudents() {
        $.ajax({
            url: 'viewPendingStudents', // 请求的URL
            method: 'GET', // 请求方法
            success: function(response) {
                $('#reviewStudents').html(response); // 将响应的HTML插入到页面中
                initReviewStudentList(); // 初始化审核列表功能
            }
        });
    }

    // 初始化班级学生列表功能
    function initClassStudentList() {
        const studentsPerPage = 10; // 每页显示的学生数量
        let currentPage = 1; // 当前页码
        const $students = $('#viewClassStudents .student'); // 获取所有学生元素
        const totalPages = Math.ceil($students.length / studentsPerPage); // 计算总页数

        // 显示指定页码的学生
        function showPage(page) {
            $students.hide().slice((page - 1) * studentsPerPage, page * studentsPerPage).show(); // 隐藏所有学生并显示当前页的学生
            $('#viewClassStudents #current-page').text(page); // 更新当前页码显示
            $('#viewClassStudents #total-pages').text(totalPages); // 更新总页数显示
        }

        // 显示下一页
        function nextPage() {
            if (currentPage < totalPages) {
                currentPage++;
                showPage(currentPage);
            }
        }

        // 显示上一页
        function prevPage() {
            if (currentPage > 1) {
                currentPage--;
                showPage(currentPage);
            }
        }

        // 绑定分页按钮的点击事件
        $('#viewClassStudents .next-page').on('click', nextPage);
        $('#viewClassStudents .prev-page').on('click', prevPage);

        // 搜索功能
        $('#viewClassStudents #search-input').on('input', function() {
            const filter = $(this).val().toLowerCase(); // 获取搜索输入并转换为小写
            $students.each(function() {
                const name = $(this).find('.name').text().toLowerCase(); // 获取学生姓名并转换为小写
                $(this).toggle(name.includes(filter)); // 根据搜索条件显示或隐藏学生
            });
        });

        // 删除学生功能
        $('#viewClassStudents .delete-form').on('submit', function(event) {
            event.preventDefault(); // 阻止表单默认提交行为
            if (confirm('确定要删除这个学生吗？')) { // 确认删除
                const $form = $(this);
                $.ajax({
                    url: $form.attr('action'), // 获取表单的提交URL
                    method: 'POST', // 请求方法
                    data: $form.serialize(), // 序列化表单数据
                    success: function() {
                        loadClassStudents(); // 重新加载学生列表
                    }
                });
            }
        });

        // 初始显示第一页
        showPage(currentPage);
    }

    // 初始化待审核学生列表功能
    function initReviewStudentList() {
        const studentsPerPage = 10; // 每页显示的学生数量
        let currentPage = 1; // 当前页码
        const $students = $('#reviewStudents .student'); // 获取所有学生元素
        const totalPages = Math.ceil($students.length / studentsPerPage); // 计算总页数

        // 显示指定页码的学生
        function showPage(page) {
            $students.hide().slice((page - 1) * studentsPerPage, page * studentsPerPage).show(); // 隐藏所有学生并显示当前页的学生
            $('#reviewStudents #current-page').text(page); // 更新当前页码显示
            $('#reviewStudents #total-pages').text(totalPages); // 更新总页数显示
            updatePaginationButtons(); // 更新分页按钮状态
        }

        // 显示下一页
        function nextPage() {
            if (currentPage < totalPages) {
                currentPage++;
                showPage(currentPage);
            }
        }

        // 显示上一页
        function prevPage() {
            if (currentPage > 1) {
                currentPage--;
                showPage(currentPage);
            }
        }

        // 更新分页按钮状态
        function updatePaginationButtons() {
            $('#reviewStudents .prev-page').toggleClass('disabled', currentPage === 1); // 如果是第一页禁用“上一页”按钮
            $('#reviewStudents .next-page').toggleClass('disabled', currentPage === totalPages); // 如果是最后一页禁用“下一页”按钮
        }

        // 绑定分页按钮的点击事件
        $('#reviewStudents .next-page').on('click', nextPage);
        $('#reviewStudents .prev-page').on('click', prevPage);

        // 搜索功能
        $('#reviewStudents #search-input').on('input', function() {
            const filter = $(this).val().toLowerCase(); // 获取搜索输入并转换为小写
            $students.each(function() {
                const name = $(this).find('.name').text().toLowerCase(); // 获取学生姓名并转换为小写
                $(this).toggle(name.includes(filter)); // 根据搜索条件显示或隐藏学生
            });
        });

        // 通过学生审核功能
        $('#reviewStudents .approve-form').on('submit', function(event) {
            event.preventDefault(); // 阻止表单默认提交行为
            const $form = $(this);
            const studentName = $form.find('input[name="studentName"]').val(); // 获取学生姓名
            $.ajax({
                url: $form.attr('action'), // 获取表单的提交URL
                method: 'POST', // 请求方法
                data: $form.serialize(), // 序列化表单数据
                success: function() {
                    loadPendingStudents(); // 重新加载待审核学生列表
                    alert('学生 ' + studentName + ' 已通过审核'); // 提示审核通过
                },
                error: function() {
                    alert('出现错误，请重试'); // 提示错误
                }
            });
        });

        // 拒绝学生审核功能
        $('#reviewStudents .reject-form').on('submit', function(event) {
            event.preventDefault(); // 阻止表单默认提交行为
            const $form = $(this);
            const studentName = $form.find('input[name="studentName"]').val(); // 获取学生姓名
            $.ajax({
                url: $form.attr('action'), // 获取表单的提交URL
                method: 'POST', // 请求方法
                data: $form.serialize(), // 序列化表单数据
                success: function() {
                    loadPendingStudents(); // 重新加载待审核学生列表
                    alert('学生 ' + studentName + ' 已成功打回'); // 提示审核拒绝
                },
                error: function() {
                    alert('出现错误，请重试'); // 提示错误
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
