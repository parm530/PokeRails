$(function() {
  $("#train .btn").on('click', function(event) {
    event.preventDefault();
    $("#trainers").empty()
    $.get('/users' + '.json', function(data) {
      var string = '<div class="container"><div class="row"><div class="col-lg-12">';
      $.each(data, function(index, value) {
        var trainer = new Trainer(value);
        string += trainer.trainerName();
      });
      string += "</div></div></div>";
      var trainer = new Trainer("Parm");
      trainer.append($("#trainers"), string);
    });
  });

});