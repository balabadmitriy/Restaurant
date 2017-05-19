<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="container">
    <div class="page-header">
        <h1>Топовое меню</h1>
    </div>

    <c:forEach items="${items}" var="item">
        <div class="row" >
            <h2>
            <form:form action="${s:mvcUrl('getDish').build()}" method="GET">
                <input hidden name="id" value="${item.getId()}"/>
                <input hidden name="name" value="${item.getName()}"/>
                <input type="submit" class="btn btn-primary" value="${item.getName()}"/>
            </form:form>
            </h2>
            <c:forEach  begin="0" end="2" var="i">
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="thumbnail">
                        <c:choose>
                            <c:when test="${item.getDish().size() != 0}">
                                <img src="<c:url value="${item.getDish().get(i).getImg()}"/>" alt="...">
                            </c:when>
                            <c:otherwise>
                                <img src="..." alt="...">
                            </c:otherwise>
                        </c:choose>

                        <div class="caption">
                            <c:choose>
                                <c:when test="${item.getDish().size() != 0}">
                                    <h3>${item.getDish().get(i).getName()}</h3>
                                    <p><h5>${item.getDish().get(i).getPrice()} грн.</h5></p>
                                    <p>${item.getDish().get(i).getComposition()}</p>
                                </c:when>
                                <c:otherwise>
                                    <h3>...Otherwise...</h3>
                                    <p>...</p>
                                </c:otherwise>
                            </c:choose>
                            <p>
                                <%--<a href="#" class="btn btn-default btn-success" role="button" onclick="addDishToTrash()">Добавить в коорзину</a> <a href="#" class="btn btn-default" role="button">Button</a>--%>
                                <c:if test="${item.getDish().size() != 0}">
                                    <c:choose>
                                        <c:when test="${(sessionScope.get('sessionReq') == null) || (sessionScope.sessionReq.contains(item.getDish().get(i).getId().toString())) != true}">
                                            <c:choose>
                                                <c:when test="${sessionScope.get('client') == null}">
                                                    <input id="${item.getDish().get(i).getId()}" type="button" data-toggle="modal" data-target="#login-modal" class="btn btn-success" value="Добавить в коорзину">
                                                </c:when>
                                                <c:otherwise>
                                                    <input id="${item.getDish().get(i).getId()}" type="button" class="addBags btn btn-success" value="Добавить в коорзину">
                                                </c:otherwise>
                                            </c:choose>
                                        </c:when>
                                        <c:when test="${sessionScope.sessionReq.contains(item.getDish().get(i).getId().toString()) == true}">
                                            <input id="${item.getDish().get(i).getId()}" type="button" class="addBags btn" value="Убрать из коорзины">
                                        </c:when>
                                    </c:choose>
                                </c:if>

                            </p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:forEach>
</div>
