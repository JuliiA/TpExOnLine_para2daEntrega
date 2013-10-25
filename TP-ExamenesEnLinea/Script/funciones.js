function btnsalir_Click1() {
    Session.Abandon();
    Response.Redirect("~/Index.aspx");
}