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
    <link rel="stylesheet" href="/css/filebutton.css">
</head>
<body>
<c:if test="${user.type==1}">
    <div style="background: #243b55;height: 43px;width: 1707px">
        <p style="color: rgb(255,238,0);font-size: 15px;padding: 11px 280px;font-size: 15px">欢迎您，超级用户 ${user.username}&nbsp;&nbsp;<a href="/index.jsp" style="color: #cdff97">退出登录</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a style="color: #8fff96" href="/myAccount.jsp">返回首页</a></p>
    </div>
</c:if>
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

</body>
</html>
