<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="CrearExamenProfesor.aspx.cs" Inherits="TP_ExamenesEnLinea.CrearExamenProfesor" %>

<%@ Register Src="~/Fecha.ascx" TagName="Calendario" TagPrefix="fec" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="nav-tabs breadcrumb col-md-offset-0">
        <h3>
            Crear Examen</h3>
        <div class="breadcrumb">
            <div class="formio">
                <asp:Label ID="lblcurso" runat="server" Text="Curso"></asp:Label>
                <div>
                    <asp:DropDownList ID="ddlcursos" runat="server">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Seleccione una opcion"
                        ControlToValidate="ddlcursos" Display="Static" Text="*Campo obligatorio" CssClass="text-danger"
                        InitialValue="0"></asp:RequiredFieldValidator>
                </div>
                <asp:Label ID="lblnomcurso" runat="server" Text="Nombre"></asp:Label>
                    <div>
                        <asp:TextBox ID="txtnomcurso" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Ingrese un nombre de examen"
                            ControlToValidate="txtnomcurso" Display="Dynamic" CssClass="text-danger" Text="*Campo obligatorio"></asp:RequiredFieldValidator></div>
                <asp:Label ID="lbldesc" runat="server" Text="Descripcion"></asp:Label>
                    <div>
                        <asp:TextBox ID="txtdesc" runat="server" TextMode="MultiLine" TabIndex="4"></asp:TextBox></div>
                    <asp:Label ID="lblduracion" runat="server" Text="Duracion"></asp:Label>
                <div>
                    <asp:DropDownList ID="ddlduracion" runat="server" AutoPostBack="true">
                        <asp:ListItem Value="0" Text="Seleccione los minutos"></asp:ListItem>
                        <asp:ListItem Value="1" Text="5"></asp:ListItem>
                        <asp:ListItem Value="2" Text="10"></asp:ListItem>
                        <asp:ListItem Value="3" Text="15"></asp:ListItem>
                        <asp:ListItem Value="4" Text="30"></asp:ListItem>
                        <asp:ListItem Value="5" Text="35"></asp:ListItem>
                        <asp:ListItem Value="6" Text="45"></asp:ListItem>
                        <asp:ListItem Value="7" Text="60"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                     <fec:Calendario ID="fechatope" runat="server" /><div>
                    <asp:Label ID="Label2" runat="server" Text="Hora Tope"></asp:Label><br />
                    <asp:TextBox ID="txthoratope" runat="server"></asp:TextBox>hh:mm</div>
                <br />
                <asp:Label ID="lblporcentaje" runat="server" Text="Porcentaje de aprobacion"></asp:Label>
                <div>
                    <asp:DropDownList ID="ddlporcentaje" runat="server" AutoPostBack="true">
                        <asp:ListItem Value="0" Text="Seleccione los minutos"></asp:ListItem>
                        <asp:ListItem Value="1" Text="40"></asp:ListItem>
                        <asp:ListItem Value="2" Text="60"></asp:ListItem>
                        <asp:ListItem Value="3" Text="80"></asp:ListItem>
                        <asp:ListItem Value="4" Text="100"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <%--Siguiente guardaria los datos en la base de datos y mos lleva a Preguntas.aspx--%>
                <asp:Button ID="btnsig" runat="server" CssClass="btn btn-success" 
                    Text="Siguiente" onclick="btnsig_Click" />
                <%--<a href="Preguntas.aspx">[PREGUNTAS]</a>--%>
                <asp:Label ID="Label1" runat="server" CssClass="text-danger" Text=""></asp:Label>
            </div>
        
        </div>
    
</asp:Content>
