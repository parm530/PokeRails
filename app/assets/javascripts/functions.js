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
      var string = "<br><br><br><h4>Type(s): " + data["types"] + "</h4>";
      string += "<h4>Ability: " + data["ability"] + "</h4>";
      string += "<h4>Attack: " + data["attack"] + "</h4>";
      string += "<h4>Defense: " + data["defense"] + "</h4>";
      string += "<h4>Speed: " + data["speed"] + "</h4>";
    $(infoDiv).html(string);
    $(`#${data.id}`).append(infoDiv);

    });
  });

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