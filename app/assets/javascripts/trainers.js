$(function() {
  $("#all-trainers").on('click', function(event) {
    event.preventDefault();
    $.get('/users.json', function(data) {
      var string = "<h1>Trainers:</h1>";
      $.each(data, function(index, value) {
        var name = value.name;
        string += "<li>" + name + "</li><br>";
      });
        $("#trainer").append(string);
    });
  });
});