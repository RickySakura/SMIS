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
    <link rel="stylesheet" href="https://apps.bdimg.com/libs/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/filebutton.css">
</head>
<body>

<div style="background: #243b55;height: 43px;width: 1707px">
    <p style="color: rgb(255,238,0);font-size: 15px;padding: 11px 280px;font-size: 15px">欢迎您，用户 ${user.username}&nbsp;&nbsp;<a href="/index.jsp" style="color: #cdff97">退出登录</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a style="color: #8fff96" href="/myAccount.jsp">返回首页</a></p>
</div>
<div class="container">
    <h2 style="text-align: center">用户信息表</h2>
   <p> <c:forEach items="${ls}" var="as">
        <c:if test="${as.name==user.username}">
            <a href="http://localhost:8080/FindServlet?id=${as.id}">修改我的信息</a>
        </c:if>
   </c:forEach></p>
    <div class="table-responsive">
        <table class="table table-striped table-bordered">
            <thead>
            <tr>
                <th>工号</th>
                <th>姓名</th>
                <th>性别</th>
                <th>联系地址</th>
                <th>电话号码</th>
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
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <form action="/ListStudentServlet">
            <p style="text-align: center"><a href = "/ListStudentServlet?index=1" >首页</a>
                <%--通过地址栏传递参数，来实现index的改变--%>
                <a href = "/ListStudentServletindex=${index-1}" >上一页</a>
                共${count}页 -向<input type="text" name="index"/>页 <button type="submit">跳转</button>
                <a href = "/ListStudentServlet?index=${index+1}" >下一页</a>
                <a href = "/ListStudentServlet?index=${count}" onclick="alertt()" >尾页</a></p>
        </form>
    </div>
</div>>
</body>
<script>
    function alertt() {
        if (${index}+1>=${count}){
            alert("当前已经是最后一页了！");
            window.event.returnValue=false;
        }
    }
</script>
</html>
