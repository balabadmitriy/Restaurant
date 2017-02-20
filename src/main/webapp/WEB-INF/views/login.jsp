<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="header.jsp" %>

<div class="container">
    <h2>Login</h2>
    <div class="row">
        <div class="col-sm-6 col-sm-push-3">

            <sf:form modelAttribute="user" action="${formHandler}" cssClass="form-horizontal">
                <div class="panel panel-primary">
                    <div class="panel-heading">Login</div>
                    <div class="panel-body">

                        <div class="form-group">
                            <label for="login" class="col-sm-3 control-label"><s:message code="reg.login"></s:message></label>
                            <div class="col-sm-9">
                                <sf:input path="login" cssClass="form-control"/>
                            </div>
                            <sf:errors path="login" cssClass="error"/>
                        </div>

                        <div class="form-group">
                            <label for="login" class="col-sm-3 control-label"><s:message code="reg.password"></s:message></label>
                            <div class="col-sm-9">
                                <sf:password path="password" cssClass="form-control" />
                            </div>
                            <sf:errors path="password" cssClass="error"/>
                        </div>

                    </div>

                    <div class="panel-footer text-center">
                        <button type="submit" class="btn btn-primary"><s:message code="reg.submit"/></button>
                    </div>

                </div>
            </sf:form>

        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>