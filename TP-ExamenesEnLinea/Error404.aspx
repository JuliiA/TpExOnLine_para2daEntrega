<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Error404.aspx.cs" Inherits="TP_ExamenesEnLinea.Error404" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="modal-content">
    <h2>
     <i class="icon-info-sign"></i> No existe la página solicitada</h2>
    Por favor, verifique la url de la pagina a la que quiere acceder.<br />
    <br />
    Volver al<a href='index.aspx'> Index</a>
  </div>
</asp:Content>
