
var resultGuardar = "";

function LimpiarDatos() {
    $("#cnnombre").val("");
    $("#cPrimerApellido").val("");
    $("#cSegundoApellido").val("");
    $("#cCalle").val("");
    $("#cNumero").val("");
    $("#ccolonia").val("");
    $("#cCodigoPostal").val("");
    $("#cTelefono").val("");
    $("#cRFC").val("");
}

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
        errorClass: "﻿my-error-cl",
        validClass: "my-valid-classPros",
        rules: {
            cTelefono: {
                required: true,
                digits: true
            },
            cCodigoPostal: {
                required: true,
                digits: true
            },
            cnnombre: {
                required: true               
            },
            cPrimerApellido: {
                required: true
            },
            cCalle: {
                required: true
            },
            cNumero: {
                required: true
            },
            ccolonia: {
                required: true
            },
            cRFC: {
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
});



$(function () {
    $("#btnSalir").click(function () {

        Salir();

    });
});

$(function () {
    $("#btnEnviar").click(function () {


        var isValid = $("#form1").valid();
        var objP = {};

        if (isValid) {

            if (countSubir == 0) {
                alert("Debe cargar al menos un documento válido");
                return;
            }
            objP.Nombre = $("#cnnombre").val();
            objP.PrimerApellido = $("#cPrimerApellido").val();
            objP.SegundoApellido = $("#cSegundoApellido").val();
            objP.Calle = $("#cCalle").val();
            objP.Numero = $("#cNumero").val();
            objP.Colonia = $("#ccolonia").val();
            objP.CP = $("#cCodigoPostal").val();
            objP.Telefono = $("#cTelefono").val();
            objP.RFC = $("#cRFC").val();
            objP.Estatus = "Enviado";

        } else {
            return;
            //e.preventDefault();
        }

        var jsondata = JSON.stringify({ obj: objP });
        $('body').loadingModal({
            text: 'Guardando...'
        });

        $.ajax({
            type: "POST",
            url: "CapturarProspecto.aspx/Enviar",
            data: "{'dataF':" + jsondata + "}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                $('body').loadingModal('destroy');

                var htmlData = response.d.split('|');
              
                resultGuardar = htmlData[1];
                if (htmlData[0] == "true") {                   
                    LimpiarDatos();
                    $('body').loadingModal('destroy');                     
                     UploadFile();
                    
                } else {
                   
                    alert(htmlData[1]);
                }

            },
            failure: function (response) {
                $('body').loadingModal('destroy');

                alert(response.responseText);
            },
            error: function (response) {
                alert(response.responseText);
            }
        });
    });
});



