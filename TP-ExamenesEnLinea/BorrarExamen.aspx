<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="BorrarExamen.aspx.cs" Inherits="TP_ExamenesEnLinea.BorrarExamen" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div class="nav-tabs breadcrumb col-md-offset-0">
        <h3>
            Borrar Examen</h3>
        <div class="breadcrumb col-mg-2">
            <div class="table table-striped table-hover">
                <div>
                            ¿Esta seguro que desea borrar este examen?
                             <asp:Label ID="lblexamen" runat="server" Text="" CssClass="text-warning"></asp:Label>
                </div>
                <div class="nav-pills">
                            <p>
                                <asp:Button ID="btnborrar" runat="server" Text="Borrar" 
                                    CssClass="btn  btn-success" onclick="btnborrar_Click"/>
                                <asp:Button ID="Button2" runat="server" Text="Cancelar" CssClass="btn  btn-inverse" PostBackUrl="~/ExamenesProfesor.aspx"/>
                         </p>
                </div>
                <asp:Label ID="lblmensaje" runat="server" Text="" CssClass="text-danger"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
