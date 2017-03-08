<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
<link rel="stylesheet" href="<c:url value="/static/bootstrap/css/registration.css"/>">
--%>

<jsp:include page="header.jsp"/><h3 class="text-danger">${requestScope.errorMessage}</h3>
<div class="container">
    <sf:form modelAttribute="client" cssClass="form-signin" action="${formHandler}">
        <h2 class="form-signin-heading">Registration</h2>
        <div>
            <label for="fio" class="text-muted"><s:message code="reg.username"/></label>
            <sf:input type="text" cssClass="form-control" path="fio"/>
            <sf:errors path="fio" cssClass="error"/>
        </div>

        <div>
            <label for="login" class="text-muted"><s:message code="reg.login"/></label>
            <sf:input type="text" cssClass="form-control" path="login"/>
            <sf:errors path="login" cssClass="error"/>
        </div>

        <div>
            <label for="password" class="text-muted"><s:message code="reg.password"/></label>
            <sf:input path="password" type="password" cssClass="form-control"/>
            <sf:errors path="password" cssClass="error"/>
        </div>

        <div>
            <label for="emailClient" class="text-muted"><s:message code="reg.emailClient"/></label>
            <sf:input path="emailClient" cssClass="form-control"/>
            <sf:errors path="emailClient" cssClass="error"/>
        </div>

        <div>
            <label for="phoneClient" class="text-muted"><s:message code="reg.phoneClient"/></label>
            <sf:input path="phoneClient" cssClass="form-control"/>
            <sf:errors path="phoneClient" cssClass="error"/>
        </div>

        <div>
            <button class="btn btn-lg btn-primary btn-block" type="submit"><s:message code="reg.submit"/></button>
        </div>
    </sf:form>
</div>
<jsp:include page="footer.jsp"/>