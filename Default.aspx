<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebAppProspectos.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="DataTables/DataTables-1.10.25/js/jquery.dataTables.js"></script>
    <link href="DataTables/DataTables-1.10.25/css/jquery.dataTables.css" rel="stylesheet" />

    <script type="text/javascript">  
        $(document).ready(function () {

            $.ajax({
                type: "POST",
                dataType: "json",
                url: "Default.aspx/ObtenerInformacion",
                data: null,
                contentType: "application/json; charset=utf-8",
                success: function (data) {

                    var dataProspectos = JSON.parse(data.d);
                    var datatableVariable = $('#prospectosTable').DataTable({
                        data: dataProspectos,
                        columns: [
                            {
                                'data': 'Id', 'render': function (data, type, row) {
                                    return '<a href="VisualizarProspecto.aspx?id=' + row.Id + '"><img alt="Ver" src="Iconos/ver.png" width="30" height="30"></a>'

                                }
                            },
                            {
                                'data': 'Id', 'render': function (data, type, row) {
                                    return '<a href="EvaluarProspecto.aspx?id=' + row.Id + '"><img alt="Evaluar" src="Iconos/evaluar.png" width="40" height="40"></a>'
                                }
                            },
                            { 'data': 'Nombre' },
                            { 'data': 'PrimerApellido' },
                            { 'data': 'SegundoApellido' },
                            { 'data': 'Estatus' }
                        ],
                        "language": {
                            "lengthMenu": "Mostrar _MENU_ registros por página",
                            "zeroRecords": "Ningún dato",
                            "info": "Mostrando página _PAGE_ de _PAGES_",
                            "infoEmpty": "Sin registros disponibles",
                            "infoFiltered": "(filtrado from _MAX_ registros totales)",
                            "search": "Buscar",
                            "paginate": {
                                "previous": "Anterior",
                                "next": "Siguiente"
                            }
                        }
                    });

                }
            });

        });

        function NuevoProspecto() {
            window.location.href = "CapturarProspecto.aspx";
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <button type="button" class="btn btn-primary" onclick="NuevoProspecto();">Nuevo</button>
    <br />
    <br />
    <br />
    <table id="prospectosTable">
        <thead>
            <tr>
                <th>Ver</th>
                <th>Evaluar</th>
                <th>Nombre</th>
                <th>Primer Apellido</th>
                <th>Segundo Apellido</th>
                <th>Estatus</th>
            </tr>
        </thead>

    </table>
</asp:Content>
