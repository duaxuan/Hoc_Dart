import 'dart:io';
import 'dart:math';

void main() {
  int choice;
  do {
    print('===========================');
    print('1. Mừng thọ 100 tuổi');
    print('2. Kiểm tra số chẵn/lẻ');
    print('3. Liệt kê số nguyên dương lẻ nhỏ hơn 100');
    print('4. Liệt kê số nguyên dương lẻ nhỏ hơn 100, loại trừ 5, 7, 93');
    print('5. Tìm số lớn nhất trong ba số thực');
    print('6. Kiểm tra hai số thực có cùng dấu hay không');
    print('7. Đọc số nguyên thành chữ');
    print('8. Đoán số');
    print('9. Thông tin sinh viên');
    print('10. Thông tin người dùng');
    print('0. Thoát chương trình');
    print('===========================');
    stdout.write('Chọn chức năng[0-10]: ');
    choice = int.tryParse(stdin.readLineSync()!) ?? 0;

    switch (choice) {
      case 1:
        celebrate100Years();
        break;
      case 2:
        checkEvenOrOdd();
        break;
      case 3:
        printOddNumbers();
        break;
      case 4:
        printOddNumbersExceptSpecific();
        break;
      case 5:
        findMaxNumber();
        break;
      case 6:
        checkSameSign();
        break;
      case 7:
        readNumber();
        break;
      case 8:
        guessNumber();
        break;
      case 9:
        studentScores();
        break;
      case 10:
        userInfo();
        break;
      default:
        if (choice != 0) print('Lựa chọn không hợp lệ. Vui lòng chọn lại!');
    }
  } while (choice != 0);
}

void celebrate100Years() {
  stdout.write('Nhập họ tên của bạn: ');
  String name = stdin.readLineSync()!;
  stdout.write('Nhập số tuổi của bạn: ');
  int age = int.tryParse(stdin.readLineSync()!) ?? 0;

  print(
      'Xin chào $name, kết quả: ${age == 100 ? 'Mừng thọ cụ ạ!' : 'Bạn còn ${100 - age} để được mừng thọ'}\n');
}

void checkEvenOrOdd() {
  stdout.write('Nhập 1 số nguyên: ');
  int number = int.tryParse(stdin.readLineSync()!) ?? 0;
  print(number % 2 == 0 ? 'Số $number là số chẵn' : 'Số $number là lẻ');
}

void printOddNumbers() {
  print('Các số nguyên dương lẻ nhỏ hơn 100 là: ');
  for (var i = 1; i < 100; i += 2) {
    print(i);
  }
}

void printOddNumbersExceptSpecific() {
  final excludedNumbers = [5, 7, 93];
  print('Các số nguyên dương lẻ nhỏ hơn 100 trừ các số 5, 7, 93 là: ');
  for (var i = 1; i < 100; i += 2) {
    if (!excludedNumbers.contains(i)) {
      print(i);
    }
  }
}

void findMaxNumber() {
  double a, b, c;
  stdout.write('Nhập số a: ');
  a = double.tryParse(stdin.readLineSync()!) ?? 0;
  stdout.write('Nhập số b: ');
  b = double.tryParse(stdin.readLineSync()!) ?? 0;
  stdout.write('Nhập số c: ');
  c = double.tryParse(stdin.readLineSync()!) ?? 0;

  double max = a;
  if (max < b) max = b;
  if (max < c) max = c;

  print('Số lớn nhất là $max');
}

void checkSameSign() {
  double a, b;
  stdout.write('Nhập số a: ');
  a = double.tryParse(stdin.readLineSync()!) ?? 0;
  stdout.write('Nhập số b: ');
  b = double.tryParse(stdin.readLineSync()!) ?? 0;

  print(a * b > 0 ? 'Hai số $a và $b có cùng dấu' : 'Hai số $a và $b trái dấu');
}

void readNumber() {
  stdout.write('Nhập số nguyên: ');
  int n = int.tryParse(stdin.readLineSync()!) ?? 0;

  List<String> chu_thuong = [
    'không',
    'một',
    'hai',
    'ba',
    'bốn',
    'năm',
    'sáu',
    'bảy',
    'tám',
    'chín'
  ];
  List<String> chu_hoa = [
    'Không',
    'Một',
    'Hai',
    'Ba',
    'Bốn',
    'Năm',
    'Sáu',
    'Bảy',
    'Tám',
    'Chín'
  ];

  print(n % 10 == 0
      ? '${chu_hoa[n ~/ 100]} trăm ${chu_thuong[(n - (n ~/ 100) * 100) ~/ 10]} mươi.'
      : '${chu_hoa[n ~/ 100]} trăm ${chu_thuong[(n - (n ~/ 100) * 100) ~/ 10]} mươi ${chu_thuong[n % 10]}');
}

void guessNumber() {
  final random = Random().nextInt(100);
  print(random);

  do {
    stdout.write('Nhập số dự đoán: ');
    int n = int.tryParse(stdin.readLineSync()!) ?? 0;

    if (n < random) {
      print('Số bạn nhập thấp hơn số của chúng tôi!');
    } else if (n > random) {
      print('Số bạn nhập lớn hơn số của chúng tôi!');
    } else {
      print('Chúc mừng bạn đã trúng xổ số');
      break;
    }
  } while (true);
}

class Student {
  String? name;
  int? score;

  Student(this.name, this.score);
}

void studentScores() {
  List<Student> students = [];

  stdout.write('Nhập số lượng sinh viên: ');
  int count = int.tryParse(stdin.readLineSync()!) ?? 0;

  for (var i = 0; i < count; i++) {
    stdout.write('Nhập họ tên sinh viên ${i + 1}: ');
    String name = stdin.readLineSync()!;
    stdout.write('Nhập điểm sinh viên ${i + 1}: ');
    int point = int.tryParse(stdin.readLineSync()!) ?? 0;

    students.add(Student(name, point));
  }

  print('Thông tin của ${students.length} sinh viên');
  for (var st in students) {
    print('Họ tên: ${st.name}, điểm: ${st.score}');
  }

  print('Thông tin sinh viên có điểm < 5');
  for (var st in students) {
    if (st.score! < 5) {
      print('Họ tên: ${st.name}, điểm: ${st.score}');
    }
  }
}

void userInfo() {
  Map<String, dynamic> information = {};

  stdout.write('Nhập tên của bạn: ');
  String name = stdin.readLineSync()!;
  stdout.write('Nhập tuổi của bạn: ');
  int age = int.tryParse(stdin.readLineSync()!) ?? 0;
  stdout.write('Nhập địa chỉ của bạn: ');
  String address = stdin.readLineSync()!;

  information['name'] = name;
  information['age'] = age;
  information['address'] = address;

  print('Thông tin người dùng:');
  information.forEach((key, value) {
    print('$key: $value');
  });
}

void tham_so_bat_buoc(String name) {
  print('Họ tên: $name');
}

void tham_so_mac_dinh(String name, [int? age, String? address]) {
  print('Họ tên: $name, Tuổi: $age, Địa chỉ: $address');
}

void tham_so_tuy_chon(String name,
    {int age = 15, String address = 'Thanh Hoa'}) {
  print('Họ tên: $name, Tuổi: $age, Địa chỉ: $address');
}
