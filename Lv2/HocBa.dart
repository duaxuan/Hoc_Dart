import 'dart:io';
// import 'Interface.dart';
import 'Mixin.dart';
import 'SinhVien.dart';

class HocBa extends SinhVien /* implements Interface */ with Mixin {
  late double _diem;
  late String _hanhKiem = 'Tốt';

  HocBa();

  HocBa.add(String maSv, String tenSv, int tuoi, String lop, this._diem,
      [this._hanhKiem = 'Tốt'])
      : super.add(maSv, tenSv, tuoi, lop);

  // Getter ande setter
  double get diem => _diem;
  set diem(double diem) => _diem = diem;

  String get hanhKiem => _hanhKiem;
  set hanhKiem(String hanhKiem) => _hanhKiem = hanhKiem;

  @override
  void nhap() {
    super.nhap();
    stdout.write('Nhập điểm sinh viên: ');
    _diem = double.parse(stdin.readLineSync()!);
  }

  String getXepLoai() {
    late String xepLoai;

    if (diem >= 8.0 && hanhKiem == 'Tốt') {
      xepLoai = 'Giỏi';
    } else if (diem >= 6.5 && diem < 8.0 && hanhKiem == 'Tốt') {
      xepLoai = 'Khá';
    } else if (diem >= 5.0 && diem < 6.5 && hanhKiem == 'Tốt') {
      xepLoai = 'Trung bình';
    } else {
      xepLoai = 'Yếu';
    }
    return xepLoai;
  }

  @override
  String toString() {
    return '${super.toString()}, Học bạ {Điểm= $_diem, Hạnh kiểm= $_hanhKiem, Xếp loại: ${getXepLoai().toString()} }';
  }

  // Demo abstract
  @override
  void demo_abstract1() {
    // TODO: implement demo_abstract1
  }

  @override
  void demo_abstract2() {
    // TODO: implement demo_abstract2
  }

  // Demo Interface
  // @override
  // void demo_interface1() {
  //   // TODO: implement demo_interface1
  // }

  // @override
  // void demo_interface2() {
  //   // TODO: implement demo_interface2
  // }

  // @override
  // void demo_interface3() {
  //   // TODO: implement demo_interface3
  // }
}
