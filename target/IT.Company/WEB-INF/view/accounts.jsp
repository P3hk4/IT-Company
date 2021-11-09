<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${type}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="<c:url value="/Resources/accountsStyle.css" />" type="text/css"/>
    <script type="text/javascript">

        function deleteAccount(username) {
            $.ajax({
                type: 'POST',
                url: 'deleteAccount',
                data: {username: username},
                dataType: 'String',
                success: setTimeout(function rel(){location.reload()}, 80),
            });
        }

    </script>
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
                <security:authorize access="hasAnyRole('ADMIN','MANAGER','DEVELOPER')">
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
<table class="table" id="allAccContainer">
    <div id="pageNameContainer" class="fluid-container">${type}
    </div>
    <thead class="thead-light" id="accountsHeadContainer">
    <tr>
        <td>Логин</td>
        <td>Статус</td>
        <td>Роль</td>
        <td>Имя</td>
        <td>Фамилия</td>
        <td>Должность</td>
        <td>Зарплата</td>
        <td>Операции</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="acc" items="${accounts}">
        <c:url value="/editAccount" var="editButton">
            <c:param name="username" value="${acc.username}"/>
        </c:url>
        <tr id="accountsInfoContainer">
            <td>${acc.username}</td>
            <td>${acc.enabled}</td>
            <td>${acc.authority}</td>
            <td>${acc.name}</td>
            <td>${acc.surname}</td>
            <td>${acc.post}</td>
            <td>${acc.salary}</td>
            <td>
                <input type="button" class="deleteButton" value="Удалить" onclick="deleteAccount('${acc.username}')">
                <input type="button" class="editButton" value="Редактировать" onclick="window.location.href = '${editButton}'">
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
