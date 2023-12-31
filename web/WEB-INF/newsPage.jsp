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
    <link href="./css/main.css" rel="stylesheet" />
</head>
<body>
<div class="top">
    <div class="top_left">
        <canvas id="slogan"></canvas>
        <ol class="news_switch">
            <%--                <span>·</span>--%>
            <%--                <li><a>公告</a></li>--%>
            <%--                <span>·</span>--%>
            <%--                <li><a>活动</a></li>--%>
            <%--                <span>·</span>--%>
                <li style="position: fixed;left: 30px;top: 20px"><a href="main"><回到主页</a></li>
            <li>欢迎游玩明日方舟</li>
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
<div class="newsPageContent" style="position: relative;margin: auto;">
    <h1 class="newsPageTitle">新闻详情中心</h1>
    <div class="news" style="position: relative; top: 80px; left: 20%">

        <ul>
            <c:forEach items="${sessionScope.newsList}" var="news">
                <li class="newsList">
                    <a href="newsPage">
                        <span class="newsDate">${news.publishTime}</span>
                        <span class="newsFlag">新闻</span>
                        <h1 class="newsContent">${news.content}</h1>
                    </a>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>

<div class="footer-wrapper" style="position: fixed;bottom: 0;width: 100%">
    <ul class="footer-links">
        <li class="footer-links-item">个人信息保护政策 </li>
        <li class="footer-links-item">儿童个人信息保护政策 </li>
        <li class="footer-links-item">使用许可及服务协议</li>
        <li class="footer-links-item">应用权限</li>
        <li class="footer-links-item">家长监护</li>
        <li class="footer-links-item">联系我们</li>
    </ul>
    <div class="footer-slot"></div>
    <ul class="footer-qualifications">
        <li class="footer-qualifications-item">沪ICP备17022476号-1</li>
        <li class="footer-qualifications-item">沪网文〔2018〕0803-067号</li>
        <li class="footer-qualifications-item">ISBN 978-7-498-05646-7</li>
        <li class="footer-qualifications-item"> 国新出审〔2019〕49号 </li>
    </ul>
    <div class="footer-copyright">
        <span>Copyright ©2017 - 2023 上海鹰角网络科技有限公司</span>
        <span>上海市嘉定区南翔镇银翔路799号昌辉大厦504-1室</span>
        <span>电话：021-64399377</span>
    </div>
</div>
</body>
</html>
