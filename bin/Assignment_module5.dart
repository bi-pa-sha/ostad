abstract class Role {
  void displayRole();
}

class Person implements Role{
  String name;
  int age;
  String address;
  late Role role;

  Person(this.name, this.age,this.address);

  String get getName => name;
  int get getAge => age;
  String get getAddress => address;

  @override
  void displayRole() {
    print("Name: $name");
    print("Age: $age");
    print("Address: $address");
  }
}

class Student extends Person {
  late String studentID;
  late String grade;
  late List<int> courseScores;

  Student(super.name, super.age, super.address,this.courseScores);

  double calculateAverageScore() {
    double totalScore = 0;
    for(int i=0; i<courseScores.length; i++ ){
      totalScore = totalScore + courseScores[i];
    }
    double avgScore = totalScore/courseScores.length;
    return avgScore;
  }

  @override
  void displayRole() {
    print("Role: Student");
    super.displayRole();
    print("Average Score: ${calculateAverageScore().toStringAsFixed(2)}");
  }
}

class Teacher extends Person{
  late String teacherID;
  late List<String> coursesTaught;

  Teacher(super.name, super.age, super.address,this.coursesTaught);


  void displayCoursesTaught() {
    print("Courses Taught: $coursesTaught");
  }

  @override
  void displayRole() {
    print("\nTeacher Information: \nRole: Teacher");
    super.displayRole();
    displayCoursesTaught();
  }

}

class StudentManagementSystem {

}

void main() {
  Student std = Student("John Doe", 20, "123 Main St", [85, 90, 78, 92]);
  std.displayRole();

  Teacher teacher = Teacher("Mrs. Smith", 35, "456 Oak St.", ["Math", "English", "Bangla"]);
  teacher.displayRole();

}
