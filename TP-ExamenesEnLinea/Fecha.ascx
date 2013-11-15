<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Fecha.ascx.cs" Inherits="TP_ExamenesEnLinea.Fecha" %>
<link href="datepicker/themes/base/jquery.ui.all.css" rel="stylesheet" type="text/css" />
    <script src="datepicker/datepicker/jquery-1.9.1.js" type="text/javascript"></script>
    <script src="datepicker/datepicker/jquery.ui.core.js" type="text/javascript"></script>
    <script src="datepicker/datepicker/jquery.ui.widget.js" type="text/javascript"></script>
    <script src="datepicker/datepicker/jquery.ui.datepicker.js" type="text/javascript"></script>
    <%--<script src="Script/funciones.js" type="text/javascript"></script>
    --%>   
    <script type="text/javascript">
           $(function () {
               $.datepicker.setDefaults($.datepicker.regional['es']);
               $('#<%=datepicker1.ClientID %>').datepicker($.datepicker.regional['es']);
           }); 
    </script>

<div>
<asp:TextBox ID="datepicker1" runat="server"></asp:TextBox>
</div>

