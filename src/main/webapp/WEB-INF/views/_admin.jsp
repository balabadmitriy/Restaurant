<%@ taglib prefix="ng" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="header.jsp"/>

<div class="container" ng-app>
    <!-- контроллер CartForm -->
    <div ng:controller="CartForm">
        <div class="row">
            <form novalidate id="cartform" name="cartform">
                <!-- table-responsive: на маленьких разрешениях у корзины появится полоса прокрутки и вся страница не будет растянута -->
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>Товар</th>
                            <th>Фото</th>
                            <th>Количество и комментарии</th>
                            <th>Цена</th>
                            <th>Сумма</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                       <%-- <--
                        1) вывод товаров (item) из корзины (items)
                        2) условие: если заказываемое кол-во товара равно 0, то он считается удаляемым и помечается полупрозрачной строкой
                        -->--%>
                        <tr ng:repeat="item in items" ng-class="{opacity50: item.quantity < 1}">
                            <td>
                                <!-- вывод название товара, ссылки на его страницу и "хлебных крошек" разделов до его страницы -->
                                <p><a href="{{item.detail_url}}">{{item.name}}</a></p>
                               <%-- <ol class="breadcrumb">
                                    <li ng:repeat="sect in item.nav">
                                        <a href="{{sect.url}}">{{sect.name}}</a>
                                    </li>
                                </ol>--%>
                            </td>
                            <td class="carousel-extended">
                                <!-- ng-show: картинка будет показана только если она задана в модели товара -->
                                <a href="{{item.picture_url}}" ng-show="item.picture_url" class="thumbnail image-detail">
                                    <img src="{{item.icon_url}}" width="50" height="50" alt="{{item.name}}">
                                </a>
                            </td>
                            <td>
                                <div class="row">
                                    <div class="form-group col-xs-8" ng-class="{'has-error': cartform.quantity[{{item.id}}].$invalid}">
                                        <%--<-- для элемента формы задаются правила валидации -->--%>
                                        <input type="text" name="quantity[{{item.id}}]" ng:model="item.quantity" ng:required ng:pattern="/^\d+$/" min="0" class="form-control input-sm">
                                    </div>
                                    <!-- ng-click: уменьшение/увеличение заказываемого кол-ва -->
                                    <button ng-click="minus($index)" class="btn btn-default input-sm glyphicon glyphicon-minus"></button>
                                    <button ng-click="plus($index)" class="btn btn-default input-sm glyphicon glyphicon-plus"></button>
                                </div>
                                <textarea ng:ng:model="item.info" class="form-control input-sm"></textarea>
                            </td>
                            <td>{{item.price}}</td>
                            <td>{{item.quantity * item.price}}</td>
                            <td><a href data-toggle="tooltip" title="пометить для удаления" data-placement="left" class="pointer helptip glyphicon glyphicon-remove text-danger" ng:click="removeItem($index, item.id)"></a></td>
                        </tr>
                        </tbody>
                        <tfoot>
                        <tr>
                            <td colspan="2">
                                <%--<-- ng-show="cartproc": полоса прогресса будет показана пока установлен флаг cartproc (пока выполняется ajax-запрос) -->--%>
                                <div ng-show="cartproc" class="progress progress-striped active">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%"></div>
                                </div>
                            </td>
                            <%--<-- ng-switch: в зависимости от результатов валидации будет показана либо активная, либо не активная кнопка -->--%>
                            <td ng-switch="cartform.$dirty && cartform.$valid && !cartproc && has_items()">
                                <button ng-switch-when="true" ng-click="save()" class="btn btn-success btn-xs pull-right">Сохранить изменения</button>
                                <button ng-switch-default class="btn btn-success btn-xs pull-right" disabled>Сохранить изменения</button>
                            </td>
                            <td>Итого:</td>
                            <!-- вывод итоговой суммы с применением форматирования -->
                            <td><strong><p class="text-primary">{{total() | currency:""}}</p></strong></td>
                            <td></td>
                        </tr>
                        </tfoot>
                    </table>
                </div>
            </form>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>