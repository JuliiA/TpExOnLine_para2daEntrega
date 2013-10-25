<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true"
    CodeBehind="PrevioExamenAlumno.aspx.cs" Inherits="TP_ExamenesEnLinea.PrevioExamenAlumno" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="nav-tabs breadcrumb col-md-offset-0">
        <h3>
            Examen</h3>
        <div class="panel panel-danger">
            <div class="panel-heading">
                Numeros complejos</div>
            <div class="panel-heading">
                Descripcion: Responder en base a la teoria vista en las ultimas dos clases</div>
            <div class="panel-heading">
                Fecha tope: 20/09/2013 13:00</div>
        </div>
        <ul class="pager">
            <li><a href="ExamenesDisponiblesAlumnos.aspx" class="btn btn-default btn-lgk">« Volver
                a examenes disponibles</a></li>
            <li><a href="RealizarExamenAlumno.aspx" class="btn btn-default btn-lg">Comenzar » </a>
            </li>
        </ul>
    </div>
</asp:Content>
