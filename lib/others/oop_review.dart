void main() {
  // إنشاء كائن من Student
  Student s1 = Student("Mostafa", 22, "CS");

  s1.displayInfo();
  s1.study();

  // Polymorphism
  Person p = Teacher("Ali", 40, "Math");
  p.displayInfo();
}

// ====== Class أساسي ======
class Person {
  // Encapsulation (خصائص خاصة)
  String _name;
  int _age;

  // Constructor
  Person(this._name, this._age);

  // Getter
  String get name => _name;

  // Setter
  set name(String value) {
    if (value.isNotEmpty) {
      _name = value;
    }
  }

  // Method
  void displayInfo() {
    print("Name: $_name, Age: $_age");
  }
}

// ====== Inheritance ======
class Student extends Person {
  String major;

  Student(String name, int age, this.major) : super(name, age);

  void study() {
    print("$name is studying $major");
  }

  // Overriding
  @override
  void displayInfo() {
    print("Student: $name, Age: $_age, Major: $major");
  }
}

// ====== Abstract Class ======
abstract class Employee {
  void work(); // abstract method
}

// ====== Multiple Inheritance باستخدام implements ======
class Teacher extends Person implements Employee {
  String subject;

  Teacher(String name, int age, this.subject) : super(name, age);

  @override
  void work() {
    print("$name is teaching $subject");
  }

  @override
  void displayInfo() {
    print("Teacher: $name, Subject: $subject");
  }
}
