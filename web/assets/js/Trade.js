/* 
 * AJAX for submitting an item.
 */
$(document).ready(function () { 
    $("#submitItem").click(function (event) {
        event.preventDefault(); 
                
        $("#submitItem").attr("disabled", "disabled").html("Wait...");
        $(this.form).ajaxSubmit({
            dataType: "json",
            timeout: (30 * 1000),
            error: function (data) {
                setTimeout(function () {
                    $("#submitItem").removeAttr("disabled").html("Sign Up");
                }, 1500);
            },
            success: function (data) {

                if (data.status === "Redirect") {
                    window.location.replace(data.content);
                }
                if (data.status === "Failed") {
                    alert(data.content);
                    $("#submitItem").removeAttr("disabled").html("Sign Up");
                }

            }
        });
    });
});


/*
 * 
  $(document).ready(function () {
    $("#submitDefault").submit(function (event) {

        event.preventDefault(); // avoid to execute the actual submit of the form.

        var form = $(this);
//        var url = form.attr('Acc');
        $.ajax({
            type: "POST",
            url: "Trade",
            data: form.serialize(), // serializes the form's elements.
            success: function (data, status)
            {

                alert("Success: " + status); // show response from the php script.
            },
            error: function () {
                alert("Error");
            }
        });
    });
}
*/