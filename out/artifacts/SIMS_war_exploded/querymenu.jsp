<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ricky
  Date: 2021/6/16
  Time: 23:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>任务管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="content-type" content="text/html; charset=iso8859-1">
    <!-- 包含 bootstrap 样式表 -->
    <link rel="stylesheet" href="https://apps.bdimg.com/libs/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/filebutton.css">
    <link rel="stylesheet" href="/css/style.css">
    <style type="text/css">
        select{
            width: 176px;height: 29px;font-size: 16px
        }
    </style>
</head>
<body>
<jsp:include page="myAccount.jsp" flush="true"/>

<section class="home-section">
    <div class="home-content">
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

<div>

    <h2 style="text-align: center">任务管理</h2>
    <%--一定要写明提交方式，否则无法编码，中文乱码--%>
    <form action="/ListTask?index=1" method="post" name="form1">
        <table border="0" style="margin: 0 auto;width: 300px;height: 170px">
            <tr>
                <td>任务日期：</td>
                <td>
                    <select name="date">
                        <option value="0">全部</option>
                        <option value="2020-01~2020-07">2020年1月-6月</option>
                        <option value="2020-07~2020-13">2020年7月-12月</option>
                        <option value="2021-01~2021-07">2021年1月-6月</option>
                        <option value="2021-07~2021-13">2021年7月-12月</option>
                        <option value="2022-01~2022-07">2022年1月-6月</option>
                        <option value="2022-07~2022-13">2022年7月-12月</option>
                        <option value="2023-01~2023-07">2023年1月-6月</option>
                        <option value="2023-07~2023-13">2023年7月-12月</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>任务状态：</td>
                <td>
                    <select name="stat">
                        <option value="2">所有任务</option>
                        <option value="1">已完成</option>
                        <option value="0">未完成</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>任务类别：</td>
                <td>
                    <select name="t_type" id="t">
                        <option value="0">(全部)</option>
                        <option value="Java">Java</option>
                        <option value="C++">C++</option>
                    </select>
                </td>
            </tr>
        </table>
        <p style="text-align: center"><button type="submit" style="color: white">查询</button>&nbsp;&nbsp;&nbsp;&nbsp;<button type="reset" style="color: white">重置</button></p>
    </form>


</div>
</body>
</html>
