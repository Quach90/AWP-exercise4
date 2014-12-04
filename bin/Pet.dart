library pet;

abstract class Pet {
  var _name;
  
  String get getName => _name;
  
  Pet(this._name);
}
