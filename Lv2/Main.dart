import 'dart:io';

import 'Qlsv.dart';

void main() {
  int chon;
  Qlsv ql = Qlsv();
  do {
    print('===========================');
    print('1. Thêm sinh viên');
    print('2. Hiển thị danh sách sinh viên');
    print('3. Tìm sinh viên theo mã');
    print('4. Xoá sinh viên theo mã');
    print('5. Cập nhật sinh viên theo mã');
    print('6. Tìm sinh viên theo khoảng tuổi');
    print('7. Sắp xếp nhân viên theo họ tên');
    print('8. Sắp xếp nhân viên theo tuổi');
    print('9. Hiển thị 5 sinh viên giỏi');
    print('10. Khởi tạo danh sách sinh viên');
    print('0. Thoát chương trình');
    print('===========================');
    stdout.write('Chọn chức năng[0-10]: ');
    chon = int.parse(stdin.readLineSync()!);

    switch (chon) {
      case 1:
        ql.addStudents();
        break;
      case 2:
        ql.seeList();
        break;
      case 3:
        ql.searchStudent();
        break;
      case 4:
        ql.deleteStudent();
        break;
      case 5:
        ql.updateStudent();
        break;
      case 6:
        ql.searchAgeStudent();
        break;
      case 7:
        ql.sortNameStudent();
        break;
      case 10:
        ql.initializeStudents();
        break;
      default:
    }
  } while (chon != 0);
}
