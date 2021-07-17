<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ricky
  Date: 2021/6/25
  Time: 15:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>发布任务</title>
    <link rel="stylesheet" href="https://apps.bdimg.com/libs/bootstrap/3.2.0/css/bootstrap.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <link rel="stylesheet" href="/css/filebutton.css">
    <link rel="stylesheet" href="/css/style.css">
    <!-- Boxiocns CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
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


<h2 style="text-align: center">发布任务</h2>
<%--一定要写明提交方式，否则无法编码，中文乱码--%>
<form action="/AddTask" method="post">
    <table border="0" style="margin: 0 auto;width: 313px;height: 120px" class="table table-striped table-bordered">
        <tr>
            <td>用户名</td>
            <td><input type="text" name="username" required></td>
        </tr>
        <tr>
            <td>任务类型</td>
            <td><input type="text" name="type" required></td>
        </tr>
        <tr>
            <td>任务内容</td>
            <td><input type="text" name="descr"></td>
        </tr>
    </table>
    <p style="text-align: center;margin: 15px 0 10px;"><button type="submit">发布</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="reset" style="background-color: red">重置</button></p>
</form>

</section>
<script type="text/javascript">
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
