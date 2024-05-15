import 'dart:io';

class SinhVien {
  late String _maSv, _tenSv, _lop;
  late int _tuoi;

  // Constructor
  SinhVien();

  SinhVien.add(this._maSv, this._tenSv, this._tuoi, this._lop);

  // Getters and setters
  String get maSv => _maSv;
  set maSv(String maSv) => _maSv = maSv;

  String get tenSv => _tenSv;
  set tenSv(String tenSv) => _tenSv = tenSv;

  int get tuoi => _tuoi;
  set tuoi(int tuoi) => _tuoi = tuoi;

  String get lop => _lop;
  set lop(String lop) => _lop = lop;

  // Input method
  void nhap() {
    stdout.write('Nhập mã sinh viên: ');
    _maSv = stdin.readLineSync()!;

    stdout.write('Nhập họ tên sinh viên: ');
    _tenSv = stdin.readLineSync()!;

    stdout.write('Nhập tuổi sinh viên: ');
    _tuoi = int.parse(stdin.readLineSync()!);

    stdout.write('Nhập lớp sinh viên: ');
    _lop = stdin.readLineSync()!;
  }

  @override
  String toString() {
    return 'Sinh viên {Mã SV= $_maSv, Họ tên= $_tenSv, Tuổi= $_tuoi, Lớp= $_lop}';
  }
}
