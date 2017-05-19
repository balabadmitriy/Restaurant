<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>${requestScope.title}</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">--%>
    <link rel="stylesheet" href="<c:url value="/static/bootstrap/css/bootstrap.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/static/bootstrap/css/mystyle.css"/>">
    <%--<link rel="stylesheet" href="<c:url value="/static/bootstrap/css/bootstrap.css"/>">--%>
    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>--%>
    <%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>--%>
    <script src="<c:url value="/static/bootstrap/js/jquery.min.js" />"></script>
    <script src="<c:url value="/static/bootstrap/js/bootstrap.js" />"></script>
    <script src="<c:url value="/static/bootstrap/js/signin/signin.js"/>"></script>
    <script src="<c:url value="/static/bootstrap/js/dish/dishJS.js"/>"></script>
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
                <li class="active"><a href="#">Главная</a></li>
                <li><a href="#">О нас</a></li>
                <li><a href="#">Контакты</a></li>
                    <c:choose>
                        <c:when test="${listItem.size() > 0}">
                            <li class="dropdown">
                                <a id="drop1" href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    Меню
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <c:forEach items="${listItem}" var="menu">
                                        <li>
                                            <form:form action="${s:mvcUrl('getDish').build()}" method="GET">
                                                <input hidden name="id" value="${menu.getId()}"/>
                                                <input hidden name="name" value="${menu.getName()}"/>
                                                <input type="submit" class="as btn btn-link" value="${menu.getName()}">
                                            </form:form>
                                        </li>
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
                            <a href="${s:mvcUrl("getOrder").build()}">
                                ${sessionScope.client.getFio()}
                            </a>
                        </li>
                        <li>
                            <a href="${s:mvcUrl("getLogout").build()}">
                                <span class="glyphicon glyphicon-log-out" id="logout"></span>
                                Выйти
                            </a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li>
                            <a href="#" data-toggle="modal" data-target="#login-modal">
                                <span class="addBag glyphicon glyphicon-log-in"></span>
                                Войти
                            </a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
            <ul class="navbar-nav navbar-right">
                <li id="trash">
                    <a href="${s:mvcUrl("getBag").build()}" class="sendBags" name="arr">
                        <span class="glyphicon glyphicon-cutlery"></span>
                        Заказ
                        <span class="badge">${sessionScope.sessionReq.size()}</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>


<c:choose>
    <c:when test="${(sessionScope.get('sessionReq') != null)}">
        <input hidden class="getSession" value="${sessionScope.sessionReq}">
        <input hidden class="getSession" value="${sessionScope.payment}">
        <input hidden id="setSessionDel" class="getSession" value="${sessionScope.del}">
    </c:when>
</c:choose>