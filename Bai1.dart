import 'dart:io';
import 'dart:math';

void bai1() {
  stdout.write('Nhập họ tên của bạn: ');
  String name = stdin.readLineSync()!;

  stdout.write('Nhập số tuổi của bạn: ');
  int age = int.parse(stdin.readLineSync()!);

  print(
      'Xin chào $name, kết quả: ${age == 100 ? 'Mừng thọ cụ ạ!' : 'Bạn còn ${100 - age} để được mừng thọ'}\n');
}

void bai2() {
  stdout.write('Nhập 1 số nguyên: ');
  int number = int.parse(stdin.readLineSync()!);

  print(number % 2 == 0 ? 'Số $number là số chẵn' : 'Số $number là lẻ');
}

void bai3() {
  print('Các số nguyển dương lẻ nhỏ hơn 100 là: ');
  for (var i = 0; i < 100; i++) {
    if (i % 2 != 0) {
      print(i);
    }
  }
}

void bai4() {
  print('Các số nguyển dương lẻ nhỏ hơn 100(#5, 7, 93) là: ');
  for (var i = 0; i < 100; i++) {
    if (i % 2 != 0 && i != 5 && i != 7 && i != 93) {
      print(i);
    }
  }
}

void bai5() {
  double a, b, c;
  stdout.write('Nhâp số a: ');
  a = double.parse(stdin.readLineSync()!);
  stdout.write('Nhâp số b: ');
  b = double.parse(stdin.readLineSync()!);
  stdout.write('Nhâp số c: ');
  c = double.parse(stdin.readLineSync()!);

  double max = a;
  if (max < b) {
    max = b;
  }
  if (max < c) {
    max = c;
  }

  print('Số lớn nhất là $max');
}

void bai6() {
  double a, b;
  stdout.write('Nhâp số a: ');
  a = double.parse(stdin.readLineSync()!);
  stdout.write('Nhâp số b: ');
  b = double.parse(stdin.readLineSync()!);

  print(a * b > 0 ? 'Hai số $a và $b có cùng dấu' : 'Hai số $a và $b trái dấu');
}

void bai7() {
  stdout.write('Nhập số nguyên: ');
  int n = int.parse(stdin.readLineSync()!);

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
      ],
      chu_hoa = [
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

void bai8() {
  final random = Random().nextInt(100);
  print(random);

  do {
    stdout.write('Nhập số dự đoán: ');
    int n = int.parse(stdin.readLineSync()!);

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

class Studens {
  String? name;
  int? point;

  Studens(this.name, this.point);
}

void bai9() {
  List<Studens> studens = [];

  stdout.write('Nhập số lượng sinh viên: ');
  int count = int.parse(stdin.readLineSync()!);

  for (var i = 0; i < count; i++) {
    stdout.write('Nhập họ tên sinh viên ${i + 1}: ');
    String name = stdin.readLineSync()!;

    stdout.write('Nhập điểm sinh viên ${i + 1}: ');
    int point = int.parse(stdin.readLineSync()!);

    studens.add(Studens(name, point));
  }

  print('Thông tin ${studens.length} sinh viên');
  for (var st in studens) {
    print('Họ tên: ${st.name}, điểm: ${st.point}');
  }
  print('Thông tin sinh viên có số điểm < 5');
  for (var st in studens) {
    if (st.point! < 5) {
      print('Họ tên: ${st.name}, điểm: ${st.point}');
    }
  }
}

void bai10() {
  Map<dynamic, dynamic> infomation = {};

  stdout.write('Nhập tên của bạn: ');
  String name = stdin.readLineSync()!;
  stdout.write('Nhập tuổi của bạn: ');
  int age = int.parse(stdin.readLineSync()!);
  stdout.write('Nhập city của bạn: ');
  String city = stdin.readLineSync()!;

  infomation['name'] = name;
  infomation['age'] = age;
  infomation['city'] = city;

  infomation.forEach((key, value) {
    print('$key: $value');
  });

  List<dynamic> list = infomation.keys.toList();
  list.forEach((key) {
    print('$key: ${list[key]}');
  });
}

void main() {
  int? chon;
  do {
    print('===========================');
    print('1. Mừng thọ 100 tuổi');
    print('2. Số nguyên đó là số chẵn hay lẻ');
    print('3. Số nguyên dương lẻ nhỏ hơn 100');
    print('4. Số lẻ nhỏ hơn 100 trừ các số 5, 7, 93');
    print('5. Số lớn nhất trong ba số thực a, b, c');
    print('6. Số thực a b cho trước có cùng dấu hay không');
    print('7. Đọc của một số nguyên');
    print('8. Đoán số');
    print('9. Điểm sinh viên lớn hơn 5');
    print('10. Thông tin người dùng');
    print('0. Dừng cuộc chơi @@');
    print('===========================');
    stdout.write('Chọn chức năng[0-10]: ');
    chon = int.parse(stdin.readLineSync()!);

    switch (chon) {
      case 1:
        bai1();
        break;
      case 2:
        bai2();
        break;
      case 3:
        bai3();
        break;
      case 4:
        bai4();
        break;
      case 5:
        bai5();
        break;
      case 6:
        bai6();
        break;
      case 7:
        bai7();
        break;
      case 8:
        bai8();
        break;
      case 9:
        bai9();
        break;
      case 10:
        bai10();
        break;
      default:
        print('Lựa chọn không chính xác vui lòng nhập lại!');
    }
  } while (chon != 0);
}
