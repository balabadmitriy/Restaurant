<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--header--%>
<jsp:include page="header.jsp"/>


${requestScope.errorMessage}

<div class="container">

    <form class="form-signin" action="${s:mvcUrl('getLogin').build()}" method="POST">
        <h2 class="form-signin-heading">Please login</h2>
        <div class="input-group">
            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
            <input type="text" name="login" class="form-control" placeholder="Login">
        </div>
        <div class="input-group">
            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
            <input type="password" name="password" class="form-control" placeholder="Password">
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
    </form>

</div>


<jsp:include page="footer.jsp"/>
