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
                <label>Управление меню</label>
            </th>
        </tr>
        </thead>
        <tbody id="addItemMenu">
        <tr id="listMy">
            <td>
                <div class="radio">
                    <label  type="text" class="form-control" name="nameMenu" id="text"></label>
                </div>
            </td>
            <td>
                <div class="radio">
                    <button class="btn btn-default input-sm glyphicon glyphicon-minus" onclick="addField()"></button>
                </div>

            </td>
        </tr>
        </tbody>
    </table>
    </table>--%>
    <button type="button" class="btn btn-success" onclick="addTitleMenu()">Добавить меню</button>
</div>
