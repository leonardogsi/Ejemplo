<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="CapturarProspecto.aspx.cs" Inherits="WebAppProspectos.CapturarProspecto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <script src="Scripts/JSCapturarProspecto.js"></script>

    <script type="text/javascript">
        var countSubir = 0;
        var countSubidos = 0;
        var maxFileSize = 4194304; // 4MB -> 4 * 1024 * 1024

        function UploadFile() {
            $('body').loadingModal({
                text: 'Subiendo Archivos...'
            });
            var files = $("#<%=file1.ClientID%>").get(0).files;
            counter = 0;
            for (var i = 0; i < files.length; i++) {
                var file = files[i];

                if (file.size < maxFileSize) {
                    var formdata = new FormData();
                    formdata.append("file1", file);
                    var ajax = new XMLHttpRequest();

                    ajax.upload.addEventListener("progress", progressHandler, false);
                    ajax.addEventListener("load", completeHandler, false);
                    ajax.addEventListener("error", errorHandler, false);
                    ajax.addEventListener("abort", abortHandler, false);
                    ajax.open("POST", "FileUploadHandler.ashx");
                    ajax.send(formdata);
                }
            }
        }
        function progressHandler(event) {
            $("#loaded_n_total").html("Subido " + event.loaded + " bytes de " + event.total);
            var percent = (event.loaded / event.total) * 100;
            $("#progressBar").val(Math.round(percent));
            $("#status").html(Math.round(percent) + "% Subiendo archivos...espere por favor");
        }
        function completeHandler(event) {
            countSubidos++;
            if (countSubidos == countSubir) {

                $('body').loadingModal('destroy');
                alert(resultGuardar);
                location.reload();
            }
            $("#status").html(counter + " " + event.target.responseText);
        }
        function errorHandler(event) {
            $("#status").html("Error al subir");
        } function abortHandler(event) {
            $("#status").html("Cancelado");
        }

        function setUploadButtonState() {


            var error = "";
            var fileUpload = $("#<%=file1.ClientID%>");
            var files = $("#<%=file1.ClientID%>").get(0).files;

            for (var i = 0; i < files.length; i++) {
                var file = files[i];
                if (file.size > maxFileSize) {
                    error += "El archivo " + file.name + " excede los 4 mb y no se subirá \n";
                } else {
                    countSubir++;
                }
            }

            if (fileUpload.val() == '') {
                return false;
            } else {
                if (error != "") {
                    alert(error);
                }
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <fieldset>
        <legend>Captura de Prospecto</legend>
        <label style="color: red">Los campos con un * son obligatorios:</label>


        <div class="container">
            <div class="row mt-3">
                <div class="col-3">
                    <label for="cnnombre">*Nombre del Prospecto</label>
                </div>
                <div class="col-9">
                    <input id="cnnombre" class="form-control" name="cnnombre" type="text" required>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-3">
                    <label for="cPrimerApellido">*Primer Apellido</label>
                </div>
                <div class="col-9">
                    <input id="cPrimerApellido" class="form-control" name="cPrimerApellido" required>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-3">
                    <label for="cSegundoApellido">Segundo Apellido</label>
                </div>
                <div class="col-9">
                    <input id="cSegundoApellido" class="form-control" name="cSegundoApellido">
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-3">
                    <label for="cCalle">*Calle</label>
                </div>
                <div class="col-9">
                    <input id="cCalle" class="form-control" name="cCalle" required>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-3">
                    <label for="cNumero">*Número</label>
                </div>
                <div class="col-9">
                    <input id="cNumero" class="form-control" name="cNumero" required>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-3">
                    <label for="ccomment">*Colonia</label>
                </div>
                <div class="col-9">
                    <textarea id="ccolonia" class="form-control" name="ccolonia" required></textarea>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-3">
                    <label for="cCodigoPostal">*Código Postal</label>
                </div>
                <div class="col-9">
                    <input id="cCodigoPostal" class="form-control" name="cCodigoPostal" required>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-3">
                    <label for="cTelefono">*Teléfono</label>
                </div>
                <div class="col-9">
                    <input id="cTelefono" class="form-control" maxlength="10" name="cTelefono" required>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-3">
                    <label for="cRFC">*RFC</label>
                </div>
                <div class="col-9">
                    <input id="cRFC" class="form-control" name="cRFC" required>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-3">
                    <label for="cDocumentos">*Documentos</label><br />
                    <label style="font-size: small">*Tamaño máximo por archivo 4MB</label>
                </div>
                <div class="col-9">
                    <div class="wrapper">
                        <asp:FileUpload ID="file1" runat="server" AllowMultiple="true" /><br>
                        <progress id="progressBar" value="0" max="100" style="width: 300px;"></progress>
                        <h3 id="status"></h3>
                        <p id="loaded_n_total"></p>

                        <asp:CustomValidator ID="NewPasswordCustomValidator" runat="server"
                            Text="*" ToolTip="FileSize should not exceed 5kb"
                            ErrorMessage="FileSize Exceeds the Limits.Please Try uploading smaller size files."
                            ControlToValidate="file1"
                            ClientValidationFunction="setUploadButtonState">
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                        </asp:CustomValidator>

                    </div>
                </div>
            </div>
        </div>


        <table>
            <tr>
                <td>
                    <button id="btnEnviar" type="button" class="btn btn-primary">Enviar</button>
                </td>
                <td>
                    <button id="btnSalir" type="button" class="btn btn-secondary">Salir</button>
                </td>
            </tr>
        </table>

    </fieldset>

</asp:Content>
