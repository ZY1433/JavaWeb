<%--
  Created by IntelliJ IDEA.
  User: ZHANGYANG
  Date: 2023-12-31
  Time: 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>新闻详情</title>
    <link rel="shortcut icon" href="./img/icon.png" type="image/x-icon" />
    <link href="./css/newsPage.css" rel="stylesheet" />
</head>
<body>
<div id="background">
    <canvas id="canvas" width="300px" height="140px">111</canvas>
</div>
<div class="top">
    <div class="top_left">
        <canvas id="slogan"></canvas>
        <ol class="news_switch">
            <li><a href="main">主页</a></li>
            <span>·</span>
            <li>欢迎游玩明日方舟</li>
            <span>·</span>
            <li><a href="newsPage">新闻</a></li>
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
<div class="newsPageContent" >
    <h1 class="newsPageTitle">新闻详情中心</h1>
    <div class="news">
        <c:forEach items="${sessionScope.newsList}" var="news">
            <li class="newsList">
                <a >
                    <span class="newsDate">${news.publishTime}</span>
                    <span class="newsFlag">新闻</span>
                    <h1 class="newsTitle">${news.title}</h1>
                </a>
                <p class="newsContent">${news.content}</p>
            </li>
        </c:forEach>
    </div>
</div>

<div class="footer-wrapper" style="position: fixed;bottom: 0;width: 100%">
    <ul class="footer-links">
        <li class="footer-links-item">个人信息保护政策 </li>
        <li class="footer-links-item">使用许可及服务协议</li>
        <li class="footer-links-item">联系我们</li>
    </ul>
    <div class="footer-slot"></div>
    <ul class="footer-qualifications">
        <li class="footer-qualifications-item">豫ICP备05002484号-1</li>
    </ul>
    <div class="footer-copyright">
        <span>Copyright ©1902 - 2023 河南农业大学信管学院 &nbsp;</span>
        <span>中国·河南· 郑州市郑东新区平安大道218号</span>
    </div>
</div>
<canvas width="0" height="0" id="Logo"></canvas>
<script type="text/javascript" src="./js/main.js"></script>
</body>
</html>
