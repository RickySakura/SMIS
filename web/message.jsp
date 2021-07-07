<%--
  Created by IntelliJ IDEA.
  User: ricky
  Date: 2021/6/21
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
${message} 3秒后返回
<%
    response.setHeader("Refresh", "3; URL=http://localhost:8080/ListFileServlet?index=1");
%>
</body>
</html>
