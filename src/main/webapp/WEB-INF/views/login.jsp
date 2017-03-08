<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%--${requestScope.errorMessage}--%>

<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="loginmodal-container myinput">
            <h1>Login to Your Account</h1><br>
            <form  class="form-signin">
                <span id="errorlogin"></span>
                <input type="text" name="login" id="login" class="form-control" placeholder="Login" onkeyup="cleanError()">
                <input type="password" name="password" id="password"  class="form-control"  placeholder="Password">
                <input type="button" name="signin" class="login loginmodal-submit" value="Sign in"  onclick="doAjax()">
            </form>

            <div class="login-help">
                <a href="${s:mvcUrl('getRegistration').build()}">Register</a> - <a href="#">Forgot Password</a>
            </div>
        </div>
    </div>
</div>



