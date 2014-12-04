// Copyright (c) 2014, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'pet.dart';

main() {
  var hund = new Dog("Lars");
  var kat = new Cat("Lis");
  //var test = new Pet("Fis");
  print(hund.getName);
  //print(hund._name);
  print(hund.sound());
  print(kat.sound());
}


class Dog extends Pet {
  Dog(String n) : super(n);
  String sound(){
    return "Wuf";
  }
}

class Cat extends Pet {
  Cat(String n) : super(n);
  String sound(){
    return "Meow";
  }
}
