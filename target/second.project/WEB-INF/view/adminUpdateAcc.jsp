<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<h1>Update ${acc.username}'s account </h1>
<br><br>
    <form:hidden path="username"/>
    <h4>ENABLED: ON<form:radiobutton path="enabled" value="1"/> OFF<form:radiobutton path="enabled" value="0"/></h4>
    <h4>NAME:<form:input path="name"/></h4>
    <h4>SURNAME:<form:input path="surname"/></h4>
    <h4>SALARY:<form:input path="salary"/></h4>

    <h4>POST:   <br>
        FRONT-END DEVELOPER<form:radiobutton path="post" value="Front-end developer"/>
        BACK-END DEVELOPER<form:radiobutton path="post" value="Back-end developer"/>
        OPERATIONS MANAGER<form:radiobutton path="post" value="Operations manager"/>
    </h4>
    <h4>ROLE: <br>
    ADMIN<form:radiobutton path="authority" value="ROLE_ADMIN"/>
    EMPLOYEE<form:radiobutton path="authority" value="ROLE_EMPLOYEE"/>
    CLIENT<form:radiobutton path="authority" value="ROLE_CLIENT"/>
    </h4>
    <br><br>
    <input type="submit" value="SAVE"/>
    <br><br>
    <input type="button" value="BACK" onclick="window.location.href='/catalog'">
</form:form>

</body>
</html>
