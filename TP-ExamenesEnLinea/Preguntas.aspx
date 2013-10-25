<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Preguntas.aspx.cs" Inherits="TP_ExamenesEnLinea.Preguntas" %>

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
   <title>Preguntas de Examen</title>
</head>
<body id="cuepoPreguntas">
    <form id="formpreguntas" runat="server">
    <div class="container-fluid">
        <div class="modal-body">
            <div class="modal-content">
                <h3>
                    Pregunta</h3>
                <textarea id="TextArea1" cols="10" rows="3" class="input-xxlarge"></textarea>
            </div>
            <div class="modal-content">
                <pre>Debe seleccionar una o dos respuesta como correcta</pre>
                a)<asp:TextBox ID="txtrespa" runat="server"></asp:TextBox><br />
                <asp:CheckBox ID="CheckBox1" runat="server" Text="Correcta" /><br />
                b)<asp:TextBox ID="txtrespb" runat="server"></asp:TextBox><br />
                <asp:CheckBox ID="CheckBox2" runat="server" Text="Correcta" /><br />
                c)<asp:TextBox ID="txtrespc" runat="server"></asp:TextBox><br />
                <asp:CheckBox ID="CheckBox3" runat="server" Text="Correcta" /><br />
            </div>
            <div class="modal-footer">
                Puntaje por Respuesta Correcta
                <input id="Text4" type="text" />punto/s.
            </div>
        </div>
        <%--Con siguiente podemos cargar otra pregunta, o sino le damos click a Crear Examen, el cual nos crearia el examen y nos redirecciona hacia el 
        Mis examenes--%>
        <asp:Button ID="btnsig" runat="server" Text="Siguiente" CssClass="btn btn-default"
            PostBackUrl="~/Preguntas.aspx" />
        <a href="ExamenesProfesor.aspx" class="btn btn-success">Crear Examen</a><br />
        <div class="modal-header text-center">
            <h1 class="text-success">
                Sistemas de Examenes OnLine</h1>
        </div>
    </div>
    </form>
</body>
</html>
