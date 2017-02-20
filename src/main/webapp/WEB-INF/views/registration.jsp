<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Registration</title>
    <%--<jsp:include page="styles.jsp"/>--%>
</head>
<body>
<h3 class="text-danger">${requestScope.errorMessage}</h3>
<div class="container">
    <sf:form modelAttribute="client" cssClass="form-signin" action="${formHandler}">
        <h2 class="form-signin-heading">Registration</h2>
        <div>
            <label for="fio" class="text-muted">
                    <s:message code="reg.username"/>
            </label>
            <sf:input type="text" cssClass="form-control" path="fio"/>
            <sf:errors path="fio" cssClass="error"/>
        </div>

        <div>
            <label for="emailClient" class="text-muted">
                    <s:message code="reg.emailClient"/>
            </label>
            <sf:input type="text" cssClass="form-control" path="emailClient"/>
            <sf:errors path="emailClient" cssClass="error"/>
        </div>

        <div>
            <label for="password" class="text-muted">
                <s:message code="reg.password"/>
            </label>
            <sf:input path="password" cssClass="form-control"/>
            <sf:errors path="password" cssClass="error"/>
        </div>

        <div>
            <button class="btn btn-lg btn-primary btn-block" type="submit"><s:message code="reg.submit"/></button>
        </div>
    </sf:form>
</div>
<%--<jsp:include page="scripts.jsp"/>--%>
</body>
</html>
