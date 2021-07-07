<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ricky
  Date: 2021/6/25
  Time: 15:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>发布任务</title>
    <link rel="stylesheet" href="https://apps.bdimg.com/libs/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/filebutton.css">
</head>
<body>
<c:if test="${user.type==1}">
    <div style="background: #243b55;height: 43px;width: 1707px">
        <p style="color: rgb(255,238,0);font-size: 15px;padding: 11px 280px;font-size: 15px">欢迎您，超级用户 ${user.username}&nbsp;&nbsp;<a href="/index.jsp" style="color: #cdff97">退出登录</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a style="color: #8fff96" href="/myAccount.jsp">返回首页</a></p>
    </div>
</c:if>
<c:if test="${user.type!=1}">
    <div style="background: #243b55;height: 43px;width: 1707px">
        <p style="color: rgb(255,238,0);font-size: 15px;padding: 11px 280px;font-size: 15px">欢迎您，用户 ${user.username}&nbsp;&nbsp;<a href="/index.jsp" style="color: #cdff97">退出登录</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a style="color: #8fff96" href="/myAccount.jsp">返回首页</a></p>
    </div>
</c:if>
<h2 style="text-align: center">发布任务</h2>
<%--一定要写明提交方式，否则无法编码，中文乱码--%>
<form action="/AddTask" method="post">
    <table border="0" style="margin: 0 auto;width: 303px;height: 120px" class="table table-striped table-bordered">
        <tr>
            <td>用户名</td>
            <td><input type="text" name="username" required></td>
        </tr>
        <tr>
            <td>任务类型</td>
            <td><input type="text" name="type" required></td>
        </tr>
        <tr>
            <td>任务内容</td>
            <td><input type="text" name="descr"></td>
        </tr>
    </table>
    <p style="text-align: center;margin: 15px 0 10px;"><button type="submit">发布</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="reset" style="background-color: red">重置</button></p>
</form>
</body>
</html>
