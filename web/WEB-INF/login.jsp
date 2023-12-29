<%--
  Created by IntelliJ IDEA.
  User: ZHANGYANG
  Date: 2023-12-28
  Time: 11:34
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
    <title>登录页面</title>
    <link rel="shortcut icon" href="./img/icon.png" type="image/x-icon" />
    <link href="./css/login.css" rel="stylesheet" />
</head>
<body>
<div class="loginBox">
    <h2>欢迎登录</h2>
    <form action="login" method="post">
        <div class="item">
            <input type="text" required name="username" id="user">
            <label for="user">用户名</label>
        </div>
        <div class="item">
            <input type="password" required name="password" id="pwd">
            <label for="pwd">密码</label>
        </div>
        <c:if test="${requestScope.loginMsg != null}" >
            <p class = "msg">${requestScope.loginMsg}</p>
        </c:if>
        <button class="btn" type="submit">登录
            <span></span>
            <span></span>
            <span></span>
            <span></span>
        </button>
        <a class="register" href="/registerForm">没有账号？请注册</a>
    </form>
</div>
</body>
</html>
