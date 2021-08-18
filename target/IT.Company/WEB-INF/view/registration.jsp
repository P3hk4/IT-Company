<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Pavel
  Date: 30.07.2021
  Time: 14:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration</title>
</head>
<body>
<br><br>
<h1>Registration new account</h1>
<br><br>
<form:form modelAttribute="user" action="saveRegistration">
    <h4>USERNAME:<form:input path="username"/></h4>
    <h4>PASSWORD:<form:password path="password"/></h4>
    <br><br>
    <input type="button" value="Back" onclick="window.location.href='/'">
    <input type="submit" value="Registration">
</form:form>

</body>
</html>
