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
    var inc = Article();
    var str = "name='optradio" + inc+"'";
    var varClient = 'CLIENT';
    var varAdmin = 'ADMINISTRATOR';
    $("#addItemMenu").append("<tr>" +
        "<td>" +
        "<input type='text' " +
        "class='form-control' id='text'>" +
        "</td>" +
        "<td>" +
        "<div class='radio'>" +
        "<label>" +
        "<input id='valueClient' type='radio'" +
         str +"value="+ varClient +">Меню клиента</label></div>" +
        "<div class='radio'><label><input id='valueAdmin' type='radio'" +str+" value="+ varAdmin +">Меню администратора</label></div></td></tr>");

}

function Article() {
   return Article.count++;
}
Article.count = 1;


function addTitleMenu() {
    var dataMenu = jsonMenu();
        $.ajax({
            url:'addItemMenu',
            data:dataMenu,
            type:'POST',
            contentType: 'application/json; charset=utf-8',
            error:function () {
                console.log("Error отправки данных с View admin.jsp");
            }
        });
    /*}else
    {
        alert("Не указано кому относится меню")
    }*/
}


function jsonMenu() {
    var arrNameTitle = new Array();
    var arrRole = new Array();
    var elems = document.querySelectorAll('td');

    for(var i = 0; i < elems.length; i++)
    {
        var input=elems[i].children;
        for(var j = 0; j < input.length; j++) {
            var divElem = input[j].children;
            if(divElem.length > 0){
                for(var k = 0;k<divElem.length;k++) {
                    var inp  =divElem[k].children;
                    for(var l=0;l<inp.length;l++) {
                        if (inp[l].checked) {
                            console.log(inp[l]);
                            arrRole.push(inp[l].value);
                        }
                    }
                }
            }else{
                console.log(input[j].value);
                arrNameTitle.push(input[j].value);
            }

        }
    }

    console.log(JSON.stringify({nameMenu:arrNameTitle,roleMenu:arrRole}));
    return JSON.stringify({nameMenu:arrNameTitle,roleMenu:arrRole});

}
