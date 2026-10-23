# BÁO CÁO CHUYÊN ĐỀ DART & FLUTTER
## CHỦ ĐỀ 01: NỀN TẢNG OOP NÂNG CAO & XỬ LÝ LỖI TRONG DART
### MODULE QUẢN LÝ DỮ LIỆU & BỘ GOM LỖI TẬP TRUNG (FAIL-SAFE)

> **Giảng viên hướng dẫn:** TS. Nguyễn Duy Nhật Viễn  
> **Khoa:** Điện tử - Viễn thông, Trường Đại học Bách Khoa – Đại học Đà Nẵng  
> **Học phần:** Lập trình đa nền tảng (Tuần 10 - 11 - 12)  
> **Nhóm thực hiện:** Vũ Duy Dương & Phan Vĩnh Sơn  

---

### 1. Phân công nhiệm vụ nhóm (WBS - 2 Thành viên tương ứng 4 file)

| Thành viên | Vai trò | Tệp phụ trách trong `lib/` | Nội dung đảm nhiệm |
|:---|:---|:---|:---|
| **Vũ Duy Dương** | Core Logic & Exception Architecture | [`lib/error_handler.dart`](lib/error_handler.dart) | - Định nghĩa Custom Exception `MyException`.<br>- Xây dựng hàm bao bọc (wrapper) `safeRun()` gom lỗi tập trung theo cấu trúc `try - on - catch - finally`.<br>- Thiết kế Generic DataStore `DataStore<T>`.<br>- Viết Unit Test kiểm thử logic (`test/widget_test.dart`). |
| **Phan Vĩnh Sơn** | OOP Modeling, Mixin & Presentation | [`lib/product_model.dart`](lib/product_model.dart) | - Xây dựng lớp `Product` với **Named Constructor** (`Product.free`) và **Factory Constructor** (`Product.fromJson`).<br>- Xây dựng `LoggerMixin` tự động in log ghi vết.<br>- Viết Service `ProductService with LoggerMixin`.<br>- Soạn tài liệu thuyết trình (`HUONG_DAN_THUYET_TRINH.md`). |
| **Cả 2 Thành viên** | Phối hợp UI & Demo | [`lib/home_screen.dart`](lib/home_screen.dart)<br>[`lib/main.dart`](lib/main.dart) | - Thiết kế giao diện `HomeScreen` tối giản, trực quan.<br>- Tạo 4 nút bấm kiểm thử kịch bản tương tác (Thành công, Lỗi Validation, Lỗi Crash được bảo vệ).<br>- Khởi chạy ứng dụng qua `main.dart`. |

---

### 2. Cấu trúc Source Code (Tách 4 tệp rõ ràng, tối ưu cho người mới học)

```text
lib/
├── error_handler.dart   # [Vũ Duy Dương]: Custom Exception, Generic DataStore<T> & Hàm bao bọc (Wrapper) safeRun
├── product_model.dart   # [Phan Vĩnh Sơn]: Model Product (Named & Factory Constructor), LoggerMixin & Service
├── home_screen.dart     # [Phối hợp]: Giao diện người dùng (UI) & 4 nút bấm Demo thử nghiệm kịch bản
└── main.dart            # [Entry Point]: Điểm khởi chạy ứng dụng Flutter MaterialApp
```

---

### 3. Tóm tắt các điểm kỹ thuật cốt lõi

#### A. Phần của Vũ Duy Dương (`error_handler.dart`)
- **Custom Exception (`MyException`)**: Kế thừa `Exception` để mang thông điệp lỗi thân thiện gửi tới người dùng.
- **Generics cơ bản (`DataStore<T>`)**: Kho lưu trữ dùng ký hiệu `<T>`, tái sử dụng an toàn kiểu cho bất kỳ đối tượng nào.
- **Hàm bao bọc (Wrapper) `safeRun`**:
  - `try`: Bao bọc lệnh nghiệp vụ.
  - `on MyException`: Bắt lỗi tùy biến -> hiện SnackBar cam.
  - `catch (e)`: Bắt mọi lỗi runtime bất ngờ -> hiện SnackBar đỏ, **ứng dụng không bao giờ bị dừng đột ngột (crash)**.
  - `finally`: Luôn luôn chạy để dọn dẹp hoặc in log kết thúc.

#### B. Phần của Phan Vĩnh Sơn (`product_model.dart`)
- **Named Constructor (`Product.free`)**: Khởi tạo có tên rõ ràng ngữ nghĩa cho quà tặng (giá = 0 đ).
- **Factory Constructor (`factory Product.fromJson`)**: Đọc dữ liệu từ Map/JSON, kiểm tra tính hợp lệ dữ liệu và chủ động ném `MyException` nếu thiếu tên hoặc giá âm.
- **Mixins (`LoggerMixin`)**: Tái sử dụng tính năng in log cho `ProductService with LoggerMixin` mà không cần kế thừa cha-con, loại bỏ nguy cơ Diamond Problem.

---

### 4. Hướng dẫn chạy & Kiểm thử

```bash
# Cài đặt thư viện
flutter pub get

# Chạy kiểm thử tự động (5/5 tests đã passed 100%)
flutter test

# Chạy ứng dụng
flutter run
```

> **Chi tiết kịch bản thuyết trình và câu hỏi vấn đáp phản biện xem tại:**  
> 👉 [**`HUONG_DAN_THUYET_TRINH.md`**](HUONG_DAN_THUYET_TRINH.md)
