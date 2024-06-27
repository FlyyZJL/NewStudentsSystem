<%--
  Created by IntelliJ IDEA.
  User: 枫翎月影
  Date: 2024/6/3
  Time: 18:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="jquery-3.3.1.min.js"></script>
    <script>
        $(document).ready(function() {
            // 页面加载时，从localStorage中读取用户名和密码，并填充到表单中
            // 当记住密码复选框被选中时才执行
            if (localStorage.getItem('rememberMe') === 'true') {
                $('#rememberMe').prop('checked', true); // 选中记住密码复选框
                $('#username').val(localStorage.getItem('username')); // 填充用户名
                $('#password').val(localStorage.getItem('password')); // 填充密码
            }

            // 当表单提交时，根据记住密码复选框的状态保存或移除用户名和密码
            $('form').submit(function() {
                if ($('#rememberMe').is(':checked')) {
                    localStorage.setItem('username', $('#username').val()); // 保存用户名到localStorage
                    localStorage.setItem('password', $('#password').val()); // 保存密码到localStorage
                    localStorage.setItem('rememberMe', true); // 保存记住密码状态
                } else {
                    localStorage.removeItem('username'); // 移除用户名
                    localStorage.removeItem('password'); // 移除密码
                    localStorage.setItem('rememberMe', false); // 更新记住密码状态
                }
            });

            // 检查URL参数中是否包含错误信息，如果有则显示提示框
            const urlParams = new URLSearchParams(window.location.search);
            if (urlParams.has('error')) {
                alert("用户名或密码错误，请重试。");
            }
        });
    </script>
</head>
<body class="bg-light">
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <!-- 使用Bootstrap卡片组件美化表单 -->
            <div class="card mt-5">
                <div class="card-header text-center">
                    <h1>登录</h1>
                </div>
                <div class="card-body">
                    <!-- 登录表单 -->
                    <form action="login" method="post">
                        <div class="form-group">
                            <label for="username">用户名：</label>
                            <input type="text" class="form-control" id="username" name="username" required>
                        </div>
                        <div class="form-group">
                            <label for="password">密码：</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        <div class="form-group form-check">
                            <input type="checkbox" class="form-check-input" id="rememberMe">
                            <label class="form-check-label" for="rememberMe">记住密码</label>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">登录</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

