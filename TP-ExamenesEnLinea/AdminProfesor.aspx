<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="AdminProfesor.aspx.cs" Inherits="TP_ExamenesEnLinea.AdminProfesor" %>

<%@ Register Src="~/Fecha.ascx" TagName="Calendario" TagPrefix="fec" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="nav-tabs breadcrumb col-md-offset-0">
        <h3>
            Alta de Curso</h3>
            <asp:Label ID="lblmensaje" runat="server" Text="" CssClass="text-warning"></asp:Label>
        <div class="breadcrumb col-mg-2">
            <div class="formio">
                <div class="control-group">
                    <asp:Label ID="lblcurso" runat="server" CssClass="control-label" Text="Nombre Curso"></asp:Label>
                    <div>
                        <asp:TextBox ID="txtcurso" runat="server" ValidationGroup="btncurso"></asp:TextBox></div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Ingrese un nombre para el curso"
                        ControlToValidate="txtcurso" Display="Dynamic" CssClass="text-danger" Text="*Campo obligatorio" ValidationGroup="crear"></asp:RequiredFieldValidator>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <asp:CheckBox ID="CheckBox1" runat="server" Text="Estado: Activo/Desactivo"/>
                     </div>
                </div>
                <div class="control-group">
                   Fecha de Inicio<fec:Calendario ID="fecCalendario1" runat="server"></fec:Calendario>
                  <br />
                  Fecha de Finalizacion<fec:Calendario ID="fecCalendario2" runat="server" />
                </div>
                <div class="control-group">
                    <asp:Label ID="lblmails" runat="server" CssClass="control-label" Text="Email Alumnos"></asp:Label>
                    <div class="controls">
                        <asp:Label ID="Label2" runat="server" Text="[INGRESE LOS MAIL SEPARADOS POR (;)]"></asp:Label>
                        <asp:TextBox ID="txtmails" runat="server" MaxLength="140" Rows="6" TextMode="MultiLine" ValidationGroup="btncurso"></asp:TextBox>    
                    </div>
                </div>
                <div class="controls">
                    <asp:Button ID="btncrear" runat="server" CssClass="btn btn-success" 
                        Text="Crear Curso" ValidationGroup="crear" onclick="btncrear_Click" />
                    <asp:Button ID="btncancelar" runat="server" CssClass="btn btn-inverse" 
                        Text="Cancelar" onclick="btncancelar_Click" />
                </div>
                
            </div>
        </div>
    </div>
</asp:Content>
