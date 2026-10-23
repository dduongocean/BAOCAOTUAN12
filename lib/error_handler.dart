import 'package:flutter/material.dart';

// ============================================================================
// PHẦN PHỤ TRÁCH: VŨ DUY DƯƠNG
// NỘI DUNG: XỬ LÝ LỖI, CUSTOM EXCEPTION, GENERICS VÀ HÀM BAO BỌC GOM LỖI (WRAPPER)
// ============================================================================

/// 1. ĐỊNH NGHĨA LỖI TÙY BIẾN (CUSTOM EXCEPTION)
/// Kế thừa `Exception` để mang thông điệp lỗi thân thiện gửi tới người dùng.
class MyException implements Exception {
  final String message;
  MyException(this.message);

  @override
  String toString() => message;
}

/// 2. GENERICS CƠ BẢN: KHO LƯU TRỮ `DataStore<T>`
/// Sử dụng ký hiệu tham số kiểu `<T>` để lưu trữ danh sách đối tượng bất kỳ.
class DataStore<T> {
  final List<T> items = [];

  void add(T item) => items.add(item);
  void clear() => items.clear();
}

/// 3. HÀM BAO BỌC (WRAPPER) BẮT & GOM LỖI TẬP TRUNG - CHỐNG CRASH ỨNG DỤNG
/// Áp dụng cấu trúc chuẩn: `try - on - catch - finally`
void safeRun(BuildContext context, VoidCallback action) {
  try {
    // A. Khối TRY: Chạy hành động nghiệp vụ có nguy cơ lỗi
    action();
  } on MyException catch (e) {
    // B. Mệnh đề ON - CATCH: Bắt đúng loại Custom Exception đã biết
    // Hiển thị thông báo cảnh báo màu cam thân thiện cho người dùng
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('⚠️ Lỗi nghiệp vụ: $e'),
        backgroundColor: Colors.orange.shade800,
        behavior: SnackBarBehavior.floating,
      ),
    );
  } catch (e) {
    // C. Mệnh đề CATCH TỔNG QUÁT: Bắt tất cả các lỗi hệ thống bất ngờ khác
    // Đây là chốt chặn giúp ứng dụng KHÔNG BAO GIỜ BỊ DỪNG ĐỘT NGỘT (CRASH)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('❌ Lỗi hệ thống: $e'),
        backgroundColor: Colors.red.shade800,
        behavior: SnackBarBehavior.floating,
      ),
    );
  } finally {
    // D. Khối FINALLY: Luôn luôn thực thi dù thành công hay xảy ra ngoại lệ
    // ignore: avoid_print
    print('🏁 [FINALLY]: Hoàn thành bước kiểm tra an toàn.');
  }
}
