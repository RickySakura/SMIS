<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ricky
  Date: 2021/6/24
  Time: 13:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>任务信息浏览</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="content-type" content="text/html; charset=iso8859-1">
    <!-- 包含 bootstrap 样式表 -->
    <link rel="stylesheet" href="https://apps.bdimg.com/libs/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/filebutton.css">
    <link rel="stylesheet" href="/css/style.css">
    <style type="text/css">
        div p:first-child{
            font-size: 15px;font-size: 15px;margin: -3px 0 10px;
        }
        button{

        }
    </style>
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

<div class="container">
    <h2 style="text-align: center">任务管理系统</h2>
    <%--发布任务--%>
    <p><a href="/pages/adminView/addTask.jsp">发布任务</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/querymenu.jsp">按条件查询</a></p>
    <%--用choose和when虽然有点蠢，但是有用--%>
    <%--<p>--%>
        <%--任务状态：--%>
        <%--<select name="a" onchange="javascript:window.location.replace(this.value)">--%>
            <%--<c:choose>--%>
                <%--<c:when test="${stat==0}">--%>
                    <%--<option value="http://localhost:8080/ListTask?stat=0&index=1">未完成</option>--%>
                    <%--<option value="http://localhost:8080/ListTask?stat=1&index=1">已完成</option>--%>
                    <%--<option value="http://localhost:8080/ListTask?index=1">所有任务</option>--%>
                <%--</c:when>--%>
                <%--<c:when test="${stat==1}">--%>
                    <%--<option value="http://localhost:8080/ListTask?stat=1&index=1">已完成</option>--%>
                    <%--<option value="http://localhost:8080/ListTask?stat=0&index=1">未完成</option>--%>
                    <%--<option value="http://localhost:8080/ListTask?index=1">所有任务</option>--%>
                <%--</c:when>--%>
                <%--<c:otherwise>--%>
                    <%--<option value="http://localhost:8080/ListTask?index=1">所有任务</option>--%>
                    <%--<option value="http://localhost:8080/ListTask?stat=0&index=1">未完成</option>--%>
                    <%--<option value="http://localhost:8080/ListTask?stat=1&index=1">已完成</option>--%>
                <%--</c:otherwise>--%>
            <%--</c:choose>--%>
        <%--</select>--%>
    <%--</p>--%>
    <div>
        <table class="table table-striped table-bordered">
            <thead>
            <tr>
                <th style="width: 100px;height: 5px">序号</th>
                <th style="height: 30px;width: 100px">用户</th>
                <th>任务类型</th>
                <th>任务内容</th>
                <th>状态</th>
                <th>修改时间</th>
                <th>执行操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="s">
                <tr>
                    <td>${s.num}</td>
                    <td>${s.username}</td>
                    <td>${s.type}</td>
                    <td>${s.descr}</td>
                    <c:choose>
                        <c:when test="${s.status eq '未完成'}"><td style="color: red;font-weight: bolder">${s.status}</td></c:when>
                        <c:when test="${s.status eq '已完成'}"><td style="color:#00c800;font-weight: bolder">${s.status}</td></c:when>
                    </c:choose>
                    <td>${s.datetime}</td>
                    <td width="120px" style="text-align: center">
                        <c:choose>
                            <c:when test="${s.status eq '未完成'}">
                                <form action="/editStatus" method="post"name="form1" style="width: 144px;"><button type="submit" style="float: left;width: 90px" onclick="conf()">审核</button>
                                    <input type="hidden" name="num" value="${s.num}"> <input type="hidden" name="status" value="已完成"></form>
                            </c:when>
                            <c:when test="${s.status eq '已完成'}">
                                <form action="/DeleteTask" method="post"name="form1" style="width: 144px;"><button type="submit" style="float: left;width: 90px;background-color: red" onclick="del()">删除记录</button>
                                    <input type="hidden" name="num" value="${s.num}"></form>
                            </c:when>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <%--用表单提交实现页数跳转--%>
        <form action="/ListTask">
            <p style="text-align: center"><a href = "/ListTask?index=1" >首页</a>
                <%--通过地址栏传递参数，来实现index的改变--%>
                <a href = "/ListTask?index=${index-1}" >上一页</a>
                共${count}页 -向<input type="text" name="index"/>页 <button type="submit" onclick="aler()">跳转</button>
                <a href = "/ListTask?index=${index+1}" onclick="alertt()">下一页</a>
                <a href = "/ListTask?index=${count}" >尾页</a></p>
        </form>
    </div>
</div>
</section>
<script type="text/javascript" src="/js/jquery-3.5.1.js"></script>
<script type="text/javascript">
    function del() {
        if(!confirm("是否确认删除该记录")){
            window.event.returnValue=false;
        }
    }
    function conf() {
        if(!confirm("是否确认审核通过")){
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
        var index = document.getElementsByName("index");
        if(index>${count}){
            alert("已超出最大页数");
            window.event.returnValue=false;
        }
    }
    let arrow = document.querySelectorAll(".arrow");
    for (var i = 0; i < arrow.length; i++) {
        arrow[i].addEventListener("click", (e)=>{
            let arrowParent = e.target.parentElement.parentElement;
            arrowParent.classList.toggle("showMenu");
        });
    }

    let sidebar = document.querySelector(".sidebar");
    let sidebarBtn = document.querySelector(".bx-menu");
    console.log(sidebarBtn);
    sidebarBtn.addEventListener("click", ()=>{
        sidebar.classList.toggle("close");
    });
</script>
</body>
</html>
