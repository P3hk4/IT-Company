<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Pavel
  Date: 06.08.2021
  Time: 17:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>PROJECT IN PROGRESS</title>
</head>
<body>
<br><br>
<h1>Projects in progress</h1>
<br><br>
<table>
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
        <c:url var="releaseButton" value="/releaseProject">
            <c:param name="projectId" value="${project.id}"/>
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
        <td><input type="button" value="RELEASE" onclick="window.location.href='${releaseButton}'"></td>
    </tr>
</c:forEach>
    <br><br>
</table>
<input type="button" value="Back" onclick="window.location.href='/catalog'"/>
</body>
</html>
