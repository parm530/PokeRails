$(function() {

  $(".pink").on("click", function(event) {
    event.preventDefault();
    var id = this.id;

    $(".smallPartyDiv").remove()
    var partyDiv = document.createElement("div");
    $(partyDiv).attr("class", "smallPartyDiv")

    $.get("/users/" + id + "/parties.json", function(data) {
      var string = "<br><ul>";
      data.forEach(function(party) {
        string += "<h4><li>" + party.name + "</li></h4>";
        party.pokemons.forEach(function(pkmn) {
          string += "<li>" + pkmn.name + "</li>"
      })
    })
    $(partyDiv).html(string + "</ul>");
    $("#party").append(partyDiv);

    });
  });

  $(".js-more").on('click', function(event) {
    event.preventDefault();
    var id  = this.id;
    $(".infoDiv").remove()
    var infoDiv = document.createElement("div");
    $(infoDiv).attr("class", "infoDiv");
    $.get("/pokemons/" + id + ".json", function(data) {

      pkmn = new Pokemon(data);
      var stats = pkmn.stats();
      $(infoDiv).html(stats);
      $(`#${data.id}`).append(infoDiv);
    });
  });

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

  $("#train").on('click', 'li.trainer-li', function() {
    var id = this.id;
    $.get('/users/' + id + '/caught_pokemon', function(data) {
      var name = data.name;
      var num = data.caught_pokemons.length;
      var string = " has caught: " + num + " pokemons!"
      $(`#${id}`).append(string);
    });
    // get /users/:id/caught_pokemons
    // make call to rails with the id, maybe we'll need a new route/ controller action

    // take that response, and append some new info about that specific trainer to the page
    // ex: number of caught pokemon
  });


});