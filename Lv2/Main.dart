import 'dart:io';

void main() {
  int chon;

  do {
    print('===========================');
    print('1. Đây là gì?');
    print('0. Thoát chương trình');
    print('===========================');
    stdout.write('Chọn chức năng[0-10]: ');
    chon = int.parse(stdin.readLineSync()!);

    switch (chon) {
      case 1:
        break;
      case 2:
        break;
      default:
    }
  } while (chon != 0);
}
