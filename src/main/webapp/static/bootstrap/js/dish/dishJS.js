$(document).ready(function () {

    var arrBags;
    var paymentText;

    if($('.getSession').val() !== "[]" && (typeof $('.getSession').val() !== 'undefined'))
    {
        arrBags = substrMy($('.getSession').attr('value')).split(',');
        Bag.count = arrBags.length;
    }else {
        arrBags=new Array();
        Bag.count = 0;
        $('.badge').text('');
    }

    $('.addBags').click(function () {
        $(this).toggleClass('btn-success');
        if (!($(this).hasClass('btn-success'))) {
            arrBags.push($(this).attr('id'));
            $('.badge').text(EqualsBag(Bag(true)));
            $(this).val("Убрать из коорзины");
        }else
        {
            var index = indexOf(arrBags,$(this).attr('id'));

            arrBags.splice(index,1);
            // alert(arrBags);
            $('.badge').text(EqualsBag(Bag(false)));
            $(this).val("Добавить в коорзину");
        }
        var paymentText = $('select option:selected').text();
        setSessionBag(arrBags.toString(),paymentText,"0");
    });

    $('.paymentSelect').change(function () {
        paymentText = $('select option:selected').text();
        try{
            if (paymentText !== "")
            {
                $('.addOrderBTN').removeAttr('disabled','disable');
                $('.addOrderBTN').attr('href',"order");
                $('#setSessionDel').attr('value','${sessionScope.del = "1"}')
                setSessionBag(arrBags.toString(),paymentText,"1");
            }else{

                $('.addOrderBTN').attr('disabled','disable');
                $('.addOrderBTN').attr('href','javascript:void(0)');
                throw "Укажите каким способом будет произведенна оплата";
            }
        }catch (err){
            console.log(err);

        }

    });
});

function substrMy(str) {
    tmp = str.substr(1,str.length);
    tmp = tmp.substr(0,tmp.length-1);
    return tmp;
}
function indexOf(arr,id) {
    for(var i = 0; i < arr.length; i++){
        if(Number(arr[i]) === Number(id)){
            return i;
        }
    }
}

function Increase() {
    $.ajax({
        url:'increase',
        data:({increase:$('#increase').val()}),
        success:function (data) {
            $('#sum').html(data);
        }
    });
}
function deleteDish(id){
    ses = substrMy($('.getSession').val().toString()).split(',');
    $('tr').remove('#'+id);
    $('.badge').text(EqualsBag(Bag(false)));
    var index = indexOf(ses,id);
    ses.splice(index,1);
    var paymentText = $('select option:selected').text();
    setSessionBag(ses.toString(),paymentText,"0");
    if(ses.length == 0) {
        $('tbody').append("<div class='jumbotron'><h1>Корзина пуста</h1></div>");
        $('.button-order').hide();
    }
    $('.getSession').val("["+ses+"]");
}

function EqualsBag(trash) {
    if (trash === 0)
        return "";
    else return trash;
}
function Bag(bool) {
    if (bool)
        return ++Bag.count;
    else
        return --Bag.count;
}


function setSessionBag(v,p,d) {
    $.ajax({
        url:'setSessionBag',
        data:{sessionReq:v,
                payment:p,
                del:d},
        type:'POST',
        /*success:function (result) {
            alert("66666666");
        },
        error:function () {
            alert("111111111");
        }*/
    });
}


function ClearBags(){

}

function addDishToTrash() {
    $.ajax({
        url:'getDish',
        data:JSON.stringify({'id':id_dish}),
        type:'GET',
        contentType: 'application/json; charset=utf-8',
        success:function (result) {
            alert("66666666");
        },
        error:function () {
            alert("111111111");
        }
    });
}

function addToTrash(id_dish) {
    $.ajax({
        url:'getDish',
        data:JSON.stringify({'id':id_dish}),
        type:'GET',
        contentType: 'application/json; charset=utf-8',
        success:function (result) {
            alert("66666666");
        },
        error:function () {
            alert("111111111");
        }
    });
}

