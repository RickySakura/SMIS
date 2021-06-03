<%@ page import="bean.Student" %>
<%@ page import="java.io.PrintWriter" %><%--
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

<h2 style="text-align: center">修改学生信息</h2>
<%--一定要写明提交方式，否则无法编码，中文乱码--%>

<form action="/EditServlet" method="post">
    <table border="0" style="margin: 0 auto;width: 300px;height: 220px">
        <tr>
            <td>学号</td>
            <td><input type="text" name="id" required value="${student.id}"></td>
        </tr>
        <tr>
            <td>姓名</td>
            <td><input type="text" name="name" required value="${student.name}"></td>
        </tr>
        <tr>
            <td>性别</td>
            <td><input type="text" name="gender" value="${student.gender}"></td>
        </tr>
        <tr>
            <td>联系地址</td>
            <td><input type="text" name="address" value="${student.address}"></td>
        </tr>
        <tr>
            <td>电话</td>
            <td><input type="text" name="telephone" value="${student.telephone}"></td>
        </tr>
        <input type="text" style="visibility: hidden" value="${student.id}" name="pid">
    </table>
    <p style="text-align: center"><input type="submit">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset"></p>
</form>
<script>
    function view() {
        window.document.getElementById("id1").innerHTML = ${student.id};
    }
</script>
</body>
</html>
