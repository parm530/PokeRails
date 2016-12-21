$(function() {
  $("#train").on('click', function(event) {

    event.preventDefault();

    $(".trainerDiv").remove();

    var trainerDiv = document.createElement("div");
    $(trainerDiv).attr("class", "trainerDiv");


    $.get('/users.json', function(data) {
      var string = '<div class="container"><div class="row"><div class="col-lg-4">';
      $.each(data, function(index, value) {
        var name = value.name;
        string += "<h4><li>" + name + "</li></h4>";

      });
      string += "</div></div></div>"
        $(trainerDiv).html(string);

        $("#train").append(trainerDiv);

    });

  });

});