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
                <asp:GridView ID="gvexamenes" runat="server" CellPadding="4" 
                    ForeColor="#333333" GridLines="None" Width="90%">
                    <AlternatingRowStyle BackColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                  <asp:Label ID="lblmensaje" runat="server" Text=""></asp:Label>
                       </div>
        </div>
</asp:Content>
