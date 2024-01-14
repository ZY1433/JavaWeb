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
    <title>用户管理页面</title>
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
        .post {
            position: fixed;
            background: #ffffff;
            border: 1px #cccccc solid;
            width: 600px;
            left: calc((100vw - 600px) / 2);
            top: 10vw;
            padding: 10px;
            font-size: 14px;
            z-index: 999999;
            display: none;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            flex-direction: column;
            align-items: center;
        }

        .post .message {
            width: 450px;
            height: 30px;
            line-height: 30px;
            display: block;
            border: 1px #cecece solid;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

<header>
    <h1>用户管理系统</h1>
</header>

<main>
    <button onclick="add()">添加用户</button>
    <button onclick="edit()">编辑用户</button>
    <button>删除用户</button>
    <button>查找用户</button>
    <c:if test="${requestScope.adminMsg != null}">
        <p style="color: red">${requestScope.adminMsg}</p>
    </c:if>
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
        <c:forEach items="${sessionScope.userList}" var="users">
            <tr>
                <td>${users.userId}</td>
                <td>${users.username}</td>
                <td>${users.email}</td>
                <td>${users.password}</td>
                <td>${users.admin ? "是" : "否"}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</main>
<div class="post">
    <h2>添加用户</h2>
    <form method="post" action="userMange">
        <input class="message" placeholder="请输入插入的用户名" name="username" type="text" required>
        <input class="message" placeholder="请输入插入的用户邮箱" name="email" type="text" required>
        <input class="message" placeholder="请输入插入的用户密码" name="password" type="text" required>
        <input style="display: none" value="add" name="type">
        <div style="display: flex;flex-direction: row;justify-content: center">
            <label for="isAdmin" style="line-height: 2.5">是否为管理员:</label>
            <input placeholder="是否为管理员" style="height: 30px;width: 30px" name="isAdmin" id="isAdmin" type="checkbox">
        </div>
        <div style="display: flex;flex-direction: row;justify-content: center">
            <button type="submit">提交</button>
            <button onclick="closing()" type="reset">关闭</button>
        </div>
    </form>
</div>
<div class="post">
    <h2>根据id编辑用户</h2>
    <form method="post" action="userMange">
        <input class="message" placeholder="请输入编辑的用户id" name="userId" type="number" required>
        <input class="message" placeholder="请输入更新后的用户名" name="username" type="text" required>
        <input class="message" placeholder="请输入更新后的用户邮箱" name="email" type="text" required>
        <input class="message" placeholder="请输入更新后的用户密码" name="password" type="text" required>
        <input style="display: none" value="edit" name="type">
        <div style="display: flex;flex-direction: row;justify-content: center">
            <label style="line-height: 2.5">是否为管理员:</label>
            <input placeholder="是否为管理员" style="height: 30px;width: 30px" name="isAdmin" type="checkbox">
        </div>
        <div style="display: flex;flex-direction: row;justify-content: center">
            <button type="submit">提交</button>
            <button onclick="closing()" type="reset">关闭</button>
        </div>
    </form>
</div>
</body>
<script>
    const postelement = document.getElementsByClassName("post");
    const title = document.getElementsByClassName("title")[0];
    const content = document.getElementsByClassName("content")[0];

    // 点击“添加用户”
    function add() {
        postelement[0].setAttribute("style", 'display:flex');
    }
    // 点击“编辑用户”
    function edit() {
        postelement[1].setAttribute("style", 'display:flex');
    }
    // 点击“关闭”
    function closing() {
        for (let i = 0; i < postelement.length; i++) {
            postelement[i].setAttribute("style", 'display:none');
        }
    }
</script>
</html>

