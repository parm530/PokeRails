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
});