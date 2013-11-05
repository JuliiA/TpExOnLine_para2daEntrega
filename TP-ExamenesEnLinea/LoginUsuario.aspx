<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginUsuario.aspx.cs" Inherits="TP_ExamenesEnLinea.LoginUsuario" %>

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
    <link rel="Shortcut Icon" href="imagen/curso_online.png" />
        <title>.:.Sistemas de Examenes OnLine</title>
</head>
<body class="body">
    <div class="container">
        <div class="modal-header text-center">
            <h1 class="text-success">
                Sistemas de Examenes OnLine</h1>
        </div>
        <form id="form1" runat="server">
        <div class="container" id="cont">
            <div class="nav nav-divider breadcrumb">
                <h3>
                    <i class="icon-user"></i>Acceso de Profesor</h3>
                <div class="breadcrumb col-md-7">
                    <div class="col-lg-10  col-md-10">
                        <asp:Label ID="lblmail" runat="server" class="control-label" Text="Email"></asp:Label>
                        <div class="controls">
                            <asp:TextBox ID="txtmail" runat="server" placeholder="Email"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Ingrese su email"
                                ControlToValidate="txtmail" Display="Dynamic" Text="*Campo obligatorio" CssClass="text-danger"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Formato de mail Incorrecto" ControlToValidate="txtmail" CssClass="text-danger" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                        
                        </div>
                        <asp:Label ID="lblpass" runat="server" class="control-label" Text="Password"></asp:Label>
                        <div class="controls">
                            <asp:TextBox ID="txtpass" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Ingrese su password"
                                ControlToValidate="txtpass" Display="Dynamic" Text="*Campo obligatorio" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </div>
                        <div class="controls">
                            <asp:CheckBox ID="CheckBox1" runat="server" Text="Remember me" />
                            <asp:Button ID="Button1" runat="server" class="btn btn-success" Text="Ingresar" 
                                onclick="Button1_Click" />
                            <br />
                            <asp:Label ID="lblmensaje" runat="server" Text=">"></asp:Label>
                        </div>
                    </div>
                </div>
                <div>
                    <br />
                    <asp:Image ID="Image1" src="imagen/img.png" CssClass="img-rounded" ImageAlign="Bottom"
                        runat="server" Height="200px" Width="204px" />
                </div>
            </div>
        </div>
        </form>
        <div id="pie">
            <div class="modal-footer">
               <i class="icon-star"></i> Copyright 2013- Avellaneda Juliana, Vaccaro Cecilia</div>
        </div>
    </div>
</body>
</html>
