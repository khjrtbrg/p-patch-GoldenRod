$(function () {
  $(".tool-button").click(function(event){

    event.preventDefault();
    var btn  = $(this);
    var form = $(this).parents("form");

    $.ajax(form.attr("action"), {
      type: "POST",
      data: {
        _method: "patch"
      },
      success: function() {
        btn.val() == "Return" ? btn.val("Borrow") : btn.val("Return");
        btn.toggleClass("btn-danger");
        btn.toggleClass("btn-info");
      },
      error: function() {
        location.reload();
      }
    });

  });
});
