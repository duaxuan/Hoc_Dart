import 'dart:io';
import 'SinhVien.dart';

class Qlsv {
  List<SinhVien> list = [];

  void addStudents() {
    while (true) {
      SinhVien sv = SinhVien();
      sv.nhap();

      if (_isDuplicateStudent(sv.maSv)) {
        print('Lỗi mã sinh viên đã tồn tại, vui lòng điền mã khác!');
      } else {
        list.add(sv);
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
      list.forEach((sv) => print(sv.toString()));
    }
  }

  void searchStudent() {
    if (list.isEmpty) {
      print('Chưa có học sinh nào trong danh sách!');
      return;
    }

    stdout.write('Nhập mã sinh viên cần tìm: ');
    String search = stdin.readLineSync()!;

    SinhVien? foundSv = _findStudentById(search);

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

    SinhVien? foundSv = _findStudentById(search);

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
    for (SinhVien sv in list) {
      if (sv.tuoi >= ageA && sv.tuoi <= ageB) {
        print(sv.toString());
      }
    }
  }

  void initializeStudents() {
    list.addAll([
      SinhVien.add('PH1', 'Nguyễn Thị Hương', 20, 'MD1122'),
      SinhVien.add('PH2', 'Lê Như Độ', 22, 'MOB2233'),
      SinhVien.add('PH3', 'Lê Chí Cường', 21, 'XD3344')
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

  SinhVien? _findStudentById(String maSv) {
    return list.firstWhere(
      (sv) => sv.maSv.toUpperCase() == maSv.toUpperCase(),
    );
  }
}
