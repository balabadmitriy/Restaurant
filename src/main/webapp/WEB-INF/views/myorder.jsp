<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<jsp:include page="header.jsp"/>
<script src="<c:url value="/static/bootstrap/js/order/orders.js" />"></script>

<div class="container">
    <div class="row" >
        <div class="page-header">
            <h1>Ваши заказы</h1>
        </div>
        <c:choose>
            <c:when test="${(orders != null)  && (orders.size() != 0)}">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <td>Позиция</td>
                        <td>Дата</td>
                        <td>Способ оплаты</td>
                        <td>Сумма</td>
                        <td>Cтатус</td>
                        <td>Оплатить</td>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="i" begin="1" end="${orders.size()}">
                        <tr>
                            <td>${i}</td>
                            <td>${orders.get(i-1).getDateOrder()}</td>
                            <td>${orders.get(i-1).getPaymentMethod().getPaymentName()}</td>
                            <td>${orders.get(i-1).getSum()}</td>
                            <td>
                                <c:if test="${orders.get(i-1).getStatusOrder().getName().equals('Ждет оплаты')}">
                                    <span class="label label-warning">${orders.get(i-1).getStatusOrder().getName()}</span>
                                </c:if>
                                <c:if test="${orders.get(i-1).getStatusOrder().getName().equals('Отправлен на кухню')}">
                                    <span class="label label-danger">${orders.get(i-1).getStatusOrder().getName()}</span>
                                </c:if>
                                <c:if test="${orders.get(i-1).getStatusOrder().getName().equals('Доставлен')}">
                                    <span class="label label-success">${orders.get(i-1).getStatusOrder().getName()}</span>
                                </c:if>
                            </td>
                            <td><input id="${orders.get(i-1).getId()}" type="checkbox" onclick="SendToPay()"/></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <div class="jumbotron">
                    <h1>Список ваших заказов пуст</h1>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

</div>