<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Pavel
  Date: 04.08.2021
  Time: 21:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Catalog</title>
</head>
<body>
<br><br>
<h1>Chose the type</h1>
<br><br>
<input type="button" value="Projects in progress" onclick="window.location.href='/projectsInProgress'">
<input type="button" value="Projects without developers" onclick="window.location.href='/projectsWithoutDevelopers'">
<input type="button" value="Projects unpaid" onclick="window.location.href='/projectsUnpaid'">
<input type="button" value="Projects completed" onclick="window.location.href='/projectsCompleted'">
<br>
<security:authorize access="hasRole('ADMIN')">
<input type="button" value="All employees" onclick="window.location.href='/allEmployees'">
<input type="button" value="All clients" onclick="window.location.href='/allClients'">
</security:authorize>
<br><br>
<input type="button" value="Back" onclick="window.location.href='/'">
</body>
</html>
