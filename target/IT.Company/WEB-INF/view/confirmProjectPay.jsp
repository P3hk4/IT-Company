<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Pavel
  Date: 08.08.2021
  Time: 15:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CONFIRM YOUR PAYMENT</title>
</head>
<body>
<br><br>
<form:form modelAttribute="project" action="/saveProjectPay">
    <form:hidden path="id"/>
<h1>Do you really want pay for ${project.name} project?</h1>
    <br><br>
    <input type="button" value="Back" onclick="window.location.href='/myCurrentProjects'">
    <input type="submit" value="Pay">
</form:form>
</body>
</html>
