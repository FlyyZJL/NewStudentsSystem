<%--
  Created by IntelliJ IDEA.
  User: 枫翎月影
  Date: 2024/6/26
  Time: 20:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>修改学生信息</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
        }
        .form-group {
            margin-bottom: 1rem;
        }
        label {
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="mb-4">修改学生信息</h1>
    <form id="updateForm" action="updateStudent" method="post">
        <input type="hidden" name="studentId" value="${student.id}">
        <div class="form-group">
            <label for="name">姓名：</label>
            <input type="text" class="form-control" id="name" name="name" value="${student.name}" required>
        </div>
        <div class="form-group">
            <label for="gender">性别：</label>
            <input type="text" class="form-control" id="gender" name="gender" value="${student.gender}" required>
        </div>
        <div class="form-group">
            <label for="origin">籍贯：</label>
            <input type="text" class="form-control" id="origin" name="origin" value="${student.origin}" required>
        </div>
        <div class="form-group">
            <label for="birthDate">出生日期：</label>
            <input type="date" class="form-control" id="birthDate" name="birthDate" value="${student.birthDate}" required>
        </div>
        <div class="form-group">
            <label for="ethnicity">民族：</label>
            <input type="text" class="form-control" id="ethnicity" name="ethnicity" value="${student.ethnicity}">
        </div>
        <div class="form-group">
            <label for="phone">电话：</label>
            <input type="text" class="form-control" id="phone" name="phone" value="${student.phone}">
        </div>
        <div class="form-group">
            <label for="email">邮箱：</label>
            <input type="email" class="form-control" id="email" name="email" value="${student.email}">
        </div>
        <div class="form-group">
            <label for="classId">班级：</label>
            <input type="text" class="form-control" id="classId" name="classId" value="${student.classId}">
        </div>
        <button type="submit" class="btn btn-primary">保存</button>
    </form>
</div>

<script src="jquery-3.3.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function() {
        $('#updateForm').on('submit', function(event) {
            event.preventDefault();
            const $form = $(this);
            const params = $form.serialize();

            $.ajax({
                type: 'POST',
                url: $form.attr('action'),
                data: params,
                success: function(response) {
                    alert('修改成功');
                    window.location.href = 'teacher.jsp';
                    loadClassStudents(); // 重新加载学生列表
                },
                error: function() {
                    alert('修改失败');
                }
            });
        });
    });

    function loadClassStudents() {
        // 你的重新加载学生列表的代码
        console.log('学生列表已加载');
    }
</script>

</body>
</html>
