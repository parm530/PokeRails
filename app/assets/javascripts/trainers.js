$(function() {
  $("#train").on('click', function(event) {

    event.preventDefault();

    $(".trainerDiv").remove();

    var trainerDiv = document.createElement("div");
    $(trainerDiv).attr("class", "trainerDiv");


    $.get('/users.json', function(data) {
      var string = '<div class="container"><div class="row"><div class="col-lg-4">';

      $.each(data, function(index, value) {
        var trainer = new Trainer(value);

        // var name = value.name;
        string += trainer.trainerName();

      });
      string += "</div></div></div>";

      var str = new Trainer("Parm");
      str.append(trainerDiv, string);

        // $(trainerDiv).html(string);

        $("#train").append(trainerDiv);

    });

  });

});

