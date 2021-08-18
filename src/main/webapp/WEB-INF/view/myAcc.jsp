<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Pavel
  Date: 31.07.2021
  Time: 22:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>MY ACCOUNT PAGE</title>
</head>
<body>
<br><br>
<h1>My Account page</h1>
<br><br>
<form:form modelAttribute="myAcc" action="/updateMyAcc">
    <c:url value="/changePassword" var="changePass">
        <c:param name="username" value="${myAcc.username}"/>
    </c:url>
    <h4>USERNAME:${myAcc.username}</h4>
    <h4>NAME:${myAcc.name}</h4>
    <h4>SURNAME:${myAcc.surname}</h4>
    <h4>POST:${myAcc.post}</h4>
    <h4>SALARY:${myAcc.salary}</h4>
    <br>
    <input type="button" value="Change password" onclick="window.location.href='${changePass}'">
    <br>
    <input type="button" value="Back" onclick="window.location.href='/'">
    <input type="button" value="Update" onclick="window.location.href='/updateMyAcc'">
</form:form>
</body>
</html>
