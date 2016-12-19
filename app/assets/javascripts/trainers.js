$(function() {
  $("#all-trainers").on('click', function(event) {
    event.preventDefault();
    $.get('/users.json', function(data) {
      var string = '<div class="container"><div class="row"><div class="col-lg-4"><h1>Trainers:</h1>';
      $.each(data, function(index, value) {
        var name = value.name;
        string += "<h4><li>" + name + "</li></h4>";
      });
      string += "</div></div></div>"
        $("#trainer").append(string);
    });
  });
});