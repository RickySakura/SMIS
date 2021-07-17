<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ricky
  Date: 2021/6/2
  Time: 19:30
  To change this template use File | Settings | File Templates.
--%>
<%request.setCharacterEncoding("utf-8");%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加用户信息</title>
    <link rel="stylesheet" href="https://apps.bdimg.com/libs/bootstrap/3.2.0/css/bootstrap.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <link rel="stylesheet" href="/css/filebutton.css">
    <link rel="stylesheet" href="/css/style.css">
    <!-- Boxiocns CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
<jsp:include page="../../myAccount.jsp" flush="true"/>

<section class="home-section">
    <div class="home-content">
        <i class='bx bx-menu' ></i>
        <span class="text">
    <div class="div-style">
        <p class="p-style">欢迎您，超级用户 ${user.username}&nbsp;&nbsp;<a href="/index.jsp" style="color: #cdff97">退出登录</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a style="color: #8fff96" href="/genshin.jsp">返回首页</a></p>
    </div>
      </span>
    </div>

<h2 style="text-align: center">添加用户信息</h2>
<%--一定要写明提交方式，否则无法编码，中文乱码--%>
<form action="/TwiceServlet" method="post">
    <table border="0" style="margin: 0 auto;width: 300px;height: 220px">
        <tr>
            <td>工号</td>
            <td><input type="text" name="id" required></td>
        </tr>
        <tr>
            <td>姓名</td>
            <td><input type="text" name="name" required></td>
        </tr>
        <tr>
            <td>性别</td>
            <td><input type="text" name="gender"></td>
        </tr>
        <tr>
            <td>联系地址</td>
            <td><input type="text" name="address"></td>
        </tr>
        <tr>
            <td>电话</td>
            <td><input type="text" name="telephone"></td>
        </tr>
    </table>
    <p style="text-align: center"><input type="submit">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset"></p>
</form>

</section>
</body>
</html>
