<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<jsp:include page="header.jsp"/>

<div class="container">
    <h2>Basic Table</h2>
    <p>The .table class adds basic styling (light padding and only horizontal dividers) to a table:</p>
    <table class="table">
        <thead>
        <tr>
            <th>Название меню</th>
            <th>
                <button class="btn btn-default input-sm glyphicon glyphicon-plus" onclick="addField()"></button>
            </th>
        </tr>
        </thead>
        <tbody id="addItemMenu">
        <tr id="listMy">
            <td>
                <input type="text" class="form-control" name="nameMenu" id="text">
            </td>
            <td>

                <div class="radio">
                    <label><input type="radio" name="optradio0" value="CLIENT">Меню клиента</label>
                </div>
                <div class="radio">
                    <label><input type="radio" name="optradio0" value="ADMINISTRATOR">Меню администратора</label>
                </div>

            </td>
        </tr>
        </tbody>
    </table>
    <%--<table id="table">
        <tbody>
        <tr>
            <td>
                <div>cell 1</div>
            </td>
            <td>
                <div>cell 2</div>
            </td>
        </tr>
        <tr>
            <td>cell 3</td>
            <td>cell 4</td>
        </tr>
        </tbody>
    </table>--%>
    <button type="button" class="btn btn-success" onclick="addTitleMenu()">Добавить меню</button>
</div>

