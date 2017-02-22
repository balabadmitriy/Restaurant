<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="header.jsp"/>


${requestScope.errorMessage}

<%--<div class="container">

    <form class="form-signin" action="/login" method="POST">
        <h2 class="form-signin-heading">Please login</h2>
        <div class="input-group">
            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
            <input type="text" name="name" class="form-control" placeholder="Name">
        </div>
        <div class="input-group">
            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
            <input type="password" name="password" class="form-control" placeholder="Password">
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
    </form>

</div>--%>

<div class="vladmaxi-top">
    <a href="http://vladmaxi.net" target="_blank">Главная Vladmaxi.net</a>
    <span class="right">
        <a href="http://vladmaxi.net/web-developer/css/22-luchshix-formy-vxoda-i-registracii-na-sajte-v-html-css.html">
                <strong>Вернуться назад к статье</strong>
            </a>
        </span>
    <div class="clr"></div>
</div>
<!--/ vladmaxi top bar -->

<div id="formContainer">
    <form id="login" method="post" action="./">
        <a href="#" id="flipToRecover" class="flipLink">Забыли?</a>
        <input type="text" name="loginEmail" id="loginEmail" value="Логин" />
        <input type="password" name="loginPass" id="loginPass" value="Пароль" />
        <input type="submit" name="submit" value="ВОЙТИ" />
    </form>
    <form id="recover" method="post" action="./">
        <a href="#" id="flipToLogin" class="flipLink">Забыли пароль?</a>
        <input type="text" name="recoverEmail" id="recoverEmail" value="Email" />
        <input type="submit" name="submit" value="Восстановить" />
    </form>
</div>


<jsp:include page="footer.jsp"/>

