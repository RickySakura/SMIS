<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <title>登录系统</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/button.css">
  </head>
  <body>
  <div class="login-box">
    <h2>用户信息管理系统</h2>
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

            <input name="vericode" placeholder="验证码" value="" style="width: 120px;margin: 4px;height: 35px;">
            <img id="vericodeImg" src="/imageCode">
            <a id="kanbuq" href="javascript:changeImg();" style="font-size: 16px;letter-spacing: 1px;padding: 8px 4px;margin-top: 20px;">看不清，换一张</a><br>




      <button type="submit">
        <span></span>
        <span></span>
        <span></span>
        <span></span>
        登录
      </button>

    </form>
  </div>
  <script type="text/javascript" src="/js/jquery-3.5.1.js"></script>
  <script type="text/javascript">
      function changeImg() {
          //需要让每次请求的url都发生变化。否则服务器会认为访问的时一张图片，就不会刷新请求了
          //每次url一样，服务器会认为访问的url是同一张图片，没变化啊
          $("#vericodeImg").attr("src","imageCode?"+Math.random());
      }
  </script>
  </body>

</html>
