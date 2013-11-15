<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true"
    CodeBehind="EditarDatosAlumno.aspx.cs" Inherits="TP_ExamenesEnLinea.EditarDatosAlumno" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="nav-tabs breadcrumb col-md-offset-0">
        <h3>
            Editar mis datos</h3>
        <div class="breadcrumb col-mg-2">
            <div class="formio">
                <asp:Label ID="lblnombre" runat="server" Text="Nombre"></asp:Label>
                <div>
                    <asp:TextBox ID="txtnombre" runat="server" ValidationGroup="Editar"></asp:TextBox></div>
                <br />
                <asp:Label ID="lblapellido" runat="server" Text="Apellido"></asp:Label>
                <div>
                    <asp:TextBox ID="txtapellido" runat="server" ValidationGroup="Editar"></asp:TextBox></div>
                <br />
                <asp:Label ID="lbldni" runat="server" Text="DNI"></asp:Label>
                <div>
                    <asp:TextBox ID="txtdni" runat="server" ValidationGroup="Editar"></asp:TextBox></div>
                <br />
                <asp:Label ID="lblmail" runat="server" Text="Email"></asp:Label>
                <div>
                    <asp:TextBox ID="txtmail" Enabled="false" runat="server"></asp:TextBox><p class="text-danger">
                        *No se puede editar</p>
                </div>
                <br />
                <asp:Label ID="lblcontraseñaactual" runat="server" Text="Contraseña actual"></asp:Label>
                <div>
                    <asp:TextBox ID="txtcontraseñaactual" TextMode="Password" runat="server" ValidationGroup="validar"></asp:TextBox></div>
                <br />
                <div class="tab-content">
                    <asp:Label ID="lblcontraseñanueva" runat="server" Text="Contraseña nueva"></asp:Label>
                    <div>
                        <asp:TextBox ID="txtcontraseñanueva" TextMode="Password" runat="server" ValidationGroup="validar"></asp:TextBox></div>
                    <br />
                    <asp:Label ID="lblrepetircontraseña" runat="server" Text="Repetir contraseña"></asp:Label>
                    <div>
                        <asp:TextBox ID="txtrepetircontraseña" TextMode="Password" runat="server" ValidationGroup="validar"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Las contraseñas deben coincidir"
                            ControlToCompare="txtcontraseñanueva" ControlToValidate="txtrepetircontraseña"
                            Display="Dynamic" CssClass="text-danger"></asp:CompareValidator><br />
                        <asp:Button ID="Button2" runat="server" CssClass="btn-mini" Text="Validar Contraseña"
                            ValidationGroup="validar" onclick="Button2_Click" /><br />
                        <asp:Label ID="lblnueva" runat="server" Text="" CssClass="text-warning"></asp:Label>
                    </div>
                </div>
                <br />
                <asp:Button ID="Button1" runat="server" Text="Guardar cambios" CssClass="btn btn-success "
                    OnClick="Button1_Click" ValidationGroup="Editar"/>
            </div>
        </div>
    </div>
</asp:Content>
