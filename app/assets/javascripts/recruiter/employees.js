(function() {
$(function() {
return $("#add_eq").on("ajax:success", function(event, data) {
$("#eq").append(data);
return $(this).data("params", {
index: $("#eq div.file").length
});
});
});
}).call(this);
