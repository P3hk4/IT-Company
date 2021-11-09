<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Pavel
  Date: 18.10.2021
  Time: 21:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="<c:url value="/Resources/editAccountStyle.css" />" type="text/css"/>
    <title>Настроить аккаунт</title>
</head>
<body>
<nav id="navbarPanel" class="navbar navbar-expand-lg">
    <div class="container-fluid">
        <a class="navbar-brand" id="brand" style="color: inherit">IT-Company</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" href="/" style="color: inherit">Главная страница</a>
                </li>
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
<div class="container" id="editAccountContainer">
    <form:form modelAttribute="account" id="accountForm" action="/saveEditAccount">
        <div class="container" id="titleContainer">
        <p><strong> Логин:  </strong></p>
        <p><strong> Статус: </strong></p>
        <p><strong> Роль:   </strong></p>
            <br>
        <p><strong> Имя:    </strong></p>
        <p><strong> Фамилия:    </strong></p>
        <p><strong> Должность:  </strong></p>
            <br>
        <p><strong> Зарплата:   </strong></p>
        </div>
        <div class="container" id="infoContainer">
            <p><strong>${account.username}</strong><form:hidden path="username"/></p>
            <p>
            <form:radiobutton path="enabled" value="1" label="Активен"/>&nbsp;
            <form:radiobutton path="enabled" value="0" label="Неактивен"/>
            </p>
            <p>
             <form:radiobutton path="authority" value="ROLE_ADMIN" label="Администратор"/>&nbsp;
             <form:radiobutton path="authority" value="ROLE_CLIENT" label="Клиент"/>
             <br>
             <form:radiobutton path="authority" value="ROLE_DEVELOPER" label="Разработчик"/>&nbsp;
             <form:radiobutton path="authority" value="ROLE_MANAGER" label="Менеджер"/>
            </p>
            <p><form:input path="name"/></p>
            <p><form:input path="surname"/></p>
            <p>
            <form:radiobutton path="post" value="Administrator" label="Администратор"/>
            <form:radiobutton path="post" value="Client" label="Клиент"/>
            <form:radiobutton path="post" value="Manager" label="Менеджер"/>
            </p>
            <p>
            <form:radiobutton path="post" value="Front-end developer" label="Front-end разработчик"/>
            <form:radiobutton path="post" value="Back-end developer" label="Back-end разработчик"/>

            </p>
            <p><form:input path="salary"/></p>
        </div>
<p>
    <input type="button" id="backButton" value="Назад" onclick="window.location.href='/allAccounts'">
    <input type="submit" id="saveButton" value="Сохранить">
</p>
    </form:form>
</div>
</body>
</html>
