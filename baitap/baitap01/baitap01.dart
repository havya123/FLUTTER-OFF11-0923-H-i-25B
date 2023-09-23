import 'dart:io';

void main(List<String> args) {
  // List<int> arr = [3, 6, 8, 1, 9, 2, 12, 22, 5, 11];
  // var arr1 = arr.where((element) => element > 8).reduce(min);
  // print(arr1);

  // Viết chương trình sắp xếp một mảng số nguyên theo thứ tự giảm dần và nhân 2 tất cả phần tử trong mảng
  //  => List<int> arr = [5, 2, 7, 3, 9, 8];

  // List<int> arr = [5, 2, 7, 3, 9, 8];
  // var a = arr.map((e) => e * 2).toList()..sort((a, b) => b.compareTo(a));

  print("Input your name: ");
  String? name = stdin.readLineSync();
  print("Input your age: ");
  int age = stdin.readByteSync();
  int ageToGet100 = 100 - age;
  print("Your name is $name and you need $ageToGet100 to get 100 years old");

}
