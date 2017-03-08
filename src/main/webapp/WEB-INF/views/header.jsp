<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>${requestScope.title}</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="<c:url value="/static/bootstrap/css/mystyle.css"/>">
    <%--<link rel="stylesheet" href="<c:url value="/static/bootstrap/css/bootstrap.css"/>">--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="static/bootstrap/js/signin/signin.js"></script>
<jsp:include page="login.jsp"/>

</head>
<body>

<nav class="navbar navbar-inverse">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle mybar" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/restaurant">Balaba Restaurant</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">Home</a></li>
                <li><a href="#">About</a></li>
                <li><a href="#">Contact</a></li>
                    <c:choose>
                        <c:when test="${listItem.size() > 0}">
                            <li class="dropdown">
                                <a id="drop1" href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    Меню
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <c:forEach items="${listItem}" var="menu">
                                        <li><a href="#">${menu}</a></li>
                                    </c:forEach>

                                </ul>
                            </li>
                        </c:when>
                    </c:choose>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <c:choose>
                    <c:when test="${sessionScope.client != null}">
                        <li>
                            <a href="${s:mvcUrl("getProfile").build()}">
                                ${sessionScope.client.getFio()}
                            </a>
                        </li>
                        <li>
                            <a href="${s:mvcUrl("getLogout").build()}">
                                <span class="glyphicon glyphicon-log-out" id="logout"></span>
                                Log out
                            </a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li>
                            <a href="#" data-toggle="modal" data-target="#login-modal">
                                <span class="glyphicon glyphicon-log-in"></span>
                                Login
                            </a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
            <ul class="navbar-nav navbar-right">
                <li id="trash">
                    <a href="#" data-toggle="modal" data-target="#login-modal">
                        <span class="glyphicon glyphicon-cutlery"></span>
                        Trash
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>


