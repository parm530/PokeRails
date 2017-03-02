function Trainer(attr){
  this.first_name = attr.first_name;
  this.last_name = attr.last_name;
  this.id = attr.id;
  // this.trainerName = function(){
  //   return "<h4><li>" + this.name + "</li></h4>";
  // }

}

Trainer.prototype.trainerName = function(){
  return '<h4><li class="trainer-li" id="'+ this.id + '">' + this.first_name + ' ' + this.last_name+ "</li></h4>";
}

Trainer.prototype.append = function(node, string){
    return $(node).html(string);
}

// class Trainer {

//   constructor(attr){
//     this.name = attr.name;
//   };

//   trainerName() {
//     return "<h4><li>" + this.name + "</li></h4>";
//   };

//   append(node, string) {
//     // debugger;
//     return $(node).html(string);
//   };

// }

class Pokemon {

  constructor(attr) {
    this.name = attr.name;
    this.ability = attr.ability;
    this.move1 = attr.move1;
    this.move2 = attr.move2;
    this.move3 = attr.move3;
    this.move4 = attr.move4;
    this.attack = attr.attack;
    this.defense = attr.defense;
    this.speed = attr.speed;
    this.types = attr.types;
    this.image_link = attr.image_link;
  }

  stats() {
    var string = "<br><br><br><h4>Type(s): " + this.types + "</h4>";
    string += "<h4>Ability: " + this.ability + "</h4>";
    string += "<h4>Attack: " + this.attack + "</h4>";
    string += "<h4>Defense: " + this.defense + "</h4>";
    string += "<h4>Speed: " + this.speed + "</h4>";
    return string;
  }

}