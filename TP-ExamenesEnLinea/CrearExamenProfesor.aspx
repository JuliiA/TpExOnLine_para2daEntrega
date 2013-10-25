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
                        <asp:ListItem Selected="True" Text="Seleccione curso" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Matematica 1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Taller 2" Value="2"></asp:ListItem>
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
                    <asp:TextBox ID="txtduracion" runat="server"></asp:TextBox>minutos</div>
                <asp:Label ID="lblfectope" runat="server" Text="Fecha Tope"></asp:Label>
                <div>
                    <asp:TextBox ID="txtfectope" runat="server"></asp:TextBox>(MM/DD/AAAA)</div>
                <asp:Label ID="lblhoratope" runat="server" Text="Hora Tope"></asp:Label>
                <div>
                    <asp:TextBox ID="txthoratope" runat="server"></asp:TextBox>hh:mm</div>
                <br />
                <asp:Label ID="lblporcentaje" runat="server" Text="Porcentaje de aprobacion"></asp:Label>
                <div>
                    <asp:TextBox ID="txtporcentaje" runat="server" 
                        ToolTip="El porcentaje de Aprobacion se da de acuerdo a la cantidad de respuestas correctas, es decir,por ejemplo: son 5 preguntas: 3 validas 60%"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Ingrese un porcentaje"
                        ControlToValidate="txtporcentaje" Display="Dynamic" CssClass="text-danger" Text="*Campo obligatorio"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="validadorRango" runat="server" ControlToValidate="txtporcentaje"
                        ErrorMessage="El porcentaje deber ser numerico" Display="Dynamic" MinimumValue="10"
                        MaximumValue="100" Type="Integer">
                    </asp:RangeValidator></div>
                <%--Siguiente guardaria los datos en la base de datos y mos lleva a Preguntas.aspx--%>
                <asp:Button ID="btnsig" runat="server" CssClass="btn btn-success" 
                    Text="Siguiente" onclick="btnsig_Click" />
                <%--<a href="Preguntas.aspx">[PREGUNTAS]</a>--%>
                <asp:Label ID="Label1" runat="server" CssClass="text-danger" Text=""></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
