<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp"/>

<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
        <li data-target="#myCarousel" data-slide-to="3"></li>
        <li data-target="#myCarousel" data-slide-to="4"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img src="<c:url value="/static/img/top/1.jpg"/>" alt="Image">
            <div class="carousel-caption">
                <h1>Sell $</h1>
                <p>Money Money.</p>
            </div>
        </div>

        <div class="item">
            <img src="<c:url value="/static/img/top/2.jpg"/>" alt="Image">
            <div class="carousel-caption">
                <h1>More Sell $</h1>
                <p>Lorem ipsum...</p>
            </div>
        </div>

        <div class="item">
            <img src="<c:url value="/static/img/top/3.jpg"/>" alt="Image">
            <div class="carousel-caption">
                <h1>More Sell $</h1>
                <p>Lorem ipsum...</p>
            </div>
        </div>

        <div class="item">
            <img src="<c:url value="/static/img/top/4.jpg"/>" alt="Image">
            <div class="carousel-caption">
                <h1>More Sell $</h1>
                <p>Lorem ipsum...</p>
            </div>
        </div>

        <div class="item">
            <img src="<c:url value="/static/img/top/5.jpg"/>" alt="Image">
            <div class="carousel-caption">
                <h1>More Sell $</h1>
                <p>Lorem ipsum...</p>
            </div>
        </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>

<jsp:include page="dishCategoriesTempl.jsp"/>


