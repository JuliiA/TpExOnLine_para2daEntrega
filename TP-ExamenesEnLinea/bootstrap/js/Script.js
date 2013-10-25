/*$("#datepicker").datepicker({
    inline: true
});

$(document).ready(function () {

    $('#txtFecha').datepicker(

      { dateFormat: 'd MM, yy',

          minDate: '+0D',

          maxDate: '+1Y',

          changeMonth: true,

          changeYear: true,

          numberOfMonths: 2,

          dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa'],

          monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo',

                     'Junio', 'Julio', 'Agosto', 'Septiembre',

                     'Octubre', 'Noviembre', 'Diciembre'],

          monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr',

                          'May', 'Jun', 'Jul', 'Ago',

                           'Sep', 'Oct', 'Nov', 'Dic']

      });

});
*/
$(document).ready(function() {
    $("#fecini").datepicker({ minDate: -20, maxDate: "+1M +10D" });
    $("#fecfin").datepicker();
});

var today = new Date();
var dd = today.getDate();
var mm = today.getMonth() + 1;
var mm2 = today.getMonth() + 2;
var yyyy = today.getFullYear();
if (dd < 10) { dd = '0' + dd }
if (mm < 10) { mm = '0' + mm }
onload = function () {
    //document.getElementById('fecini').value = mm + '/' + dd + '/' + yyyy;
    //document.getElementById('fecfin').value = mm2 + '/' + dd + '/' + yyyy;
}
