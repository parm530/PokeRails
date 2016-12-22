$(function() {
  $("#train").on('click', function(event) {

    event.preventDefault();
    $("#trainers").empty()
    $.get('/users', function(data) {
      var string = '<div class="container"><div class="row"><div class="col-lg-4">';

      $.each(data, function(index, value) {
        var trainer = new Trainer(value);
        string += trainer.trainerName();
      });
      string += "</div></div></div>";
      var str = new Trainer("Parm");
      str.append($("#trainers"), string);

    });

  });

});

