<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Pavel
  Date: 28.09.2021
  Time: 18:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="<c:url value="/Resources/myPageStyle.css" />" type="text/css"/>
    <script type="text/javascript">

        function edit() {
        $("#info-container").attr("style","visibility: hidden;");
        $("#infoEdit-container").attr("style","visibility: visible;");
        }

        function back(){
        $("#infoEdit-container").attr("style","visibility: hidden;");
        $("#info-container").attr("style","visibility: visible;");
        }

        function changePassword() {
            $("#infoEdit-container").attr("style", "visibility: hidden;");
            $("#changePassword-container").attr("style", "visibility: visible;");
        }

        function backPassword(){
            $("#changePassword-container").attr("style","visibility: hidden;");
            $("#info-container").attr("style","visibility: visible;");
            $('#checkError').attr("style","visibility: hidden;");
            $('#oldPassword').val(null);
        }

        function backNewPassword() {
            $('#newPasswordContainer').attr("style","visibility: hidden");
            $('#info-container').attr("style","visibility: visible");
            $('#newPasswordMain').val(null);
            $('#newPasswordCheck').val(null);
        }

        function checkEqualityPassword(username) {
            if ($('#newPasswordMain').val() == $('#newPasswordCheck').val()) {
                $.ajax({
                    type: "POST",
                    url: "/saveNewPassword",
                    data: ({password: $('#newPasswordMain').val(), username: username}),
                    success: backNewPassword(),
                    dataType: "String"
            });
                alert("Новый пароль сохранён!")
            } else {
                alert("Пароли не совпадают!");
            }
        }

        function deleteAccount(username){
            if (confirm("Вы действительно хотите удалить аккаунт?\n" +
                "Это действие будет невозможно отменить!")) {
                $.ajax({
                    type: "POST",
                    url: "/deleteAccount",
                    data:({username: username}),
                    dataType: "String",
                    success: document.location.href ="/logout",
                });

            }
        }


        function checkPassword(username, oldPassword) {
            $('#checkError').attr("style","visibility: hidden;");
            $.get(
                "/checkPassword",
                {username: username, oldPassword: oldPassword},
                function (data) {
                    if (data == 'true'){
                        $('#changePassword-container').attr("style","visibility: hidden");
                        $('#newPasswordContainer').attr("style","visibility: visibly");
                    } else if (data == 'false'){
                        $('#checkError').attr("style","visibility: visibly;");
                    } else {
                        console.log("ERROR");
                    }
                }
            );
            $('#oldPassword').val(null);
        }
    </script>
    <title>Моя страница</title>
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
<div class="container" id="info-container">
    <form:form modelAttribute="account" id="accountInfo">
        <p><strong>Логин:  </strong>${account.username}</p>
        <p><strong>Имя:  </strong>${account.name}</p>
        <p><strong>Фамилия:  </strong>${account.surname}</p>
        <security:authorize access="hasAnyRole('ADMIN','DEVELOPER','MANAGER')">
        <p><strong>Должность:  </strong>${account.post}</p>
        <p><strong>Зарплата:  </strong>${account.salary}</p>
        </security:authorize>
        <input id="changePasswordButton" type="button" value="Сменить пароль" onclick="changePassword('${account.username}')">
        <input id="editButton" type="button" value="Редактировать" onclick="edit()">
        <input id="backButton" type="button" value="Назад" onclick="window.location.href='/'">
        <input id="deleteAccountButton" type="button" value="Удалить аккаунт" onclick="deleteAccount('${account.username}')">
    </form:form>
</div>
<div class="container" id="infoEdit-container" style="visibility: hidden">
    <form:form modelAttribute="account" action="/saveMyEditAccount">
        <form:hidden id="usernameForm" path="username"/><form:hidden path="salary"/><form:hidden path="post"/><form:hidden path="enabled"/><form:hidden path="authority"/>
        <div id="titleContainer">
        <p><strong>Логин:  </strong></p>
        <p><strong>Имя:  </strong></p>
        <p><strong>Фамилия:  </strong></p>
            <security:authorize access="hasAnyRole('ADMIN','DEVELOPER','MANAGER')">
        <p><strong>Должность:  </strong></p>
        <p><strong>Зарплата:  </strong></p>
            </security:authorize>
        </div>
        <div id="valueContainer">
            <p>${account.username}</p>
            <p><form:input path="name"/></p>
            <p><form:input path="surname"/></p>
            <security:authorize access="hasAnyRole('ADMIN','DEVELOPER','MANAGER')">
            <p>${account.post}</p>
            <p>${account.salary}</p>
            </security:authorize>
        </div>
        <input id="backEditButton" type="button" value="Назад" onclick="back()">
        <input id="editSaveButton" type="submit" value="Сохранить">
    </form:form>
</div>
<div class="container" id="changePassword-container" style="visibility: hidden">
    <form:form modelAttribute="account" id="changePasswordForm" >
        <br><br>
    <p><strong>Введите текущий пароль:  </strong><input id="oldPassword" type="password" placeholder="пароль"></p>
        <input id="backPasswordButton" type="button" value="Назад" onclick="backPassword()">
        <input id="changePasswordSaveButton" type="button" value="Сохранить" onclick="checkPassword('${account.username}',$('#oldPassword').val())">
    </form:form>
    <p id="checkError" style="visibility: hidden">Вы ввели неверный пароль, попробуйте ещё раз!</p>
</div>
<div class="container" id="newPasswordContainer" style="visibility: hidden">
    <br><br>
    <p>Введите новый пароль: <input type="password" id="newPasswordMain" placeholder="пароль"></p>
    <p>Повторите пароль: <input type="password" id="newPasswordCheck" placeholder="повторите пароль"></p>
    <form:form modelAttribute="account">
    <input type="button" id="backNewPasswordButton" value="Назад" onclick="backNewPassword()">
    <input type="button" id="saveNewPasswordButton" value="Сохранить" onclick="checkEqualityPassword('${account.username}')">
    </form:form>
</div>
</body>
</html>
