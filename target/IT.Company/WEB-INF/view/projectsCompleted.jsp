<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Pavel
  Date: 08.08.2021
  Time: 22:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>COMPLETED PROJECTS</title>
</head>
<body>
<table border="2" cellpadding="5" cellspacing="1">
    <caption><h1>COMPLETED PROJECTS</h1></caption>
    <br>
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
        <th><h4>OPERATIONS</h4></th>
    </tr>
    <c:forEach var="project" items="${projects}">
        <c:url var="deleteButton" value="/deleteProject">
            <c:param name="projectId" value="${project.id}"/>
            <c:param name="button" value="projectsCompleted"/>
        </c:url>
        <tr>
            <td>${project.id}</td>
            <td>${project.customer}</td>
            <td>${project.name}</td>
            <td>${project.frontendStatus}</td>
            <td>${project.backendStatus}</td>
            <td>${project.frontendDeveloper}</td>
            <td>${project.backendDeveloper}</td>
            <td>${project.completed}</td>
            <td>${project.payed}</td>
            <td>
                <input type="button" value="DELETE" onclick="window.location.href='${deleteButton}'"/>
            </td>
        </tr>
    </c:forEach>
</table>
<br><br>
<input type="button" value="Back" onclick="window.location.href='/catalog'">
</body>
</html>
