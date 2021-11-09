<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Pavel
  Date: 24.10.2021
  Time: 19:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="<c:url value="/Resources/projectsStyle.css" />" type="text/css"/>
    <title>${type}</title>
    <script type="text/javascript">

        function buttonHider() {
            let type = "${type}";
            if (type == "Все проекты без разработчиков"){
                $(".setDeveloperButton").attr("style","visibility: visible;");
            } else if (type == "Все проекты в разработке"){
                $(".submitProjectButton").attr("style","visibility: visible;");
            }
        };

        window.onload = buttonHider;

        function submitProject(id, frontendStatus, backendStatus) {
            if (frontendStatus == "true" && backendStatus == "true"){
                $.ajax({
                    type: "POST",
                    url: "/submitProject",
                    data: {id: id},
                    success: setTimeout(function rel(){location.reload()}, 80)
                });
            } else alert("Разработка проекта еще не завершена!");
        }

        function deleteProject(id) {
            $.ajax({
                type: "POST",
                url: "/deleteProject",
                data: {id: id},
                success: setTimeout(function rel(){location.reload()}, 80)
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
<table class="table" id="allProjectsContainer">
    <thead class="thead-light" id="projectsHeadContainer">
    <div id="pageNameContainer" class="fluid-container">${type}
    </div>
    <tr>
        <td>Id</td>
        <td>Логин заказчика</td>
        <td>Имя</td>
        <td>Front-end статус</td>
        <td>Back-end статус</td>
        <td>Front-end разработчик</td>
        <td>Back-end разработчик</td>
        <td>Завершён</td>
        <td>Оплачен</td>
        <td>Функции</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="project" items="${projects}">
        <c:url var="setFrontendDeveloper" value="/setFrontendDeveloper">
            <c:param name="id" value="${project.id}"/>
        </c:url>
        <c:url var="setBackendDeveloper" value="/setBackendDeveloper">
            <c:param name="id" value="${project.id}"/>
        </c:url>
        <tr id="projectsInfoContainer">
            <td>${project.id}</td>
            <td>${project.customer}</td>
            <td>${project.name}</td>
            <td>${project.frontendStatus}</td>
            <td>${project.backendStatus}</td>
            <td>${project.frontendDeveloper}
                <input class="setDeveloperButton" type="button" value="Назначить" onclick="window.location.href='${setFrontendDeveloper}'"/>
            </td>
            <td>${project.backendDeveloper}
                <input class="setDeveloperButton" type="button" value="Назначить" onclick="window.location.href='${setBackendDeveloper}'"/>
            </td>
            <td>${project.completed}</td>
            <td>${project.payed}</td>
            <td>
                <input type="button" class="deleteProjectButton" value="Удалить" onclick="deleteProject('${project.id}')">
                <input type="button" class="submitProjectButton" value="Завершить" onclick="submitProject('${project.id}','${project.frontendStatus}','${project.backendStatus}')">
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
