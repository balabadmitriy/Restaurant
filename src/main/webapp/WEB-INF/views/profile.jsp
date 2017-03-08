<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp"/>


<div class="container text-center">
    <h3>What We Do</h3><br>
    <div class="row">
        <c:forEach items="${listImg}" var="img">
            <div class="col-sm-4 col-lg-4 col-md-4 col-sm-11">
                <img src="<c:url value="${img}"/>" class="img-responsive" style="width:100%" alt="Image">
                <p>JKGkjgkjkjhkjdfdsefsdfwe</p>
            </div>
        </c:forEach>
    </div>
</div>


<jsp:include page="footer.jsp"/>