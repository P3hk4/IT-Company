<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Pavel
  Date: 26.08.2021
  Time: 16:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="<c:url value="/Resources/homePageStyle.css" />" type="text/css"/>
    <script type="text/javascript">

        function saveNewUser() {
            $.ajax({
                type: "POST",
                url: "/saveRegistration",
                data: $("#form").serialize(),
                dataType: "String",
                success: back(),
            });
        }

        function registration() {
            document.getElementById("loginPanel").setAttribute("style","visibility: hidden;");
            document.getElementById("registrationPanel").setAttribute("style","visibility: visible;");
        }

        function back() {
            document.getElementById("registrationPanel").setAttribute("style","visibility: hidden;");
            document.getElementById("loginPanel").setAttribute("style","visibility: visible;");
            $('#usernameForm').val(null);
            $('#passwordForm').val(null);
        }
    </script>
    <title>Домашняя страница</title>
</head></head>
<body>
<nav id="navbarPanel" class="navbar navbar-expand-lg">
    <div class="container-fluid">
        <a class="navbar-brand" id="brand" style="color: inherit">IT-Company</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" href="/" style="color: inherit">Главная страница</a>
                </li>
                <security:authorize access="hasRole('DEVELOPER')">
                    <li class="nav-item">
                        <a class="nav-link active" href="/myWorkProjects" style="color: inherit">Рабочие проекты</a>
                    </li>
                </security:authorize>
                <security:authorize access="hasAnyRole('ADMIN','MANAGER')">
                    <li class="nav-item">
                    <div class="dropdown">
                        <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
                            Пользователи
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                            <li><a class="dropdown-item" href="/allAccounts">Все пользователи</a></li>
                            <li><a class="dropdown-item" href="/allEmployees">Все сотрудники</a></li>
                            <li><a class="dropdown-item" href="/allClients">Все клиенты</a></li>
                        </ul>

                    </div>
        </li>
                    <li class="nav-item">
                    <div class="dropdown">
                        <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownProjectsMenu" data-bs-toggle="dropdown" aria-expanded="false">
                            Проекты
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="dropdownProjectsMenu">
                            <li><a class="dropdown-item" href="/projectsInProgress">Проекты в работе</a></li>
                            <li><a class="dropdown-item" href="/projectsUnpaid">Проекты ожидающие оплаты</a></li>
                            <li><a class="dropdown-item" href="/projectsWithoutDevelopers">Оплаченные проекты без разработчиков</a></li>
                            <li><a class="dropdown-item" href="/projectsCompleted">Завершённые проекты</a></li>
                        </ul>
                    </div>
                </li>
                </security:authorize>
                <li class="nav-item" style="position: fixed; right:10px">
                    <div class="dropdown">
                        <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMyPageLink" data-bs-toggle="dropdown" aria-expanded="false">
                            Моя страница
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                            <li><a class="dropdown-item" href="/myPage">Моя страница</a></li>
                            <li><a class="dropdown-item" href="/logout">Выйти</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>

<security:authorize access="hasAnyRole('ADMIN','MANAGER')">
    <div class="container" id="managerButtonsContainer">
        <input type="button" id="submitProjectButton" value="Проекты в разработке" onclick="window.location.href='/projectsInProgress'"/>
        <input type="button" id="setDeveloperButton" value="Назначить разработчика" onclick="window.location.href='/projectsWithoutDevelopers'"/>
    </div>
</security:authorize>


<security:authorize access="hasRole('ANONYMOUS')">
    <div id="loginPanel" class="container-fluid">
        <button id="loginButton" type="button" class="btn btn-light" onclick="window.location.href='/login'">Войти</button>
        <button id="registrationButton" type="button" class="btn btn-light" onclick="registration()">Регистрация</button>
    </div>
    <form:form modelAttribute="User" id="form">
        <div id="registrationPanel" class="container-fluid" style="visibility: hidden">
            <div class="container" id="usernameHolder">
                <label for="usernameForm">Username:</label>
                <form:input path="username" id="usernameForm" maxlength="40" placeholder="username"/>
            </div>
            <div class="container" id="passwordHolder">
                <label for="passwordForm">Password:</label>
                <form:password path="password" id="passwordForm" maxlength="40" placeholder="password"/>
            </div>
            <button id="backButton" type="button" class="btn btn-light" onclick="back()">Назад</button>
            <button id="saveButton" type="button" class="btn btn-light" onclick="saveNewUser()">Сохранить</button>
        </div>
    </form:form>
</security:authorize>
<security:authorize access="hasAnyRole('CLIENT')">
    <div class="container-fluid" id="mainClientContainer">
        <p id="mainClientInfoMessage">Разработка информационных продуктов любой сложности</p>
        <p id="secondClientInfoMessage">Индивидуальный подход к каждой задаче</p>
         <input type="button" value="Заказать проект" id="createOrderButton" onclick="window.location.href='/createProject'"/>
         <input type="button" value="Мои проекты" id="myProjectsButton" onclick="window.location.href='/myProjects'"/>
    </div>


</security:authorize>
</body>
</html>
