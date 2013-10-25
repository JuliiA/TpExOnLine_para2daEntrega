<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true"
    CodeBehind="ResultadoExamenAlumno.aspx.cs" Inherits="TP_ExamenesEnLinea.ResultadoExamenAlumno" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="nav-tabs breadcrumb col-md-offset-0">
        <h3>
            Resultado</h3>
        <div class="breadcrumb col-mg-2">
<%-- ACA SE REEPLAZARA LUEGO POR UNA GRIDVIEW CON DATOS DESDE LA BASE DE DATOS--%>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>
                            Examen
                        </th>
                        <th>
                            Fecha y hora de inicio
                        </th>
                        <th>
                            Email
                        </th>
                        <th>
                            Tiempo demorado
                        </th>
                        <th>
                            Fecha y hora de fin
                        </th>
                        <th>
                            Porcentaje
                        </th>
                        <th>
                            Resultado
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            Numeros complejos
                        </td>
                        <td>
                            19/09/2013 09:00
                        </td>
                        <td>
                            josefinama@gmail.com
                        </td>
                        <td>
                            00:20:00
                        </td>
                        <td>
                            19/09/2013 09:20
                        </td>
                        <td>
                            60
                        </td>
                        <td>
                            Aprobado
                        </td>
                        <td>
                            <a href="ExamenesDisponiblesAlumnos.aspx" class="btn btn-link">Ir a Examenes Disponibles</a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>
