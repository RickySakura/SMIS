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
    <title>用户信息浏览</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 包含 bootstrap 样式表 -->
    <link rel="stylesheet" href="https://apps.bdimg.com/libs/bootstrap/3.2.0/css/bootstrap.min.css">
    <style type="text/css">
        #back1{

            background-repeat: no-repeat;
            background-position: center;
            background-size:390px;
        }
    </style>

</head>
<body id="back1">

<div style="background: #243b55;height: 43px;width: 1707px">
    <p style="color: rgb(255,238,0);font-size: 15px;padding: 11px 280px;font-size: 15px">欢迎您，超级用户 ${user.username}&nbsp;&nbsp;<a href="/index.jsp" style="color: #cdff97">退出登录</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a style="color: #8fff96" href="/myAccount.jsp">返回首页</a></p>
</div>
<div class="container">
    <h2 style="text-align: center">用户信息表</h2>
    <p><a href="http://localhost:8080/pages/adminView/insert.jsp" >添加字段</a></p>
    <div class="table-responsive">
        <table class="table table-striped table-bordered">
            <thead>
            <tr>
                <th>工号</th>
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
        <form action="/ListStudentServlet">
            <p style="text-align: center"><a href = "/ListStudentServlet?index=1" >首页</a>
                <%--通过地址栏传递参数，来实现index的改变--%>
                <a href = "/ListStudentServlet?index=${index-1}" >上一页</a>
                共${count}页 -向<input type="text" name="index"/>页 <button type="submit">跳转</button>
                <a href = "/ListStudentServlet?index=${index+1}" onclick="alertt()" >下一页</a>
                <a href = "/ListStudentServlet?index=${count}" >尾页</a></p>
        </form>
    </div>
</div>
<script>
    function del() {
        if(!confirm("是否确认删除该学生信息")){
            window.event.returnValue=false;
        }
    }
    function alertt() {
        if (${index}+1>=${count}){
            alert("当前已经是最后一页了！");
            window.event.returnValue=false;
        }
    }
    function aler() {
        var index = document.getElementsById("aaa");
        if(index>${count}){
            alert("已超出最大页数");
            window.event.returnValue=false;
        }
    }
</script>
</body>
</html>
