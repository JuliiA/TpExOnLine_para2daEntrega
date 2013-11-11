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
                    Pregunta <asp:Label ID="lblnrp" 
                        runat="server"></asp:Label></h3>
                <asp:TextBox ID="txtpregunta" runat="server" CssClass="input-xxlarge" Columns="30" TextMode="MultiLine"></asp:TextBox>
                
            </div>
            <div class="modal-content">
                <pre>Debe seleccionar una o dos respuesta como correcta</pre>
                a)<asp:TextBox ID="txtresp1" runat="server"></asp:TextBox><br />
                <asp:CheckBox ID="check1" runat="server" Text="Correcta" /><br />
                b)<asp:TextBox ID="txtresp2" runat="server"></asp:TextBox><br />
                <asp:CheckBox ID="check2" runat="server" Text="Correcta" /><br />
                c)<asp:TextBox ID="txtresp3" runat="server"></asp:TextBox><br />
                <asp:CheckBox ID="check3" runat="server" Text="Correcta" /><br />
            </div>
            <div class="modal-footer">
                Calificacion maxima por examen -> todas respuestas correctas
                <input id="txtpuntaje" type="text" value="1 pregunta correcta = 20% (Todas Respuestas marcadas)"/>punto/s.
            </div>
        </div>
        <%--Con siguiente podemos cargar otra pregunta, o sino le damos click a Crear Examen, el cual nos crearia el examen y nos redirecciona hacia el 
        Mis examenes--%>
        <asp:Button ID="btnsig" runat="server" Text="Siguiente" 
            CssClass="btn btn-default" onclick="btnsig_Click1" />
        <asp:Button ID="btncrear" runat="server" Text="Crear Examen" 
            CssClass="btn btn-success" onclick="btncrear_Click" />
        <asp:Label ID="lblmensaje" runat="server" Text=""></asp:Label>
        <div class="modal-header text-center">
            <h1 class="text-success">
                Sistemas de Examenes OnLine</h1>
        </div>
    </div>
    </form>
</body>
</html>
