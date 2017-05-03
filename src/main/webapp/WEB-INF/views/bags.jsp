<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="header.jsp"/>

<div class="container">
    <div class="row" >
        <div class="page-header">
            <h1>Ваши покупки</h1>
        </div>
            <table class="table table-striped">
                <tbody>
                <c:choose>
                    <c:when test="${bagsModel != null}">
                        <c:forEach items="${bagsModel}" var="dish">
                            <tr id="${dish.getId()}">
                                <td><img src="<c:url value="${dish.getImg()}"/> " style="width: 150px"></td>
                                <td align="left"><h3>${dish.getName()}</h3></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td><h3><input type="text" class="form-control" id="increase" name="increase" style="width: 100px" value="1" onkeyup="Increase()"></h3></td>
                                <td></td>
                                <td><h3>${dish.getPrice()}</h3></td>
                                <td><button class="btn btn-default input-sm glyphicon glyphicon-minus" onclick="deleteDish(${dish.getId()})"></button></td>
                            </tr>
                        </c:forEach>

                    </c:when>
                    <c:otherwise>
                        <div class="jumbotron">
                            <h1>Корзина пуста</h1>
                        </div>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>
        <c:if test="${sessionScope.get('sessionReq') != null}">
           <a href="javascript:void(0)" disabled="disabled" type="submit" name="addOrderBTN" class="addOrderBTN clear-btn button-order btn btn-success">Сделать заказ</a>
            <select class="paymentSelect">
                <option></option>
                <c:forEach items="${paymentsModel}" var="payment">
                    <option>${payment.getPaymentName()}</option>
                </c:forEach>
            </select>
        </c:if>
    </div>

</div>