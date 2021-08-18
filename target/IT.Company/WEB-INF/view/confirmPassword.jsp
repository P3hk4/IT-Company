<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Pavel
  Date: 16.08.2021
  Time: 16:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CONFIRM CURRENT PASSWORD</title>
</head>
<body>
<br><br>
<h1>Please, write your current password!</h1>
<br><br>
<form:form action="/confirmPassword" modelAttribute="username">
    <h4>Password:<input type="password" name="password"></h4>
    <input type="text" value="${username}" hidden name="username"/>
    <br><br>
    <input type="button" value="Back" onclick="window.location.href='/myAccPage'">
    <input type="submit" value="Confirm">
</form:form>
</body>
</html>
