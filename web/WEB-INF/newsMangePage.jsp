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
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
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
            background-color: #3498db;
            color: white;
            padding: 1rem;
            text-align: center;
            display: flex;
            flex-direction: row;
            justify-content: space-around;
            align-items: center;
        }

        a {
            text-decoration: none;
            color: white;
            font-size: 32px;
            font-weight: bold;
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
        .content-cell {
            max-width: 400px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .datetime-cell {
            white-space: nowrap;
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

        .post .title {
            width: 450px;
            height: 30px;
            display: block;
            border: 1px #cecece solid;
            margin-bottom: 10px;
        }
        .post .message {
            width: 450px;
            height: 200px;
            display: block;
            border: 1px #cecece solid;
            margin-bottom: 10px;
        }

    </style>
</head>
<body>

<header>
    <a href="userMangePage">《回到用户管理页面</a>
    <h1>新闻管理系统</h1>
    <a href="main">前往用户主界面》</a>
</header>

<main>
    <button onclick="add()">添加新闻</button>
    <button onclick="edit()">编辑新闻</button>
    <button onclick="del()">删除新闻</button>
    <button onclick="javascript:location.reload();">查找新闻</button>
    <c:if test="${requestScope.newsMsg != null}">
        <p style="color: red">${requestScope.newsMsg}</p>
    </c:if>
    <table>
        <thead>
        <tr>
            <th>News ID</th>
            <th>标题</th>
            <th>内容</th>
            <th>发布时间</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${sessionScope.newsList}" var="news">
            <tr>
                <td>${news.newsId}</td>
                <td>${news.title}</td>
                <td class="content-cell">${news.content}</td>
                <td class="datetime-cell">${news.publishTime}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</main>
<div class="post">
    <h2>添加新闻</h2>
    <form method="post" action="newsMange">
        <input class="title" placeholder="请输入插入的新闻标题" name="title" type="text" required>
        <textarea class="message" placeholder="请输入插入的新闻内容" name="content" required></textarea>
        <input style="display: none" value="add" name="type">
        <div style="display: flex;flex-direction: row;justify-content: center">
            <button type="submit">提交</button>
            <button onclick="closing()" type="reset">关闭</button>
        </div>
    </form>
</div>
<div class="post">
    <h2>根据id编辑新闻</h2>
    <form method="post" action="newsMange">
        <input class="title" placeholder="请输入编辑的新闻id" name="newsId" type="number" required>
        <input class="title" placeholder="请输入更新后的新闻标题" name="title" type="text" required>
        <input class="message" placeholder="请输入更新后的新闻内容" name="content" type="text" required>
        <input style="display: none" value="edit" name="type">
        <div style="display: flex;flex-direction: row;justify-content: center">
            <button type="submit">提交</button>
            <button onclick="closing()" type="reset">关闭</button>
        </div>
    </form>
</div>
<div class="post">
    <h2>根据id删除新闻</h2>
    <form method="post" action="newsMange">
        <input class="title" placeholder="请输入删除的新闻id" name="newsId" type="number" required>
        <input style="display: none" value="delete" name="type">
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

    // 添加新闻
    function add() {
        postelement[0].setAttribute("style", 'display:flex');
    }
    // 编辑新闻
    function edit() {
        postelement[1].setAttribute("style", 'display:flex');
    }
    // 删除新闻
    function del(){
        postelement[2].setAttribute("style", 'display:flex');
    }
    // 关闭页面
    function closing() {
        for (let i = 0; i < postelement.length; i++) {
            postelement[i].setAttribute("style", 'display:none');
        }
    }
</script>
</html>

