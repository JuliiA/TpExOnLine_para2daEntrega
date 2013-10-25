<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="AdminProfesor.aspx.cs" Inherits="TP_ExamenesEnLinea.AdminProfesor" %>

<%@ Register Src="~/Fecha.ascx" TagName="Calendario" TagPrefix="fec" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="nav-tabs breadcrumb col-md-offset-0">
        <h3>
            Alta de Curso</h3>
        <div class="breadcrumb col-mg-2">
            <div class="formio">
                <div class="control-group">
                    <asp:Label ID="lblcurso" runat="server" class="control-label" Text="Nombre Curso"></asp:Label>
                    <div>
                        <asp:TextBox ID="txtcurso" runat="server" ValidationGroup="btncurso"></asp:TextBox></div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Ingrese un nombre para el curso"
                        ControlToValidate="txtcurso" Display="Dynamic" CssClass="text-danger" Text="*Campo obligatorio"></asp:RequiredFieldValidator>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <asp:Label ID="Label1" runat="server" Text="Estado Activo:"></asp:Label><br />
                        <asp:CheckBoxList ID="check" runat="server" ValidationGroup="btncurso">
                            <asp:ListItem>Activo/Desactivo</asp:ListItem>
                        </asp:CheckBoxList>
                    </div>
                </div>
                <div class="control-group">
                    <fec:Calendario ID="fecini" runat="server"></fec:Calendario><br />
                </div>
                <div class="control-group">
                    <asp:Label ID="lblmails" runat="server" class="control-label" Text="Email Alumnos"></asp:Label>
                    <div class="controls">
                        <asp:Label ID="Label2" runat="server" Text="[INGRESE LOS MAIL SEPARADOS POR COMA(,)]"></asp:Label>
                        <asp:TextBox ID="TextBox2" runat="server" MaxLength="140" Rows="6" TextMode="MultiLine" ValidationGroup="btncurso"></asp:TextBox>    
                    </div>
                </div>
                <div class="controls">
                    <asp:Button ID="btncrear" runat="server" class="btn btn-success" 
                        Text="Crear Curso" ValidationGroup="btncurso" onclick="btncrear_Click" />
                    <asp:Button ID="btncancelar" runat="server" CssClass="btn btn-inverse" 
                        Text="Cancelar" onclick="btncancelar_Click" />
                </div>
                <asp:Label ID="lblmensaje" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
