<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="EvaluarProspecto.aspx.cs" Inherits="WebAppProspectos.EvaluarProspecto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="Scripts/JSEvaluarProspecto.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <input id="cid" type="text" style="display: none">
    <fieldset>
        <legend>Información del Prospecto</legend>


        <div class="container">
            <div class="row mt-3">
                <div class="col-3">
                    <label for="cnnombre">Nombre del Prospecto</label>
                </div>
                <div class="col-9">
                    <input id="cnnombre" class="form-control" readonly="readonly" name="cnnombre" type="text" required>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-3">
                    <label for="cPrimerApellido">Primer Apellido</label>
                </div>
                <div class="col-9">
                    <input id="cPrimerApellido" class="form-control" readonly="readonly" name="cPrimerApellido" required>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-3">
                    <label for="cSegundoApellido">Segundo Apellido</label>
                </div>
                <div class="col-9">
                    <input id="cSegundoApellido" class="form-control" readonly="readonly" name="cSegundoApellido">
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-3">
                    <label for="cCalle">Calle</label>
                </div>
                <div class="col-9">
                    <input id="cCalle" class="form-control" readonly="readonly" name="cCalle" required>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-3">
                    <label for="cNumero">Número</label>
                </div>
                <div class="col-9">
                    <input id="cNumero" class="form-control" readonly="readonly" name="cNumero" required>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-3">
                    <label for="ccomment">Colonia</label>
                </div>
                <div class="col-9">
                    <textarea id="ccolonia" class="form-control" readonly="readonly" name="ccolonia" required></textarea>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-3">
                    <label for="cCodigoPostal">Código Postal</label>
                </div>
                <div class="col-9">
                    <input id="cCodigoPostal" class="form-control" readonly="readonly" name="cCodigoPostal" required>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-3">
                    <label for="cTelefono">Teléfono</label>
                </div>
                <div class="col-9">
                    <input id="cTelefono" class="form-control" readonly="readonly" name="cTelefono" required>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-3">
                    <label for="cRFC">RFC</label>
                </div>
                <div class="col-9">
                    <input id="cRFC" class="form-control" readonly="readonly" name="cRFC" required>
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
            <div class="row mt-3">
                <div class="col-3">
                    *Escriba el motivo de rechazo
                    <label for="cObservaciones">Observaciones de Rechazo</label>
                </div>
                <div class="col-9">
                    <textarea id="cObservaciones" class="form-control" name="cObservaciones" required></textarea>
                </div>
            </div>
        </div>


    </fieldset>

    <table>
        <tr>
            <td>
                <button id="btnAutorizar" type="button" class="btn btn-primary">Autorizar</button>

            </td>
            <td>
                <button id="btnRechazar" type="button" class="btn btn-danger">Rechazar</button>
            </td>
            <td>
                <button id="btnSalir" type="button" class="btn btn-secondary">Salir</button>
            </td>
        </tr>
    </table>
</asp:Content>
