<%--
  Created by IntelliJ IDEA.
  User: ricky
  Date: 2021/6/2
  Time: 19:30
  To change this template use File | Settings | File Templates.
--%>
<%request.setCharacterEncoding("utf-8");%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加学生信息</title>
</head>
<body>

<h2 style="text-align: center">添加学生信息</h2>
<%--一定要写明提交方式，否则无法编码，中文乱码--%>
<form action="/TwiceServlet" method="post">
    <table border="0" style="margin: 0 auto;width: 300px;height: 220px">
        <tr>
            <td>学号</td>
            <td><input type="text" name="id" required></td>
        </tr>
        <tr>
            <td>姓名</td>
            <td><input type="text" name="name" required></td>
        </tr>
        <tr>
            <td>性别</td>
            <td><input type="text" name="gender"></td>
        </tr>
        <tr>
            <td>联系地址</td>
            <td><input type="text" name="address"></td>
        </tr>
        <tr>
            <td>电话</td>
            <td><input type="text" name="telephone"></td>
        </tr>
    </table>
    <p style="text-align: center"><input type="submit">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset"></p>
</form>

</body>
</html>
