<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="TP_ExamenesEnLinea.Index" %>

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
    <title>.:.Sistemas de Examenes OnLine</title>
</head>
<body class="body">
    <div class="container">
        <br />
        <div class=" text-center">
            <h1 class="text-success">
                Sistemas de Examenes OnLine</h1>
        </div>
        <form id="form1" runat="server">
        <div class="container" id="cont">
            <div class="breadcrumb" id="breadcrumb">
                <div class="text-center">
                    <h2>
                        Bienvenidos al Portal de Realizacion de Examenes</h2>
                    <br />
                    <div class="col-lg-12">
                        <h3>
                            Aqui podra ingresar como:</h3>
                        <br />
                        <div class="alert alert-success">
                            <h3>
                                <i class="icon-ok"></i>Profesor para administrar sus cursos y examenes</h3>
                        </div>
                        <br />
                        <div class="alert alert-success">
                            <h3>
                                <i class="icon-ok"></i>Alumno para resolverlos y recibir su calificación automaticamente</h3>
                        </div>
                    </div>
                    <asp:Image ID="Image1" src="imagen/curso_online.png" CssClass="img-circle" runat="server" />
                    <br />
                    <br />
                    <a href="LoginUsuario.aspx" class="btn-primary btn-large"><i class="icon-leaf"></i>Profesor</a>
                    <a href="LoginUsuario2.aspx" class="btn-info btn-large"><i class="icon-book"></i>Alumno</a>
                    <br />
                    <br />
                </div>
            </div>
        </div>
        </form>
        <div id="pie">
            <div class="modal-footer">
                <i class="icon-star"></i>Copyright 2013- Avellaneda Juliana, Vaccaro Cecilia</div>
        </div>
    </div>
</body>
</html>
