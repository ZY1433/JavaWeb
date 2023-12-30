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
        <li class="footer-links-item"> <a href="#" class="footer-links-link">个人信息保护政策</a> </li>
        <li class="footer-links-item"> <a href="#" class="footer-links-link">儿童个人信息保护政策</a> </li>
        <li class="footer-links-item"> <a href="#" class="footer-links-link">使用许可及服务协议</a> </li>
        <li class="footer-links-item"> <a href="#" class="footer-links-link">应用权限</a> </li>
        <li class="footer-links-item"> <a href="#" class="footer-links-link">家长监护</a> </li>
        <li class="footer-links-item"> <a href="#" class="footer-links-link">联系我们</a> </li>
    </ul>
    <div class="footer-slot"></div>
    <ul class="footer-qualifications">
        <li class="footer-qualifications-item"> <a href="#" rel="noopener noreferrer"> 沪ICP备17022476号-1 </a> </li>
        <li class="footer-qualifications-item">沪网文〔2018〕0803-067号</li>
        <li class="footer-qualifications-item">ISBN 978-7-498-05646-7</li>
        <li class="footer-qualifications-item"> 国新出审〔2019〕49号 </li>
        <li class="footer-qualifications-item policy">
            <a class="footer-qualifications-item-policy"
               href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=31010402005145"
               target="_blank"
               rel="noopener noreferrer">
                <img class="footer-qualifications-item-icon"
                     src="https://web.hycdn.cn/hg_web_sdk/lib/assets/policy.2c053d4c81fc2b352043.png">
                沪公网安备 31010402005145号
            </a>
        </li>
        <li class="footer-qualifications-item anti-fraud">
            <div class="anti-fraud-container">
                <img
                    src="https://web.hycdn.cn/hg_web_sdk/lib/assets/anti-fraud.b04767f0bd0747af1db9.jpg"
                    class="footer-qualifications-item-icon">
                <span class="anti-fraud-text">
                    亲爱的市民朋友，上海警方反诈劝阻电话“962110”系专门针对避免您财产被骗受损而设，请您一旦收到来电，立即接听。
                </span>
            </div>
        </li>
    </ul>
    <div class="footer-claim">
        <p class="footer-claim-info">
            <span>开发者：<span class="footer-claim-info developer">上海鹰角网络科技有限公司</span></span>
            <br>
            <span>游戏当前版本：<span class="footer-claim-info version">2.1.41</span></span>&nbsp;
            <span>游戏更新时间：<span class="footer-claim-info update">2023/12/05</span></span>
        </p>
        <p class="footer-claim-text"> <span>本网络游戏适合年满12周岁以上的用户使用；</span>
            <span>为了您的健康，请合理控制游戏时间。</span>
        </p>
        <p class="footer-claim-text"> <span>抵制不良游戏 拒绝盗版游戏 注意自我保护 谨防受骗上当</span>
            <span>适度游戏益脑 沉迷游戏伤身 合理安排时间 享受健康生活</span>
        </p>
    </div>
    <div class="footer-copyright">
        <span>Copyright ©2017 - 2023 上海鹰角网络科技有限公司</span>
        <span>上海市嘉定区南翔镇银翔路799号昌辉大厦504-1室</span>
        <span>电话：021-64399377</span>
    </div>
    <div class="footer-logo">
        <img class="footer-company-logo"
             src="https://web.hycdn.cn/hg_web_sdk/lib/assets/copyright.4c7484258fbab8b551aa.png">
        <img class="footer-age-logo"
             src="https://web.hycdn.cn/hg_web_sdk/lib/assets/age-tip.5e9b351af134c60314ab.png">
    </div>
</div>
</body>
<script type="text/javascript" src="./js/main.js"></script>
</html>

