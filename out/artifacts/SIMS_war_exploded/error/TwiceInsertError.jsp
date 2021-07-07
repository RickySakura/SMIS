<%--
  Created by IntelliJ IDEA.
  User: ricky
  Date: 2021/6/2
  Time: 21:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>插入两次错误！</title>
</head>
<body>
<h3>您要插入的学号已经存在，请点击编辑以修改信息....五秒后跳转</h3>
<%Thread.sleep(5000);
   response.sendRedirect(request.getContextPath()+"/pages/adminView/home.jsp");
%>
</body>
</html>
