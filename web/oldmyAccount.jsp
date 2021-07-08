<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ricky
  Date: 2021/6/2
  Time: 12:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人用户</title>
    <%--<link rel="stylesheet" href="/css/main.css">--%>
    <style type="text/css">
        .user-box{
            height: 140px;
            width: 1690px;
            background: #141e30;
        }
        h2{
            text-align: center;
        }

        a{
            color: #dde9ff;
        }
    </style>
</head>

<body>
<div class="user-box">

    <c:if test="${user.type==1}">
        <p><h2 style="color: #ff0f60">您为超级用户</h2></p><br/>
    </c:if>
    <c:if test="${user.type!=1}">
        <p><h2 style="color: #8fff96">您为普通用户</h2></p><br/>
    </c:if>
    <p><h2></h2></p>
    <p>
    <h2>
    <%--这里要手动添加index=1默认到第一页，否则会空值报错--%>
    <a href="/ListFileServlet?index=1">我的文件管理</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="/ListStudentServlet?index=1">查看用户信息</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="/querymenu.jsp">我的任务管理</a>
    </h2>
    </p>
</div>
</body>
</html>
