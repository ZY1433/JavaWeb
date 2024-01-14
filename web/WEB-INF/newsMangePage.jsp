<%--
  Created by IntelliJ IDEA.
  User: ZHANGYANG
  Date: 2024-01-12
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>新闻管理页面</title>
    <link rel="shortcut icon" href="./img/icon.png" type="image/x-icon" />
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        header {
            background-color: #2c3e50;
            color: white;
            padding: 1rem;
            text-align: center;
        }

        main {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        button {
            padding: 10px;
            margin: 5px;
            cursor: pointer;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 5px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #3498db;
            color: white;
        }

        tr:hover {
            background-color: #f5f5f5;
        }
    </style>
</head>
<body>

<header>
    <h1>新闻管理系统</h1>
</header>

<main>
    <button>添加用户</button>
    <button>编辑用户</button>
    <button>删除用户</button>
    <button>查找用户</button>

    <table>
        <thead>
        <tr>
            <th>User ID</th>
            <th>用户名</th>
            <th>Email</th>
            <th>Password</th>
            <th>管理员</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>1</td>
            <td>John Doe</td>
            <td>john.doe@example.com</td>
            <td>********</td>
            <td>是</td>
        </tr>
        <tr>
            <td>2</td>
            <td>Jane Doe</td>
            <td>jane.doe@example.com</td>
            <td>********</td>
            <td>否</td>
        </tr>
        </tbody>
    </table>
</main>

</body>
</html>

