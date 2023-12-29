<%--
  Created by IntelliJ IDEA.
  User: ZHANGYANG
  Date: 2023-12-28
  Time: 11:25
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
    <meta name="Keywords" content="粒子特效" />
    <title>张扬的JavaWeb主页</title>
    <link rel="shortcut icon" href="./img/icon.png" type="image/x-icon" />
    <link href="./css/main.css" rel="stylesheet" />
</head>
<body>
<div id="background">
    <canvas id="canvas">111</canvas>
</div>

<div class="content" >
    <div class="top">
        <div class="top_left">
            <ol class="news_switch">
                <span>·</span>
                <li><a>公告</a></li>
                <span>·</span>
                <li><a>活动</a></li>
                <span>·</span>
                <li><a>新闻</a></li>
                <span>·</span>
            </ol>
        </div>
        <div class="top_right">
            <c:if test="${sessionScope.loginUser==null}" >
                <div class="login_register">
                    <a class="login" href="/loginForm">登录</a>
                    <span>|</span>
                    <a class="register" href="/registerForm">注册</a>
                </div>
            </c:if>
            <c:if test="${sessionScope.loginUser!=null}" >
                <div class="login_register">
                    <a class="login">你好${sessionScope.loginUser.username}</a>
                    <span>|</span>
                    <a class="login" href="/loginForm">点击这里切换登录</a>
                </div>
            </c:if>
        </div>

    </div>
    <div class="body">
        <div class="Chart">
            轮播图
        </div>

        <div class="news">
            新闻
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src=".././js/main.js"></script>
</html>

