function doAjax() {
        $.ajax({
            url:'myjquery',
            data:({login:$('#login').val(),
                password:$('#password').val()}),
            type:'POST',
            success:function (result) {
                // var ret = jQuery.parseJSON(result);
                if (result.indexOf('no') !== 0) {
                    goToProfile(result);
                }else{
                    $('#errorlogin').html('You have error in your Login or Password');
                    $('#login').css('border', '1px solid #f90000');
                    $('#password').css('border', '1px solid #f90000');
                    console.log("--- Error return from server LoginController ----");
                }
            },
            error:function () {
                console.log("--- Error You have error in your Login or Password ----");
            }
        });
    }
function goToProfile(redirect) {
    console.log(redirect);
    $(location).attr('href',redirect);
}

function cleanError() {
    $('#errorlogin').html('');
    $('#login').css('border', '1px solid #d9d9d9');
    $('#password').css('border', '1px solid #d9d9d9');
}

function addField() {
    $("#addItemMenu").append("<tr><td><input type='text' " +
        "class='form-control' id='text'></td><td><div " +
        "class='radio'><label><input type='radio'" +
        " name='optradio'>Меню клиента</label></div>" +
        "<div class='radio'><label><input type='radio' " +
        "name='optradio'>Меню администратора</label></div></td></tr>");

}

function addTitleMenu() {
    $.ajax({
        url:'addItemMenu',
        data:({

        })
    })
}