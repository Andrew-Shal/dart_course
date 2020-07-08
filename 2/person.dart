void main(){
  var name = myName();
  print('My Name is ${name}');

  var andrew = new Person('Andrew');
  andrew.printName();
}

String myName(){
  return 'Andrew';
}

class Person{
  Person(String fName){
    this.firstName = fName;
  }
  String firstName;
  
  void printName(){
    print(this.firstName);
  }
}