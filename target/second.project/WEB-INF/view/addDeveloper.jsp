<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Pavel
  Date: 07.08.2021
  Time: 20:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ADD DEVELOPER</title>
</head>
<body>
<br><br>
<h1>ADD DEVELOPER</h1>
<br><br>
<table>
    <tr>
        <th><h4>USERNAME</h4></th>
        <th><h4>AUTHORITY</h4></th>
        <th><h4>ENABLED</h4></th>
        <th><h4>NAME</h4></th>
        <th><h4>SURNAME</h4></th>
        <th><h4>POST</h4></th>
        <th><h4>OPERATION</h4></th>
    </tr>
    <c:forEach var="acc" items="${accounts}">
        <c:url var="addButton" value="/saveAddDeveloper">
            <c:param name="username" value="${acc.username}"/>
            <c:param name="projectId" value="${projectId}"/>
        </c:url>
    <tr>
        <td>${acc.username}</td>
        <td>${acc.authority}</td>
        <td>${acc.enabled}</td>
        <td>${acc.name}</td>
        <td>${acc.surname}</td>
        <td>${acc.post}</td>
        <td><h4><input type="button" value="ADD" onclick="window.location.href='${addButton}'"></h4></td>
    </tr>
    </c:forEach>
</table>
</body>
</html>
