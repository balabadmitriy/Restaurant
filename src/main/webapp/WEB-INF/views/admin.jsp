<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<jsp:include page="header.jsp"/>
<script src="<c:url value="/static/bootstrap/js/order/orders.js" />"></script>
<div class="container">
    <div class="row" >
        <div class="page-header">
            <h1>Заказы</h1>
        </div>

        <div class="panel-group" id="collapse-group">
            <c:forEach items="${orderMap}" var="entry">
            <div class="panel panel-default">
                <div class="panel-heading" style="padding: 20px 15px">
                    <div style="float: left">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#collapse-group" href="#${entry.key.getId()}">${entry.key.getDateOrder()}</a>
                        </h4>
                    </div>
                    <div style="float: right; position: relative">
                        <input hidden name="id" value="${menu.getId()}"/>
                        <select id="${entry.key.getId()}select">
                            <option></option>
                            <c:forEach items="${status}" var="stat">
                                    <c:choose>
                                        <c:when test="${entry.key.getStatusOrder() != null}">
                                            <c:if test="${entry.key.getStatusOrder().getName() == stat.getName()}">
                                                <option selected>${stat.getName()}</option>
                                            </c:if>
                                            <c:if test="${entry.key.getStatusOrder().getName() != stat.getName()}">
                                                <option>${stat.getName()}</option>
                                            </c:if>
                                        </c:when>
                                        <c:otherwise>
                                            <option>${stat.getName()}</option>
                                        </c:otherwise>
                                    </c:choose>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div id="${entry.key.getId()}" class="panel-collapse collapse">
                    <c:forEach items="${entry.value}" var="dish">
                       <div class="panel-body">
                             <img src="<c:url value="${dish.getImg()}"/> " style="width: 100px; height: 100px">
                             ${dish.getName()}
                             ${dish.getPrice()}
                       </div>
                    </c:forEach>
                    <input type="button" class="btn btn-success" value="Обработка заказа" onclick="SendData(${entry.key.getId()})">
                </div>
            </div>
        </c:forEach>
        </div>
    </div>
</div>
