<%@ taglib prefix="c" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Pavel
  Date: 29.07.2021
  Time: 18:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>HOME PAGE</title>
</head>
<body>
<br><br>
<h1>Home page</h1>
<br><br>
<security:authorize access="hasRole('ANONYMOUS')">
    <input type="button" value="Registration" onclick="window.location.href='/registration'">
    <input type="button" value="Login" onclick="window.location.href='/login'">
</security:authorize>
<security:authorize access="hasAnyRole('MANAGER','ADMIN')">
    <input type="button" value="Catalog" onclick="window.location.href='/catalog'">
</security:authorize>
<security:authorize access="hasAnyRole('DEVELOPER')">
    <input type="button" value="My work" onclick="window.location.href='/myWorkProjects'">
</security:authorize>
<security:authorize access="hasRole('CLIENT')">
    <input type="button" value="My current projects" onclick="window.location.href='/myCurrentProjects'">
    <input type="button" value="My completed projects" onclick="window.location.href='/myCompletedProjects'">
</security:authorize>
<br>
<security:authorize access="hasAnyRole('ADMIN','DEVELOPER','MANAGER','CLIENT')">
    <input type="button" value="My Page" onclick="window.location.href='/myAccPage'">
    <br><br>
    <input type="button" value="Quit" onclick="window.location.href='/logout'">
</security:authorize>

</body>
</html>
