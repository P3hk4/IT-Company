<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Pavel
  Date: 02.08.2021
  Time: 15:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update my Account</title>
</head>
<body>
<br><br>
<h1>Update account</h1>
<br><br>
<form:form modelAttribute="myAcc" action="/saveUpdateMyAcc">
    <form:hidden path="username"/>
    <form:hidden path="enabled"/>
    <form:hidden path="authority"/>
    <form:hidden path="salary"/>
    <form:hidden path="post"/>
    <h4>NAME:<form:input path="name"/></h4>
    <h4>SURNAME:<form:input path="surname"/></h4>
    <br><br>
    <input type="submit" value="SAVE">
    <br><br>
    <input type="button" value="BACK" onclick="window.location.href='/myAccPage'">
</form:form>
</body>
</html>
