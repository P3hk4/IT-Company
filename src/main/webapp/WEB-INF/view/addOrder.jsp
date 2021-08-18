<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Pavel
  Date: 06.08.2021
  Time: 14:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ADD ORDER</title>
</head>
<body>
<br><br>
<h1>Add new order</h1>
<br><br>
<form:form modelAttribute="project" action="/saveNewOrder">
    <form:hidden path="customer"/>
    <h4>What product do you need?<br><form:input path="name"/></h4>
    <br><br>
    <input type="button" value="Back" onclick="window.location.href='/myCurrentProjects'">
    <input type="submit" value="Save order">
</form:form>
</body>
</html>
