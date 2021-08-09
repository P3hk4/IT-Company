<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Pavel
  Date: 08.08.2021
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>UNPAID PROJECTS</title>
</head>
<body>
<br><br>
<h1>Unpaid projects</h1>
<br><br>
<table>
    <tr>
        <th><h4>ID</h4></th>
        <th><h4>CUSTOMER</h4></th>
        <th><h4>NAME</h4></th>
        <th><h4>PAYED</h4></th>
        <th><h4>OPERATIONS</h4></th>
    </tr>
<c:forEach var="project" items="${projects}">
    <c:url var="deleteButton" value="/deleteProject">
        <c:param name="id" value="${project.id}"/>
    </c:url>
    <TR>
        <td>${project.id}</td>
        <td>${project.customer}</td>
        <td>${project.name}</td>
        <td>${project.payed}</td>
        <td><input type="button" value="DELETE" onclick="window.location.href='${deleteButton}'"></td>
    </TR>
</c:forEach>
</table>
<br><br>
<input type="button" value="Back" onclick="window.location.href='/catalog'">
</body>
</html>
