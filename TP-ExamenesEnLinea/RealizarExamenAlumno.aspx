<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true"
    CodeBehind="RealizarExamenAlumno.aspx.cs" Inherits="TP_ExamenesEnLinea.RealizarExamenAlumno" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="nav-tabs breadcrumb col-md-offset-0">
        <h3>
            Realizar examen</h3>
        <div class="panel panel-danger">
            <div class="panel-heading">
                Numeros complejos</div>
            <div class="panel-heading">
                Descripcion: Responder en base al apunte de clase</div>
            <div class="panel-heading">
                Fecha tope: 20/09/2013 13:00</div>
        </div>
        <table class="table">
            <thead>
                <tr>
                    <th>
                        <h3>
                            Cual de las siguientes afirmaciones sobre los numeros complejos es la correcta:</h3>
                    </th>
                    <br />
                </tr>
            </thead>
        </table>
        <asp:CheckBoxList ID="check" runat="server">
            <asp:ListItem>Son una extensión de los números reales.</asp:ListItem>
            <asp:ListItem>Pueden representarse como la suma de dos números imaginarios</asp:ListItem>
            <asp:ListItem>Ninguna de las anteriores son correctas</asp:ListItem>
        </asp:CheckBoxList>
        <ul class="pager">
            <li class="disabled"><a href="#">Pregunta 1 de 1</a></li>
            <%--Siguiente mostraria la proxima pregunta a responder o sino quedan mas por responder, nos redirecciona a Resultado--%>
            <li><a href="ResultadoExamenAlumno.aspx">Siguiente » </a></li>
        </ul>
    </div>
</asp:Content>
