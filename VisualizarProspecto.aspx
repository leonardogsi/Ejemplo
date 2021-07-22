<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="VisualizarProspecto.aspx.cs" Inherits="WebAppProspectos.VisualizarProspecto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function regresar() {
            window.location.href = "Default.aspx";
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <fieldset>
        <legend>Información del Prospecto</legend>

        <div class="container">
            <div class="row mt-3">
                <div class="col-3">
                    <label for="cnnombre">Nombre del Prospecto</label>
                </div>
                <div class="col-9">
                    <input id="cnnombre" readonly="readonly" class="form-control" runat="server" name="cnnombre" type="text" required>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-3">
                    <label for="cPrimerApellido">Primer Apellido</label>
                </div>
                <div class="col-9">
                    <input runat="server" class="form-control" readonly="readonly" id="cPrimerApellido" name="cPrimerApellido" required>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-3">
                    <label for="cSegundoApellido">Segundo Apellido</label>
                </div>
                <div class="col-9">
                    <input runat="server" class="form-control" readonly="readonly" id="cSegundoApellido" name="cSegundoApellido">
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-3">
                    <label for="cCalle">Calle</label>
                </div>
                <div class="col-9">
                    <input runat="server" class="form-control" readonly="readonly" id="cCalle" name="cCalle" required>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-3">
                    <label for="cNumero">Número</label>
                </div>
                <div class="col-9">
                    <input runat="server" class="form-control" readonly="readonly" id="cNumero" name="cNumero" required>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-3">
                    <label for="ccomment">Colonia</label>
                </div>
                <div class="col-9">
                    <textarea runat="server" class="form-control" readonly="readonly" id="ccolonia" name="ccolonia" required></textarea>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-3">
                    <label for="cCodigoPostal">Código Postal</label>
                </div>
                <div class="col-9">
                    <input runat="server" class="form-control" readonly="readonly" id="cCodigoPostal" name="cCodigoPostal" required>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-3">
                    <label for="cTelefono">Teléfono</label>
                </div>
                <div class="col-9">
                    <input runat="server" class="form-control" readonly="readonly" id="cTelefono" name="cTelefono" required>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-3">
                    <label for="cRFC">RFC</label>
                </div>
                <div class="col-9">
                    <input runat="server" class="form-control" readonly="readonly" id="cRFC" name="cRFC" required>
                </div>
            </div>
             <div class="row mt-3">
                <div class="col-3">
                    <label runat="server" id="lblObservaciones" for="cObservaciones">Observaciones</label>
                </div>
                <div class="col-9">
                    <textarea runat="server" class="form-control" readonly="readonly" id="cObservaciones" name="cObservaciones" required />
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-3">
                    <label for="cDocumentos">Documentos</label>
                </div>
                <div class="col-9">
                    <asp:Repeater runat="server" ID="repeater1">
                        <HeaderTemplate>
                            <table border="0">
                                <tr>
                                    <td>Descargar Archivos</td>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:LinkButton ForeColor="Blue" runat="server" ID="linkbtnDownloda" Text='<%# Eval("NombreArchivo") %>' CommandArgument='<%#Eval("PathArchivo") %>' OnCommand="linkbtnDownloda_Command" />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>

    </fieldset>
    <table>
        <tr>
            <td>
                <button id="btnEnviar" type="button" class="btn btn-secondary" onclick="regresar()" >Regresar</button>

            </td>
        </tr>
    </table>
</asp:Content>
