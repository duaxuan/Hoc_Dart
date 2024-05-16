import 'dart:io';
import 'HocBa.dart';

class Qlsv {
  List<HocBa> list = [];

  void addStudents() {
    while (true) {
      HocBa hb = HocBa();
      hb.nhap();

      if (_isDuplicateStudent(hb.maSv)) {
        print('Lỗi mã sinh viên đã tồn tại, vui lòng điền mã khác!');
      } else {
        list.add(hb);
      }

      if (!_askContinue('Bạn có muốn nhập thêm sinh viên (Y/N): ')) {
        break;
      }
    }
  }

  void seeList() {
    if (list.isEmpty) {
      print('Chưa có học sinh nào trong danh sách!');
    } else {
      list.forEach((hb) => print(hb.toString()));
    }
  }

  void searchStudent() {
    if (list.isEmpty) {
      print('Chưa có học sinh nào trong danh sách!');
      return;
    }

    stdout.write('Nhập mã sinh viên cần tìm: ');
    String search = stdin.readLineSync()!;

    HocBa? foundSv = _findStudentById(search);

    if (foundSv != null) {
      print('Tìm thấy sinh viên có mã số $search');
      print(foundSv.toString());
    } else {
      print('Không tìm thấy sinh viên nào có mã số $search');
    }
  }

  void deleteStudent() {
    if (list.isEmpty) {
      print('Chưa có học sinh nào trong danh sách!');
      return;
    }

    stdout.write('Nhập mã sinh viên cần xoá: ');
    String search = stdin.readLineSync()!;

    HocBa? foundSv = _findStudentById(search);

    if (foundSv != null) {
      list.remove(foundSv);
      print('Xoá thành công sinh viên có mã số $search');
    } else {
      print('Không tìm thấy sinh viên nào có mã số $search');
    }
  }

  void updateStudent() {
    if (list.isEmpty) {
      print('Chưa có học sinh nào trong danh sách!');
      return;
    }

    stdout.write('Nhập mã sinh viên cần sửa: ');
    String search = stdin.readLineSync()!;

    int index =
        list.indexWhere((sv) => sv.maSv.toUpperCase() == search.toUpperCase());

    if (index != -1) {
      print('Tìm thành công sinh viên có mã số $search');
      list[index].nhap();
      print('Cập nhật thành công');
    } else {
      print('Không tìm thấy sinh viên nào có mã số $search');
    }
  }

  void searchAgeStudent() {
    if (list.isEmpty) {
      print('Chưa có học sinh nào trong danh sách!');
      return;
    }

    stdout.write('Nhập khoảng tuổi bé nhất: ');
    int ageA = int.parse(stdin.readLineSync()!);
    stdout.write('Nhập khoảng tuổi lớn nhất: ');
    int ageB = int.parse(stdin.readLineSync()!);

    print('Danh sách sinh viên có tuổi [$ageA - $ageB]');
    for (HocBa sv in list) {
      if (sv.tuoi >= ageA && sv.tuoi <= ageB) {
        print(sv.toString());
      }
    }
  }

  void sortNameStudent() {
    list.sort((o1, o2) => o1.tenSv.compareTo(o2.tenSv));
    for (HocBa sv in list) {
      print(sv.toString());
    }
  }

  void sortAgeStudent() {
    list.sort((o1, o2) => o1.tuoi.compareTo(o2.tuoi));
    for (HocBa sv in list) {
      print(sv.toString());
    }
  }

  void seeGoodList() {
    list.sort((o1, o2) => o2.diem.compareTo(o1.diem));

    for (var i = 0; i < 5 && i < list.length; i++) {
      if (list[i].getXepLoai() == 'Giỏi') {
        print(list[i].toString());
      }
    }
  }

  void demo_mixin() {
    HocBa hb = HocBa();
    hb.demo_mixin();
  }

  void initializeStudents() {
    list.addAll([
      HocBa.add('PH1', 'Nguyễn Thị Hương', 20, 'MD1122', 7.3),
      HocBa.add('PH2', 'Lê Như Độ', 22, 'MOB2233', 8.4),
      HocBa.add('PH3', 'Lê Chí Cường', 21, 'XD3344', 9.2),
      HocBa.add('PH4', 'Nguyễn Xuân Duẫn', 22, 'MOB2233', 7.5),
      HocBa.add('PH5', 'Lê Thị Thanh', 19, 'MD1122', 8.0),
      HocBa.add('PH6', 'Ma Văn Khoa', 20, 'XD3344', 9.5),
      HocBa.add('PH7', 'Đinh Nhu Hương', 18, 'MD1122', 7.9),
      HocBa.add('PH8', 'Hoàng Văn Minh', 22, 'XD3344', 8.0),
      HocBa.add('PH9', 'Nguyễn Văn Nam', 21, 'MOB2233', 9.0),
      HocBa.add('PH10', 'Nguyễn Hoàng Anh', 23, 'XD3344', 8.6),
    ]);
    print('Khởi tạo thành công');
  }

  // Private helper methods
  bool _isDuplicateStudent(String maSv) {
    return list.any((sv) => sv.maSv.toUpperCase() == maSv.toUpperCase());
  }

  bool _askContinue(String message) {
    stdout.write(message);
    String response = stdin.readLineSync()!;
    return response.toUpperCase() != 'N';
  }

  HocBa? _findStudentById(String maSv) {
    return list.firstWhere(
      (hb) => hb.maSv.toUpperCase() == maSv.toUpperCase(),
    );
  }
}
