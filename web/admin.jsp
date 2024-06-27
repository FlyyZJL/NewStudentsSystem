<%--
  Created by IntelliJ IDEA.
  User: 枫翎月影
  Date: 2024/6/3
  Time: 18:29
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>管理员界面</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
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
        .content {
            margin-left: 250px; /* 与侧边栏宽度保持一致 */
            padding: 20px;
        }
        ul.sidebar-menu {
            list-style-type: none;
            padding-left: 0;
        }
        ul.sidebar-menu li {
            margin-bottom: 10px;
        }
        ul.sidebar-menu li a {
            color: white;
            padding: 15px;
            text-decoration: none;
            display: block;
        }
        ul.sidebar-menu li a:hover {
            color: #007bff;
        }
        iframe {
            border: none;
            width: 100%;
            height: 100%;
        }
    </style>
    <script src="jquery-3.3.1.min.js"></script>
    <script>
        $(document).ready(function() {
            // 处理侧边栏链接点击事件
            $('ul.sidebar-menu li a').on('click', function(event) {
                event.preventDefault();
                var url = $(this).attr('href'); // 获取链接的 href 属性值
                $('#iframeContent').attr('src', url); // 更新 iframe 的 src 属性加载页面内容
            });

            // 默认加载第一个链接的内容
            $('ul.sidebar-menu li a:first').trigger('click');
        });
    </script>
</head>
<body style="background-color: #f8f9fa;">
<div class="container-fluid">
    <div class="row">
        <!-- 左侧侧边栏 -->
        <div class="col-md-3 sidebar">
            <h1>管理员界面</h1>
            <p>欢迎您，${user.username}！</p>
            <ul class="sidebar-menu">
                <li><a href="createUser.jsp">添加用户</a></li>
                <li><a href="createDepartmentClass.jsp">创建班级院系</a></li>
                <li><a href="assignTeacherClass.jsp">分配班级和老师的关系</a></li>
            </ul>
        </div>
        <!-- 右侧内容区域 -->
        <div class="col-md-9 content" style="background-color: #f8f9fa; height: 100vh; width: 100vw;">
            <iframe id="iframeContent" src="" frameborder="0"></iframe>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
