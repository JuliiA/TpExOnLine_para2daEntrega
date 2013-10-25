<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true"
    CodeBehind="ExamenesDisponiblesAlumnos.aspx.cs" Inherits="TP_ExamenesEnLinea.ExamenesDisponiblesAlumnos" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="nav-tabs breadcrumb col-md-offset-0">
        <h3>
            Examenes disponibles</h3>
        <div class="breadcrumb col-mg-2">
<%--ACA SE REEPLAZARA LUEGO POR UNA GRIDVIEW CON DATOS DESDE LA BASE DE DATOS--%>
            <div class="table table-striped table-hover">
                <asp:Label ID="lblmensaje" runat="server" Text=""></asp:Label>
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
                            Estado
                        </th>--%>
            </div>
        </div>
    </div>
</asp:Content>
