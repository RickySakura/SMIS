<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ricky
  Date: 2021/6/1
  Time: 16:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>学生信息管理系统</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/button.css">
  </head>
  <body>
  <div class="login-box">
    <h2>登陆系统</h2>
    <form action="/LoginServlet" method="get">
      <div class="user-box">
        <input type="text" name="username" required>
        <label>用户名</label>
      </div>
      <div class="user-box" id="pwd">
        <input type="text" name="password" required>
        <label>密码</label>
       <%--<c:if test="${sessionScope.user==null}">--%>
           <%--<h5 style="color:deeppink">用户名或密码错误</h5>--%>
       <%--</c:if>--%>
      </div>

      <button type="submit">
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        登录
      </button>

    </form>
  </div>
  </body>

</html>
