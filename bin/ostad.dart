abstract class Role {
  void displayRole();
}

class Person {
  String name;
  int age;
  String address;
  Role  ? role;

  Person(this.name, this.age,this.address);

  String get getName => name;
  int get getAge => age;
  String get getAddress => address;

  void DisplayInfo() {
    role?.displayRole();
    print("Name: $name");
    print("Age: $age");
    print("Address: $address");
  }
}

class Student extends Person implements Role {
  late String studentID;
  late double grade;
  late List<int> courseScores;

  Student(super.name, super.age, super.address, this.studentID,this.grade,this.courseScores);

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
  }
  @override
  void DisplayInfo() {
    displayRole();
    super.DisplayInfo();
    print("Average Score: ${calculateAverageScore().toStringAsFixed(2)}");

  }

}

class Teacher extends Person implements Role{
  late String teacherID;
  late List<String> coursesTaught;

  Teacher(super.name, super.age, super.address,this.teacherID,this.coursesTaught);


  void displayCoursesTaught() {
    print("Courses Taught: \n- ${coursesTaught.join("\n- ")}");
  }

  @override
  void displayRole() {
    print("Role: Teacher");
  }
  @override
  void DisplayInfo() {
    print("\nTeacher Information: ");
    displayRole();
    super.DisplayInfo();
    displayCoursesTaught();
  }
}

void main() {
  Student student = Student("John Doe", 20, "123 Main St","20-4536-3",3.85, [85, 90, 78, 92]);
  student.DisplayInfo();

  Teacher teacher = Teacher("Mrs. Smith", 35, "456 Oak St.","20-45361", ["Math", "English", "Bangla"]);
  teacher.DisplayInfo();
}