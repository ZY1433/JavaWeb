<%--
  Created by IntelliJ IDEA.
  User: ZHANGYANG
  Date: 2023-12-28
  Time: 11:43
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
  <link href="./css/loginAndRegister.css" rel="stylesheet" />
</head>
<body>
<div class="registerBox">
  <h2>请注册</h2>
  <form action="register" method="post">
    <div class="item">
      <input type="text" required name="username" id="user">
      <label for="user">请输入用户名</label>
      <span id="usernameError" class="error"></span>
    </div>
    <div class="item">
      <input type="email" required name="email" id="email" >
      <label for="email">请输入邮箱</label>
      <span id="emailError" class="error"></span>
    </div>
    <div class="item">
      <input type="password" required name="password" id="pwd">
      <label for="pwd">请输入6位强密码</label>
      <span id="passwordError" class="error"></span>
    </div>
    <div class="item">
      <input type="password" required name="repeatPassword" id="pwd2">
      <label for="pwd2">请重复密码</label>
      <span id="repeatPasswordError" class="error"></span>
    </div>
    <c:if test="${requestScope.registerMsg != null}" >
      <p class = "msg">${requestScope.registerMsg}</p>
    </c:if>
    <c:if test="${requestScope.registerSuccessMsg != null}" >
      <p class = "successMsg">${requestScope.registerSuccessMsg}</p>
    </c:if>
    <button class="btn" type="submit">提交
      <span></span>
      <span></span>
      <span></span>
      <span></span>
    </button>
    <a class="register" href="/loginForm">已有账号？请登录</a>
  </form>
</div>

<script>
  // 获取输入框和错误消息的元素
  const usernameInput = document.getElementById('user');
  const emailInput = document.getElementById('email');
  const passwordInput = document.getElementById('pwd');
  const repeatPasswordInput = document.getElementById('pwd2');

  const usernameError = document.getElementById('usernameError');
  const emailError = document.getElementById('emailError');
  const passwordError = document.getElementById('passwordError');
  const repeatPasswordError = document.getElementById('repeatPasswordError');

  // 定义验证函数
  function validateUsername() {
    const usernameValue = usernameInput.value.trim();
    const isValid = /^[a-zA-Z0-9]{2,16}$/.test(usernameValue);
    if (!isValid) {
      usernameError.textContent = '用户名应为2-16位字母或数字';
    } else {
      usernameError.textContent = '';
    }
    return isValid;
  }

  function validateEmail() {
    const emailValue = emailInput.value.trim();
    const isValid = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(emailValue);
    if (!isValid) {
      emailError.textContent = '请输入有效的邮箱地址';
    } else {
      emailError.textContent = '';
    }
    return isValid;
  }

  function validatePassword() {
    const passwordValue = passwordInput.value;
    const isValid = /^[a-zA-Z0-9]{6,16}$/.test(passwordValue);
    if (!isValid) {
      passwordError.textContent = '密码应为6-16位字母或数字';
    } else {
      passwordError.textContent = '';
    }
    return isValid;
  }

  function validateRepeatPassword() {
    const repeatPasswordValue = repeatPasswordInput.value;
    const passwordValue = passwordInput.value;
    const isValid = repeatPasswordValue === passwordValue;
    if (!isValid) {
      repeatPasswordError.textContent = '密码不匹配';
    } else {
      repeatPasswordError.textContent = '';
    }
    return isValid;
  }

  // 添加事件监听器
  usernameInput.addEventListener('input', validateUsername);
  emailInput.addEventListener('input', validateEmail);
  passwordInput.addEventListener('input', validatePassword);
  repeatPasswordInput.addEventListener('input', validateRepeatPassword);

  // 表单提交时的总体验证
  function validateForm() {
    const isValidUsername = validateUsername();
    const isValidEmail = validateEmail();
    const isValidPassword = validatePassword();
    const isValidRepeatPassword = validateRepeatPassword();

    return isValidUsername && isValidEmail && isValidPassword && isValidRepeatPassword;
  }

  // 添加表单提交事件监听器
  document.querySelector('form').addEventListener('submit', function (event) {
    if (!validateForm()) {
      event.preventDefault(); // 阻止表单提交
    }
  });
</script>
</body>
</html>
