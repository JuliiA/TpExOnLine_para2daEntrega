<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true"
    CodeBehind="RealizarExamenAlumno.aspx.cs" Inherits="TP_ExamenesEnLinea.RealizarExamenAlumno" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="nav-tabs breadcrumb col-md-offset-0">
        <h3>
            Realizar examen</h3>
        <div class="panel panel-danger">
            <div class="panel-heading">
                <asp:Label ID="lblexamen" runat="server" Text=""></asp:Label></div>
            <div class="panel-heading">
                <asp:Label ID="lbldescripcion" runat="server" Text=""></asp:Label></div>
            <div class="panel-heading">
                <asp:Label ID="lblfechora" runat="server" Text=""></asp:Label></div>
        </div>
        <table class="table">
            <thead>
                <tr>
                    <th>
                        <h3>
                            Cual de las siguientes afirmaciones es la correcta:</h3>
                    </th>
                    <br />
                </tr>
            </thead>
        </table>
        <asp:CheckBoxList ID="check" runat="server">
            <asp:ListItem>Respuesta uno.</asp:ListItem>
            <asp:ListItem>Respuesta dos</asp:ListItem>
            <asp:ListItem>Respuesta tres</asp:ListItem>
        </asp:CheckBoxList>
        <ul class="pager">
            <li class="disabled"><a href="#">Pregunta 1 de 1</a></li>
            <%--Siguiente mostraria la proxima pregunta a responder o sino quedan mas por responder, nos redirecciona a Resultado--%>
            <li><a href="ResultadoExamenAlumno.aspx">Siguiente » </a></li>
        </ul>
    </div>
</asp:Content>
