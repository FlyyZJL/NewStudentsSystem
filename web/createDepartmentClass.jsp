<%--
  Created by IntelliJ IDEA.
  User: 枫翎月影
  Date: 2024/6/3
  Time: 18:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>创建院系班级</title>
    <link href="bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: auto;
            background: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            text-align: center;
            margin-bottom: 30px;
        }
        form {
            margin-top: 20px;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            margin-bottom: 15px;
        }
        label {
            display: inline-block;
            width: 120px;
            font-weight: bold;
        }
        input[type="text"] {
            width: calc(100% - 130px);
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }
        button[type="submit"] {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
        }
        button[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>创建院系班级</h1>
    <form action="createDepartmentClass" method="post">
        <ul>
            <li>
                <label for="departmentId">院系ID：</label>
                <input type="text" id="departmentId" name="departmentId" required>
            </li>
            <li>
                <label for="classId">班级ID：</label>
                <input type="text" id="classId" name="classId" required>
            </li>
            <li>
                <label for="departmentName">院系名称：</label>
                <input type="text" id="departmentName" name="departmentName" required>
            </li>
            <li>
                <label for="className">班级名称：</label>
                <input type="text" id="className" name="className" required>
            </li>
        </ul>
        <button type="submit">提交</button>
    </form>
</div>
</body>
</html>


