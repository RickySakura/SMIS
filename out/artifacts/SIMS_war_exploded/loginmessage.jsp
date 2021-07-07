<%--
  Created by IntelliJ IDEA.
  User: ricky
  Date: 2021/6/22
  Time: 22:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆失败</title>
</head>
<body>
${message} 3秒后返回
<%
    response.setHeader("Refresh", "3; URL=http://localhost:8080/index.jsp");
%>
</body>
</html>
