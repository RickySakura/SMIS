<%@ page import="java.net.URLEncoder" %>
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
    <title>文件信息浏览</title>
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
    </style>
</head>
<body class="white">
<jsp:include page="../../myAccount.jsp"/>

<section class="home-section">
    <div class="home-content">
        <i class='bx bx-menu' ></i>
        <span class="text">
            <c:if test="${user.type==1}">
    <div class="div-style">
        <p class="p-style">欢迎您，超级用户 ${user.username}&nbsp;&nbsp;<a href="/index.jsp" style="color: #cdff97">退出登录</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a style="color: #8fff96" href="/genshin.jsp">返回首页</a></p>
    </div>
            </c:if>
            <c:if test="${user.type!=1}">
    <div class="div-style">
        <p class="p-style">欢迎您，用户 ${user.username}&nbsp;&nbsp;<a href="/index.jsp" style="color: #cdff97">退出登录</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a style="color: #8fff96" href="/genshin.jsp">返回首页</a></p>
    </div>
            </c:if>

      </span>
    </div>

<div class="container">
    <h2 style="text-align: center">文件管理列表</h2>
    <form action="/Upload" enctype="multipart/form-data" method="post">
<div class="file">上传文件
    <input type="file" name="file1">
    <%--文件上传中的name一定要写，不然uploadFactory无法解析键值对--%>
    </div>
        <div class="file">提交
            <input type="submit">
        </div>
    </form>

    <div>
        <table class="table table-striped ">
            <thead>
            <tr>
                <th style="width: 100px;height: 5px">编号</th>
                <th style="height: 30px;width: 100px">上传者</th>
                <th>文件名</th>
                <th>本地地址</th>
                <th>上传时间</th>
                <th>执行操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="s">
                <tr>
                    <td>${s.num}</td>
                    <td>${s.username}</td>
                    <td>${s.filename}</td>
                    <td>${s.fileurl}</td>
                    <td>${s.datetime}</td>
                    <td  width="185px" style="text-align: center;border-top: 2px solid #ddd;">
                         <form action="/ShowImage" method="post"name="form1" style="width: 144px;"><button type="submit" style="float: left">查看</button>
                                <input type="hidden" name="filename" value="${s.filename}"> <input type="hidden" name="fileurl" value="${s.fileurl}"></form>

                            <form action="/Download" method="post" name="form2"><button type="submit" style="float: right;background-color: #8bcd80">下载</button>
                                <input type="hidden" name="filename" value="${s.filename}"> <input type="hidden" name="fileurl" value="${s.fileurl}"></form>

                            <form action="/DeleteFileServlet" method="post" name="form3"><button type="submit" style="float: right;border-color: #ff540e;background-color: #ff5c41">删除</button>
                                <input type="hidden" name="filename" value="${s.filename}"> <input type="hidden" name="fileurl" value="${s.fileurl}"></form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
       <%--用表单提交实现页数跳转--%>
        <form action="/ListFileServlet">
        <p style="text-align: center"><a href = "/ListFileServlet?index=1" >首页</a>
            <%--通过地址栏传递参数，来实现index的改变--%>
            <a href = "/ListFileServlet?index=${index-1}" >上一页</a>
            ${index}/${count} -向<input type="text" name="index"/>页 <button type="submit" onclick="aler()">跳转</button>
            <a href = "/ListFileServlet?index=${index+1}" onclick="alertt()" >下一页</a>
            <a href = "/ListFileServlet?index=${count}">尾页</a></p>
    </form>
    </div>
</div>
</section>

<script type="text/javascript">
    function del() {
        if(!confirm("是否确认删除该文件")){
            window.event.returnValue=false;
        }
    }

    function alertt() {
        if (${index}+1>${count}){
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
