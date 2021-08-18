<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Pavel
  Date: 16.08.2021
  Time: 16:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ENTER NEW PASSWORD</title>
</head>
<body>
<br><br>
<h1>ENTER YOUR NEW PASSWORD</h1>
<br><br>
<form:form modelAttribute="user" action="/saveNewPassword">
    <form:hidden path="username"/>
    <form:hidden path="enabled"/>
    <h4>Password:<input type="password" name="newPassword"></h4>
<br><br>
</form:form>
<input type="button" value="Save" onclick="window.location.href='/saveNewPassword'">
<br>

<input type="button" value="Back" onclick="window.location.href='/myAccPage'">
</body>
</html>
