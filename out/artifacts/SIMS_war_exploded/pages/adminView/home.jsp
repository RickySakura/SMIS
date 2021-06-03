<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ricky
  Date: 2021/6/2
  Time: 17:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生信息浏览</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 包含 bootstrap 样式表 -->
    <link rel="stylesheet" href="https://apps.bdimg.com/libs/bootstrap/3.2.0/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2 style="text-align: center">学生信息表</h2>
    <p>您为超级用户</p>
    <p><a href="http://localhost:8080/pages/adminView/insert.jsp" >添加字段</a></p>
    <div class="table-responsive">
        <table class="table table-striped table-bordered">
            <thead>
            <tr>
                <th>学号</th>
                <th>姓名</th>
                <th>性别</th>
                <th>联系地址</th>
                <th>电话号码</th>
                <th>执行操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${ls}" var="s">
                <tr>
                    <td>${s.id}</td>
                    <td>${s.name}</td>
                    <td>${s.gender}</td>
                    <td>${s.address}</td>
                    <td>${s.telephone}</td>
                    <td width="120px" style="text-align: center">
                        <a href="http://localhost:8080/FindServlet?id=${s.id}">编辑</a>&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="http://localhost:8080/DeleteStudentServlet?id=${s.id}" onclick="del()">删除</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<script>
    function del() {
        if(!confirm("是否确认删除该学生信息")){
            window.event.returnValue=false;
        }
    }
</script>
</body>
</html>
