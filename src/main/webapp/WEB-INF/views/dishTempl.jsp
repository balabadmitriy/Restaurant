<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<jsp:include page="header.jsp"/>
<div class="container">
    <div class="row" >
        <div class="page-header">
            <h1>${topMenu}</h1>
        </div>
        <c:forEach items="${dishes}" var="dish">
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="thumbnail">
                    <img src="<c:url value="${dish.getImg()}"/> " alt="...">
                    <div class="caption">
                        <h3>${dish.getName()}</h3>
                        <p><h4>${dish.getPrice()} грн.</h4></p>
                        <p>${dish.getComposition()}</p>
                        <p>
                            <%--<a href="#" class="btn btn-success" role="button">Добавить в коорзину</a> <a href="#" class="btn btn-default" role="button">Button</a>--%>
                            <%--<input type="button" class="btn btn-default btn-success" value="Добавить в коорзину">--%>
                                    <c:choose>
                                        <c:when test="${(sessionScope.get('sessionReq') == null) || (sessionScope.sessionReq.contains(dish.getId().toString())) != true}">
                                            <c:choose>
                                                <c:when test="${sessionScope.get('client') == null}">
                                                    <input id="${dish.getId()}" type="button" data-toggle="modal" data-target="#login-modal" class="btn btn-success" value="Добавить в коорзину">
                                                </c:when>
                                                <c:otherwise>
                                                    <input id="${dish.getId()}" type="button" class="addBags btn btn-success" value="Добавить в коорзину">
                                                </c:otherwise>
                                            </c:choose>
                                        </c:when>
                                        <c:when test="${sessionScope.sessionReq.contains(dish.getId().toString()) == true}">
                                            <input id="${dish.getId()}" type="button" class="addBags btn" value="Убрать из коорзины">
                                        </c:when>
                                    </c:choose>
                        </p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

</div>