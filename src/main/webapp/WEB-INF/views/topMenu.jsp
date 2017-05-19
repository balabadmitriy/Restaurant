<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="container">
<div class="page-header">
    <h1>Топовое меню</h1>
</div>

    <c:forEach items="${items}" var="item">
        <div class="row" >
           <h2> <button type="button" class="btn btn-primary">${item.getName()}</button></h2>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="thumbnail">
                        <img src="..." alt="...">
                        <div class="caption">
                            <h3>Thumbnail label</h3>
                            <p>...</p>
                            <p><a href="#" class="btn btn-success" role="button">Добавить в коорзину</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="thumbnail">
                        <img src="..." alt="...">
                        <div class="caption">
                            <h3>Thumbnail label</h3>
                            <p>...</p>
                            <p><a href="#" class="btn btn-success" role="button">Добавить в коорзину</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="thumbnail">
                        <img src="..." alt="...">
                        <div class="caption">
                            <h3>Thumbnail label</h3>
                            <p>...</p>
                            <p><a href="#" class="btn btn-success" role="button">Добавить в коорзину</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
                        </div>
                    </div>
                </div>
        </div>
    </c:forEach>
</div>

