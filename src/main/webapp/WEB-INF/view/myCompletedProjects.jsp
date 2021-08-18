<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Pavel
  Date: 17.08.2021
  Time: 17:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>MY COMPLETED PROJECTS</title>
</head>
<body>
<br><br>
<table border="2" cellpadding="5" cellspacing="1">
    <caption><h1>My completed Projects</h1></caption>
    <tr>
        <th><h4>ID</h4></th>
        <th><h4>CUSTOMER</h4></th>
        <th><h4>NAME</h4></th>
        <th><h4>FRONT-END STATUS</h4></th>
        <th><h4>BACK-END STATUS</h4></th>
        <th><h4>PAYED</h4></th>
        <th><h4>COMPLETED</h4></th>
    </tr>
    <c:forEach var="project" items="${myProjects}">
        <tr>
            <td>${project.id}</td>
            <td>${project.customer}</td>
            <td>${project.name}</td>
            <td>${project.frontendStatus}</td>
            <td>${project.backendStatus}</td>
            <td>${project.payed}</td>
            <td>${project.completed}</td>
        </tr>
    </c:forEach>
</table>
<br><br>
<input type="button" value="Back" onclick="window.location.href='/'">
<input type="button" value="Add order" onclick="window.location.href='/addOrder'">
</body>
</html>
