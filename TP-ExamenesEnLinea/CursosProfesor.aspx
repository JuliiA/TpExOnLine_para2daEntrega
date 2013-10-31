﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="CursosProfesor.aspx.cs" Inherits="TP_ExamenesEnLinea.CursosProfesor" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <a href="AdminProfesor.aspx" class="btn btn-warning btn-lg">Crear curso</a>
    <br />
    <br />
    <div class="nav-tabs breadcrumb col-md-offset-0">
         <h3>
            Grilla Cursos</h3>
        <asp:Label ID="lblmensaje" CssClass="text-danger" runat="server" Text=""></asp:Label>
        <div class="breadcrumb col-mg-2">
            <div class="table table-striped table-hover">
            <%-- onrowcommand="gvcursos_RowCommand" --%>
                <asp:GridView ID="gvcursos" runat="server" OnLoad="Page_Load" 
                    onrowcreated="gvcursos_RowCreated"
                    onrowdatabound="gvcursos_RowDataBound" 
                    onselectedindexchanging="gvcursos_SelectedIndexChanging">
                    <Columns>
                        <asp:HyperLinkField DataNavigateUrlFields="IdCurso" 
                            DataNavigateUrlFormatString="~/EditarCursoProfesor.aspx?id={0}" HeaderText="Edicion" Text="Editar" ControlStyle-CssClass="icon-pencil" />
                        <asp:HyperLinkField DataNavigateUrlFields="IdCurso" 
                            DataNavigateUrlFormatString="~/BorrarCursoProfesor.aspx?id={0}" HeaderText="Borrado" Text="Borrar" ControlStyle-CssClass="icon-remove-circle" />
                     
                        <asp:TemplateField HeaderText="Cantidad Alumnos">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>           
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <br />
    </div>
</asp:Content>
