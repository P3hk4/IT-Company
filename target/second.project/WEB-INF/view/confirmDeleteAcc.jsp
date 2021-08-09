<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Pavel
  Date: 05.08.2021
  Time: 12:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CONFIRM DELETE</title>
</head>
<body>
<br><br>
<h1>Confirm delete</h1>
<br><br>
<form:form modelAttribute="acc" action="/deleteAcc">
    <form:hidden path="username"/>
    <h2>Are you sure you want to delete ${acc.username} Account?</h2>
    <br><br>
    <h4>USERNAME:${acc.username}</h4>
    <h4>AUTHORITY:${acc.authority}</h4>
    <h4>NAME:${acc.name}</h4>
    <h4>SURNAME:${acc.surname}</h4>
    <h4>POST:${acc.post}</h4>
    <h4>SALARY:${acc.salary}</h4>
    <br><br>
    <input type="button" value="BACK" onclick="window.location.href='/catalog'">
    <input type="submit" value="DELETE">
</form:form>

</body>
</html>
