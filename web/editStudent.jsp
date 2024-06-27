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
</head>
<body>
<h1>修改学生信息</h1>
<form id="updateForm" action="updateStudent" method="post">
    <input type="hidden" name="studentId" value="${student.id}">
    <label for="name">姓名：</label>
    <input type="text" id="name" name="name" value="${student.name}" required><br>
    <label for="gender">性别：</label>
    <input type="text" id="gender" name="gender" value="${student.gender}" required><br>
    <label for="origin">籍贯：</label>
    <input type="text" id="origin" name="origin" value="${student.origin}" required><br>
    <label for="birthDate">出生日期：</label>
    <input type="date" id="birthDate" name="birthDate" value="${student.birthDate}" required><br>
    <label for="ethnicity">民族：</label>
    <input type="text" id="ethnicity" name="ethnicity" value="${student.ethnicity}"><br>
    <label for="phone">电话：</label>
    <input type="text" id="phone" name="phone" value="${student.phone}"><br>
    <label for="email">邮箱：</label>
    <input type="email" id="email" name="email" value="${student.email}"><br>
    <label for="classId">班级：</label>
    <input type="text" id="classId" name="classId" value="${student.classId}"><br>
    <button type="submit">保存</button>
</form>
<script src="jquery-3.3.1.min.js"></script>
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
