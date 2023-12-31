<%--
  Created by IntelliJ IDEA.
  User: ZHANGYANG
  Date: 2023-12-28
  Time: 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
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
    <canvas id="canvas" width="300px" height="140px">111</canvas>
</div>

<div class="content" >
    <div class="top">
        <div class="top_left">
            <canvas id="slogan"></canvas>
            <ol class="news_switch">
                <span>·</span>
                <li><a href="#">公告</a></li>
                <span>·</span>
                <li><a href="#">活动</a></li>
                <span>·</span>
                <li><a href="#">新闻</a></li>
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
        <div class="body_left">
            <div class="wrap">
                <ul class="list">
                    <li class="item active"><img src="./img/1.jpg"></li>
                    <li class="item"><img src="./img/2.jpg"></li>
                    <li class="item"><img src="./img/3.jpg"></li>
                    <li class="item"><img src="./img/4.jpg"></li>
                    <li class="item"><img src="./img/5.jpg"></li>
                </ul>
                <ul class="pointList">
                    <li class="point active" data-index=0></li>
                    <li class="point" data-index=1></li>
                    <li class="point" data-index=2></li>
                    <li class="point" data-index=3></li>
                    <li class="point" data-index=4></li>
                </ul>
                <div class="btn" id="leftBtn">
                    <
                </div>
                <div class="btn" id="rightBtn">
                    >
                </div>
            </div>
            <div class="news">
                新闻
                <ul>
                    <c:forEach items="${sessionScope.newsList}" var="news">
                        <li class="newsList">
                            <a href="#">
                                <span class="newsDate">${news.publishTime}</span>
                                <span class="newsFlag">新闻</span>
                                <h1 class="newsContent">${news.title}</h1>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="body_right">
            <canvas id="Logo" width="500px" height="500px"></canvas>
        </div>
    </div>
</div>
<div class="footer-wrapper">
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
<script type="text/javascript" src="./js/main.js"></script>
</html>

