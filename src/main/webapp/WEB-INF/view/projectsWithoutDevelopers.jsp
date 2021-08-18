<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Pavel
  Date: 06.08.2021
  Time: 21:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>PROJECTS WITHOUT DEVELOPERS</title>
</head>
<body>
<br><br>
<table border="2" cellpadding="5" cellspacing="1">
    <caption><h1>Projects without developers</h1></caption>
    <tr>
        <th><h4>ID</h4></th>
        <th><h4>CUSTOMER</h4></th>
        <th><h4>NAME</h4></th>
        <th><h4>FRONT-END STATUS</h4></th>
        <th><h4>BACK-END STATUS</h4></th>
        <th><h4>FRONT-END DEVELOPER</h4></th>
        <th><h4>BACK-END DEVELOPER</h4></th>
        <th><h4>COMPLETED</h4></th>
        <th><h4>PAYED</h4></th>
    </tr>
    <c:forEach var="project" items="${projects}">
        <c:url var="addFrontButton" value="/addDeveloper">
            <c:param name="id" value="${project.id}"/>
            <c:param name="button" value="front"/>
        </c:url>
        <c:url var="addBackButton" value="/addDeveloper">
            <c:param name="id" value="${project.id}"/>
            <c:param name="button" value="back"/>
        </c:url>
        <tr>
            <th>${project.id}</th>
            <th>${project.customer}</th>
            <th>${project.name}</th>
            <th>${project.frontendStatus}</th>
            <th>${project.backendStatus}</th>
            <th>${project.frontendDeveloper}
            <input type="button" value="ADD" onclick="window.location.href='${addFrontButton}'">
            </th>
            <th>${project.backendDeveloper}
            <input type="button" value="ADD" onclick="window.location.href='${addBackButton}'">
            </th>
            <th>${project.completed}</th>
            <th>${project.payed}</th>
        </tr>
    </c:forEach>
</table>
<br><br>
<input type="button" value="Back" onclick="window.location.href='/catalog'">
</body>
</html>
