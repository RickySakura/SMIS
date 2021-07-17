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
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <link rel="stylesheet" href="/css/style.css">
    <!-- Boxiocns CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="/css/button.css">
    <style type="text/css">
        button {
            width: 56px;
            height: 37px;
            padding: 7px;
            background-color: #255072;
            border-color: #357ebd;
            color: #fff;
            border-radius: 28px;
            text-align: center;
            vertical-align: middle;
            border: 0px solid transparent;
            font-weight: 900;
            font-size: 115%;
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

    <div>

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
                        共${count}页 -向<input type="text" name="index"/>页 <button type="submit" onclick="aler()">跳转</button>
                        <a href = "/ListStudentServlet?index=${index+1}" onclick="alertt()" >下一页</a>
                        <a href = "/ListStudentServlet?index=${count}" >尾页</a>
                    </p>
                </form>
            </div>
        </div>
    </div>

</section>

<script type="text/javascript">
    function del() {
        if(!confirm("是否确认删除该学生信息")){
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
        var index = document.getElementsById("aaa");
        if(index>${count}){
            alert("已超出最大页数");
            window.event.returnValue=false;
        }
    }
    <%--侧边栏滑动动画是通过js函数实现的动画效果--%>
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
