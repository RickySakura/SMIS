<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ricky
  Date: 2021/6/2
  Time: 12:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>万叶首页</title>
</head>

<body>
<jsp:include page="myAccount.jsp"/>

<section class="home-section">
    <div class="home-content" style="height: 52px">
        <i class='bx bx-menu' ></i>
        <span class="text">
            <c:if test="${user.type==1}">
    <div class="div-style">
        <p class="p-style">欢迎您，超级用户 ${user.username}&nbsp;&nbsp;<a href="/index.jsp" style="color: #cdff97">退出登录</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a style="color: #8fff96" href="/myAccount.jsp">返回首页</a></p>
    </div>
            </c:if>
            <c:if test="${user.type!=1}">
    <div class="div-style">
        <p class="p-style">欢迎您，用户 ${user.username}&nbsp;&nbsp;<a href="/index.jsp" style="color: #cdff97">退出登录</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a style="color: #8fff96" href="/myAccount.jsp">返回首页</a></p>
    </div>
            </c:if>

      </span>
    </div>

    <a href="https://www.bilibili.com/video/BV15K4y1M7Xn?from=search&seid=18419053587492121925" target="wanyePV">
        <img src="images/wanye.jpg" style="width: 100%;height: 94%" alt="该图片不存在" title="万叶太帅了">
    </a>
    <iframe name="wanyePV" height="94%" width="100%"></iframe>
    <%--<embed src="https://www.bilibili.com/static.hdslb.com/play.swf" width="100%" hegiht="94%" type="application/x-shockwave-flash" quality="high">--%>
</section>

<script>
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
