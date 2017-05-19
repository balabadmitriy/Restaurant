    function SendData(id){
        var tmp = "#"+id+"select";
        var statusText = $(tmp+' option:selected').text();
        $.ajax({
            url:'processingOrder',
            data:JSON.stringify({status:statusText,
                id:id}),
            type:'POST',
            contentType:'application/json;charset=UTF-8',
            error:function () {
                console.log("Error добавления статус к ордеру")
            }
        });
    }

    function SendToPay() {
        $.ajax({
            url:'sendToPayOrder',
            data:JSON.stringify({pay:"555"}),
            type:'POST',
            contentType:'application/json;charset=UTF-8',
            error:function () {
                console.log("Error добавления статус к ордеру")
            }
        });
    }
