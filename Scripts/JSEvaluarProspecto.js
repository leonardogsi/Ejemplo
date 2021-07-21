function getUrlParameter(sParam) {
    var sPageURL = window.location.search.substring(1),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
        }
    }
};
function Salir() {

    var result = confirm("Si sale perderá la información capturada ¿Está seguro?");
    if (result == true) {
        window.location.href = "Default.aspx";
    }
}

$().ready(function () {
    // validate the comment form when it is submitted

    $("#form1").validate({
        lang: 'es', // or whatever language option you have.
        errorClass: "my-error-class",
        validClass: "my-valid-class",
        rules: {            
            cObservaciones: {
                required: true
            }
        },
        // Called when the element is invalid:
        highlight: function (element) {
            $(element).css('border-color', '#FD0808');
        },

        // Called when the element is valid:
        unhighlight: function (element) {
            $(element).css('border-color', '#ffffff');
        }, errorPlacement: function () {
            return false;  // suppresses error message text
        }
    });

    var objP = {};
    var id = getUrlParameter('id');
    objP.Id = id;
    var jsondata = JSON.stringify({ obj: objP });


    $.ajax({
        type: "POST",
        url: "EvaluarProspecto.aspx/ObtenerInformacion",
        data: "{'dataF':" + jsondata + "}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var htmlData = response.d.split('|');

            if (htmlData[0] == "true") {
                var objProspecto = JSON.parse(htmlData[1]);

                $("#cnnombre").val(objProspecto.Nombre);
                $("#cPrimerApellido").val(objProspecto.PrimerApellido);
                $("#cSegundoApellido").val(objProspecto.SegundoApellido);
                $("#cCalle").val(objProspecto.Calle);
                $("#cNumero").val(objProspecto.Numero);
                $("#ccolonia").val(objProspecto.Colonia);
                $("#cCodigoPostal").val(objProspecto.CP);
                $("#cTelefono").val(objProspecto.Telefono);
                $("#cRFC").val(objProspecto.RFC);
                $("#cid").val(id);


            } else {
                alert(htmlData[1]);
            }

        },
        failure: function (response) {
            alert(response.responseText);
        },
        error: function (response) {
            alert(response.responseText);
        }
    });

});

$(function () {
    $("#btnRechazar").click(function () {

        var isValid = $("#form1").valid();
        var objP = {};

        if (isValid) {
            objP.Observaciones = $("#cObservaciones").val();
            objP.Estatus = "Rechazado";
            objP.Id = $("#cid").val();

            var jsondata = JSON.stringify({ obj: objP });

            $.ajax({
                type: "POST",
                url: "EvaluarProspecto.aspx/Enviar",
                data: "{'dataF':" + jsondata + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {

                    var htmlData = response.d.split('|');

                    if (htmlData[0] == "true") {
                        alert(htmlData[1]);
                        window.location.href = "Default.aspx";

                    } else {
                        alert(htmlData[1]);
                    }

                },
                failure: function (response) {
                    alert(response.responseText);
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });

        } else {
            return;
        }

    });
});
$(function () {
    $("#btnSalir").click(function () {

        Salir();

    });
});
$(function () {
    $("#btnAutorizar").click(function () {

     
        var objP = {};
        objP.Observaciones = $("#cObservaciones").val();
        objP.Estatus = "Autorizado";
        objP.Id = $("#cid").val();

        var jsondata = JSON.stringify({ obj: objP });

        $.ajax({
            type: "POST",
            url: "EvaluarProspecto.aspx/Enviar",
            data: "{'dataF':" + jsondata + "}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {

                var htmlData = response.d.split('|');

                if (htmlData[0] == "true") {
                    alert(htmlData[1]);
                    window.location.href = "Default.aspx";

                } else {
                    alert(htmlData[1]);
                }

            },
            failure: function (response) {
                alert(response.responseText);
            },
            error: function (response) {
                alert(response.responseText);
            }
        });

    });
});