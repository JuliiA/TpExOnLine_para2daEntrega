<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="EditarCursoProfesor.aspx.cs" Inherits="TP_ExamenesEnLinea.EditarCursoProfesor" %>

<%@ Register Src="~/Fecha.ascx" TagName="Calendario" TagPrefix="fec" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="nav-tabs breadcrumb col-md-offset-0">
        <h3>
            Editar Curso</h3>
        <div class="breadcrumb col-mg-2">
            <div class="formio">
                <div class="control-group">
                    <asp:Label ID="lblmail" runat="server" Text="Nombre Curso"></asp:Label>
                    <div>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <asp:Label ID="Label1" runat="server" Text="Estado Activo:"></asp:Label>
                        <asp:CheckBoxList ID="check" runat="server">
                            <asp:ListItem Selected="True">Verdadero</asp:ListItem>
                        </asp:CheckBoxList>
                    </div>
                    <div class="control-group">
                        <fec:Calendario ID="fecini" runat="server"></fec:Calendario>
                        <br />
                    </div>
                    <div class="control-group">
                        <asp:Label ID="lblmails" runat="server" Text="Listado de mail"></asp:Label>
                        <div>
                            <asp:TextBox ID="txtmails" MaxLength="140" Rows="6" TextMode="MultiLine" runat="server"></asp:TextBox></div>
                    </div>
                </div>
                <div class="controls">
                    <asp:Button ID="Button1" runat="server" class="btn btn-success" Text="Guardar cambios" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
