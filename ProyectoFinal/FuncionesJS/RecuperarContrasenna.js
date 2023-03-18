function BuscarCorreo() {
    $("#btnProcesar").prop("disabled", true);
    let ValidarCorreo = $("#CorreoElectronico").val();

    $.ajax({
        type: "POST",
        url: "/Home/BuscarCorreo",
        dataType: "json",
        data: {
            "ValidarCorreo": ValidarCorreo
        },
        success: function (res) {
            if (res != "ERROR") {
                if (res != "") {
                    $("#btnProcesar").prop("disabled", false);
                }
                else {
                    alert("Su cuenta no se encuentra registrada en el sistema");
                }
            }

        }
    });
}