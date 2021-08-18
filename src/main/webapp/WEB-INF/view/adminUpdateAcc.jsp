<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Pavel
  Date: 02.08.2021
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Account</title>
</head>
<body>
<br><br>
<form:form modelAttribute="acc" action="/saveAdminUpdate">
    <c:url value="/back" var="backButton">
        <c:param name="auth" value="${acc.authority}"/>
    </c:url>
<h1>Update ${acc.username}'s account </h1>
<br><br>
    <form:hidden path="username"/>
    <h4>ENABLED: ON<form:radiobutton path="enabled" value="1"/> OFF<form:radiobutton path="enabled" value="0"/></h4>
    <h4>NAME:<form:input path="name"/></h4>
    <h4>SURNAME:<form:input path="surname"/></h4>
    <h4>SALARY:<form:input path="salary"/></h4>
    <form:hidden path="authority"/>
    <h4>POST:   <br>
        CLIENT<form:radiobutton path="post" value="Client"/>
        FRONT-END DEVELOPER<form:radiobutton path="post" value="Front-end developer"/>
        BACK-END DEVELOPER<form:radiobutton path="post" value="Back-end developer"/>
        OPERATIONS MANAGER<form:radiobutton path="post" value="Operations manager"/>
        ADMINISTRATOR<form:radiobutton path="post" value="Administrator"/>
    </h4>
    <br><br>
    <input type="submit" value="Save"/>
    <br><br>
    <input type="button" value="Back" onclick="window.location.href='${backButton}'">
</form:form>

</body>
</html>
