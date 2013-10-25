<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="ExamenesProfesor.aspx.cs" Inherits="TP_ExamenesEnLinea.ExamenesProfesor" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <a href="CrearExamenProfesor.aspx" class="btn btn-warning btn-lg">Crear Examen</a>
    <br />
    <br />
    <div class="nav-tabs breadcrumb col-md-offset-0">
        <h3>
            Estadisticas de Examenes</h3>
        <%-- ACA SE REEPLAZARA LUEGO POR UNA GRIDVIEW CON DATOS DESDE LA BASE DE DATOS--%>
        <div class="breadcrumb col-mg-2">
            <div class="table text-center table-condensed">
                <asp:GridView ID="gvexamenes" runat="server">
                </asp:GridView>
                       <%--<th>
                            Curso
                        </th>
                        <th>
                            Examen
                        </th>
                        <th>
                            Fecha y hora tope
                        </th>
                        <th>
                            Rindieron
                        </th>
                        <th>
                            Aprobados
                        </th>
                        <th>
                            Reprobados
                        </th>
                        <th>
                            Alumnos que Faltan
                        </th>--%>
                  <asp:Label ID="lblmensaje" runat="server" Text=""></asp:Label>
                       </div>
        </div>
</asp:Content>
