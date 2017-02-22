<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Welcome</title>
    <jsp:include page="styles.jsp"/>
    <link href="<c:url value="/static/bootstrap/css/bootstrap.css"/>" rel="stylesheet"/>
</head>
<body>
<div class="container">
    <div class="col-md-3 col-md-offset-4">
        <a class="btn btn-primary btn-lg btn-block" href="${s:mvcUrl('getLogin').build()}">Login</a>
        <a class="btn btn-default btn-lg btn-block" href="${s:mvcUrl('getRegistration').build()}">Registration</a>
    </div>
</div>
<jsp:include page="scripts.jsp"/>
</body>
</html>
