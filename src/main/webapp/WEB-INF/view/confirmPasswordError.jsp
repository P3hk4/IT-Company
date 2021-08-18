<%--
  Created by IntelliJ IDEA.
  User: Pavel
  Date: 16.08.2021
  Time: 17:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CONFIRM PASSWORD ERROR</title>
</head>
<body>
<br><br>
<h1>Sorry, you have entered the wrong password, try again!</h1>
<br><br>
<input type="text" value="${username}" hidden/>
<input type="button" value="Back" onclick="window.location.href='/myAccPage'">
<input type="button" value="Again" onclick="window.location.href='/changePassword'">
</body>
</html>
