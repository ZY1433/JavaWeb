<%--
  Created by IntelliJ IDEA.
  User: ZHANGYANG
  Date: 2024-01-05
  Time: 12:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>管理员登录页面</title>
    <style>
        * {
            padding: 0;
            margin: 0;
        }
        .Login {
            width: 20em;
            height: 20em;
            position: relative;
            background-color: hsla(0, 0%, 100%, .8);
            border-radius: 1.2em;
            box-shadow: 0 2px 10px -5px rgba(9, 2, 4, .8);
            padding: 2em;
            box-sizing: border-box;
            margin: auto;
            margin-top: 10vw;

        }
        .title {
            text-align: center;
            margin-bottom: 1.5em;
            font-size: 1.5em;
            font-weight: 700;
            color: #158fc5;
        }
        .inputContext {
            position: relative;
            height: 54px;
        }
        .warningMsg {
            color: red;
            position: absolute;
            top: 32px;
            font-size: 0.8rem;
        }
        .input {
            display: block;
            width: 100%;
            box-sizing: border-box;
            border: none;
            border-bottom: 1px solid #e0e0e0;
            padding: .5em .2em;
            color: #313131;
            font-size: 1em;
            line-height: 1em;
            line-height: normal;
            height: 1em;
            box-sizing: content-box;
            background: none;
        }
        .submitBox {
            display: flex;
            justify-content: center;
        }
        .submit {
            width: 255px;
            background-color: #158fc5;
            border: none;
            border-radius: 12px;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            transition-duration: 0.4s;
            -webkit-transition-duration: 0.4s;
        }
        .submit:hover {
            box-shadow: 0 12px 16px 0 rgba(0, 0, 0, .24),
            0 17px 50px 0 rgba(0, 0, 0, .19);
        }
    </style>
</head>
<body>
<div class="Login">
    <div class="title">管理员登录</div>
    <form class="form" action="adminLogin" method="post">
        <div class="inputContext">
            <div class="inputBox">
                <input class="input" name="adminname" placeholder="请输入管理员账号" type="text" value="">
            </div>
        </div>
        <div class="inputContext">
            <div class="inputBox">
                <input class="input" name="password" placeholder="请输入管理员密码" type="password" value="">
            </div>
            <c:if test="${requestScope.adminloginMsg != null}" >
                <div class="warningMsg">*${requestScope.adminloginMsg}</div>
            </c:if>
        </div>

        <div class="submitBox">
            <button class="submit" type="submit">submit</button>
        </div>
    </form>
</div>
</body>
</html>
