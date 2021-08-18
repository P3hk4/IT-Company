<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Pavel
  Date: 30.07.2021
  Time: 18:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All Accounts</title>
</head>
<body>
<br><br>
<table border="2" cellpadding="5" cellspacing="1">
    <caption><h1>All Accounts</h1></caption>
    <tr>
        <th><h4>USERNAME</h4></th>
        <th><h4>AUTHORITY</h4></th>
        <th><h4>ENABLED</h4></th>
        <th><h4>NAME</h4></th>
        <th><h4>SURNAME</h4></th>
        <th><h4>POST</h4></th>
        <th><h4>SALARY</h4></th>
        <th><h4>OPERATIONS</h4></th>
    </tr><c:forEach items="${accounts}" var="acc">
    <c:url var="switchButton" value="/onOffAcc">
        <c:param name="username" value="${acc.username}"/>
    </c:url>
    <c:url var="deleteButton" value="/confirmDeleteAcc">
        <c:param name="username" value="${acc.username}"/>
    </c:url>
    <c:url var="updateButton" value="/adminUpdateAcc">
        <c:param name="username" value="${acc.username}"/>
    </c:url>
    <tr>
        <td><h4>${acc.username}</h4></td>
        <td><h4>${acc.authority}</h4></td>
        <td><h4>${acc.enabled}
        <input type="button" value="SWITCH" onclick="window.location.href='${switchButton}'">
        </h4></td>
        <td><h4>${acc.name}</h4></td>
        <td><h4>${acc.surname}</h4></td>
        <td><h4>${acc.post}</h4></td>
        <td><h4>${acc.salary}</h4></td>
        <td><h4>
            <input type="button" value="UPDATE" onclick="window.location.href='${updateButton}'">
            <input type="button" value="DELETE" onclick="window.location.href='${deleteButton}'">
        </h4></td>
    </tr>
    </c:forEach>
    <br><br>
</table>


<input type="button" value="Back" onclick="window.location.href='/catalog'"/>
</body>
</html>
