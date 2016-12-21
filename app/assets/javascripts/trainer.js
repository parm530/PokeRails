class Trainer {

  constructor(data_attributes){
    this.name = data_attributes.name;
  };

  trainerName() {
    return "<h4><li>" + this.name + "</li></h4>";
  };

  append(node, string) {
    return $(node).html(string);
  };

}