<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Pavel
  Date: 31.07.2021
  Time: 22:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>MY ACCOUNT PAGE</title>
</head>
<body>
<br><br>
<h1>My Account page</h1>
<br><br>
<form:form modelAttribute="myAcc" action="/updateMyAcc">
    <h4>USERNAME:${myAcc.username}</h4>
    <h4>NAME:${myAcc.name}</h4>
    <h4>SURNAME:${myAcc.surname}</h4>
    <h4>POST:${myAcc.post}</h4>
    <h4>SALARY:${myAcc.salary}</h4>
    <br><br>
    <input type="button" value="BACK" onclick="window.location.href='/'">
    <input type="button" value="UPDATE" onclick="window.location.href='/updateMyAcc'">
</form:form>
</body>
</html>
