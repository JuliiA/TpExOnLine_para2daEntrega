<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="Error404.aspx.cs" Inherits="TP_ExamenesEnLinea.Error404" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link rel="stylesheet" type="text/css" href="bootstrap/bootstrap.css" media="all" />
    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" media="all" />
    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css" media="all" />
    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap-responsive.css"
        media="all" />
    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap-responsive.min.css"
        media="all" />
    <link rel="Shortcut Icon" href="imagen/Error.png" />
    <title>Error!</title>
</head>
<body class="body">
    <center class="navbar-collapse">
    <h2>
     <i class="icon-info-sign"></i> No existe la página solicitada</h2>
    Por favor, verifique la url de la pagina a la que quiere acceder.<br />
    <br />
    <asp:Image ID="Image1" src="imagen/404.jpg" CssClass="img-circle" runat="server" />
    <br />
    Volver al<a href="Index.aspx"> Index</a>
  </center>
</body>
</html>
