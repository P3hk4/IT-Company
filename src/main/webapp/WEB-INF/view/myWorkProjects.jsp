<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Pavel
  Date: 06.11.2021
  Time: 19:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="<c:url value="/Resources/myWorkProjects.css" />" type="text/css"/>
    <title>Рабочие проекты</title>
    <script type="text/javascript">

        function saveMyProjectWork(projectId) {
            $.ajax({
                type: "POST",
                url: "saveMyProjectWork",
                data: {projectId: projectId},
                success: setTimeout(function rel() {
                    location.reload()
                }, 80)
            })
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
                <li class="nav-item">
                    <a class="nav-link active" href="/myWorkProjects" style="color: inherit">Рабочие проекты</a>
                </li>
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
    <tr>
        <td>Id</td>
        <td>Имя</td>
        <td>Front-end статус</td>
        <td>Back-end статус</td>
        <td>Функции</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="project" items="${projects}">
        <tr id="projectsInfoContainer">
            <td>${project.id}</td>
            <td>${project.name}</td>
            <td>${project.frontendStatus}</td>
            <td>${project.backendStatus}</td>
            <td>
                <input type="submit" class="submitButton" value="Сдать проект" onclick="saveMyProjectWork('${project.id}')">
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
