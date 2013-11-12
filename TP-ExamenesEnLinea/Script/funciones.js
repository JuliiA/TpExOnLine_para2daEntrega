$(function () {

    $.datepicker.setDefaults($.datepicker.regional['es']);

    $("#<%=datepicker1.ClientID %>").datepicker($.datepicker.regional['es']);

}); 

function btnsalir_Click1() {
    Session.Abandon();
    Response.Redirect("~/Index.aspx");
}