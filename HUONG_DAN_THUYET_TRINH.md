# TÀI LIỆU TOÀN DIỆN: GIÁO TRÌNH LÝ THUYẾT & KỊCH BẢN THUYẾT TRÌNH BÁO CÁO (CHUẨN 10 PHÚT)
## CHỦ ĐỀ 01: NỀN TẢNG OOP NÂNG CAO & XỬ LÝ LỖI TRONG DART

> **Trường:** Đại học Bách Khoa – Đại học Đà Nẵng  
> **Khoa:** Điện tử - Viễn thông / Bộ môn Lập trình đa nền tảng  
> **Giảng viên hướng dẫn:** TS. Nguyễn Duy Nhật Viễn  
> **Học phần:** Lập trình đa nền tảng (Tuần 10 - 11 - 12)  
> **Nhóm thực hiện:** Vũ Duy Dương & Phan Vĩnh Sơn  
> **Thời lượng báo cáo:** Chuẩn 10 phút (kèm phần hỏi đáp phản biện)  

---

## MỤC LỤC TÀI LIỆU
1. [Bảng Phân Bổ Thời Gian Thuyết Trình (Timeline 10 Phút Chuẩn Xác)](#1-bảng-phân-bổ-thời-gian-thuyết-trình)
2. [Cấu Trúc Mã Nguồn 4 File & Bản Đồ Phân Công Nhiệm Vụ](#2-cấu-trúc-mã-nguồn-4-file--bản-đồ-phân-công-nhiệm-vụ)
3. [Kịch Bản Thuyết Trình Chi Tiết Từng Phút (Lời Thoại + Giảng Giải Lý Thuyết + Phân Tích Dòng Code)](#3-kịch-bản-thuyết-trình-chi-tiết-từng-phút)
   - [Phút 0:00 - 1:00: Mở đầu & Đặt bài toán thực tế](#phút-000---100-mở-đầu--đặt-bài-toán-thực-tế-sơn)
   - [Phút 1:00 - 2:30: Named Constructor & Phân tích Code `Product.free`](#phút-100---230-named-constructor--phân-tích-code-productfree-sơn)
   - [Phút 2:30 - 4:00: Factory Constructor & Phân tích Code `Product.fromJson`](#phút-230---400-factory-constructor--phân-tích-code-productfromjson-sơn)
   - [Phút 4:00 - 5:30: Mixins (`LoggerMixin`) & Generics cơ bản (`DataStore<T>`)](#phút-400---530-mixins-loggermixin--generics-cơ-bản-datastoret-sơn)
   - [Phút 5:30 - 7:00: Kỹ thuật Xử lý Lỗi, `try-on-catch-finally` & Custom Exception](#phút-530---700-kỹ-thuật-xử-lý-lỗi-try-on-catch-finally--custom-exception-dương)
   - [Phút 7:00 - 8:30: Hàm Bao Bọc Gom Lỗi Tập Trung (`safeRun`) - Chống Crash Ứng Dụng](#phút-700---830-hàm-bao-bọc-gom-lỗi-tập-trung-saferun---chống-crash-ứng-dụng-dương)
   - [Phút 8:30 - 9:30: Trình Diễn Demo Trực Tiếp 4 Kịch Bản Trên Màn Hình](#phút-830---930-trình-diễn-demo-trực-tiếp-4-kịch-bản-trên-màn-hình-sơn--dương)
   - [Phút 9:30 - 10:00: Đúc Kết Kiến Trúc & Kết Luận](#phút-930---1000-đúc-kết-kiến-trúc--kết-luận-sơn--dương)
4. [Bộ 6 Câu Hỏi Vấn Đáp Phản Biện Chuyên Sâu (Q&A) & Lời Giải Chuẩn Xác](#4-bộ-6-câu-hỏi-vấn-đáp-phản-biện-chuyên-sâu-qa)

---

## 1. BẢNG PHÂN BỔ THỜI GIAN THUYẾT TRÌNH

| Mốc thời gian | Thời lượng | Người trình bày | Nội dung trọng tâm & Mã nguồn minh họa |
|:---|:---|:---|:---|
| **0:00 - 1:00** | 1.0 phút | **Phan Vĩnh Sơn** | Chào hỏi, đặt vấn đề thực tế: Tại sao ứng dụng di động dễ crash? Kiến trúc 4 tệp giải quyết bài toán. |
| **1:00 - 2:30** | 1.5 phút | **Phan Vĩnh Sơn** | **Named Constructor**: Bản chất trong Dart, so sánh Constructor Overloading của Java, phân tích dòng code `Product.free` trong [`lib/product_model.dart`](lib/product_model.dart). |
| **2:30 - 4:00** | 1.5 phút | **Phan Vĩnh Sơn** | **Factory Constructor**: Sự khác biệt với Generative Constructor, cơ chế parse JSON, phân tích dòng code `factory Product.fromJson` trong [`lib/product_model.dart`](lib/product_model.dart). |
| **4:00 - 5:30** | 1.5 phút | **Phan Vĩnh Sơn** | **Mixins**: Cơ chế Linearization, giải quyết Diamond Problem, phân tích `LoggerMixin`.<br>**Generics cơ bản**: An toàn kiểu tại Compile-time, phân tích `DataStore<T>` trong [`lib/error_handler.dart`](lib/error_handler.dart). |
| **5:30 - 7:00** | 1.5 phút | **Vũ Duy Dương** | **Xử lý lỗi & Custom Exception**: Cấu trúc `try - on - catch - finally`, tại sao cần `MyException implements Exception` trong [`lib/error_handler.dart`](lib/error_handler.dart), nguyên tắc thông báo thân thiện cho User. |
| **7:00 - 8:30** | 1.5 phút | **Vũ Duy Dương** | **Hàm Bao Bọc (Wrapper) tập trung**: Nhược điểm khi rải `try-catch` ở UI, phân tích từng khối lệnh trong hàm `safeRun()` ([`lib/error_handler.dart`](lib/error_handler.dart)), cơ chế Fail-safe chống văng ứng dụng. |
| **8:30 - 9:30** | 1.0 phút | **Sơn & Dương** | **Demo thực tế trên App**: Bấm lần lượt 4 nút thử nghiệm trên [`lib/home_screen.dart`](lib/home_screen.dart), đối chiếu phản hồi UI và Console. |
| **9:30 - 10:00** | 0.5 phút | **Sơn & Dương** | **Tổng kết đề tài**: Khái quát hóa giá trị kiến trúc, cảm ơn và mở đầu phần phản biện Q&A. |
| **Tổng cộng** | **10 phút** | **Nhóm 01** | **Hoàn thành đúng khung giờ quy định** |

---

## 2. CẤU TRÚC MÃ NGUỒN 4 FILE & BẢN ĐỒ PHÂN CÔNG NHIỆM VỤ

Toàn bộ ứng dụng được tối ưu hóa cực kỳ gọn gàng, chia thành **4 tệp** có ranh giới trách nhiệm rõ ràng:

```text
lib/
├── error_handler.dart   # [Vũ Duy Dương phụ trách]
│   ├── class MyException implements Exception     (Custom Exception thân thiện)
│   ├── class DataStore<T>                         (Generics cơ bản lưu trữ an toàn kiểu)
│   └── void safeRun(context, action)              (Hàm Wrapper gom lỗi tập trung: try-on-catch-finally)
│
├── product_model.dart   # [Phan Vĩnh Sơn phụ trách]
│   ├── mixin LoggerMixin                          (Mixin in log hệ thống chuẩn hóa)
│   ├── class Product                              (Named: Product.free | Factory: Product.fromJson)
│   └── class ProductService with LoggerMixin      (Dịch vụ quản lý dữ liệu mượn tính năng ghi log)
│
├── home_screen.dart     # [Phối hợp cả hai bạn]
│   └── class HomeScreen                          (Giao diện danh sách + 4 nút bấm Demo kịch bản)
│
└── main.dart            # [Điểm khởi chạy ứng dụng]
    └── void main() => runApp(const MyApp())       (Cấu hình MaterialApp)
```

---

## 3. KỊCH BẢN THUYẾT TRÌNH CHI TIẾT TỪNG PHÚT
*(Bao gồm lời thoại đầy đủ, cử chỉ chỉ tay vào code, và phần giảng giải bản chất lý thuyết cho Thầy và các bạn dưới lớp hiểu thấu đáo)*

---

### PHÚT 0:00 - 1:00: MỞ ĐẦU & ĐẶT BÀI TOÁN THỰC TẾ (SƠN)

> **[Phan Vĩnh Sơn đứng dậy, tự tin chào Thầy và lớp]**
>
> "Kính thưa Thầy TS. Nguyễn Duy Nhật Viễn cùng toàn thể các bạn sinh viên đang có mặt trong buổi báo cáo hôm nay.
>
> Em tên là **Phan Vĩnh Sơn**, và bạn đồng hành cùng em là bạn **Vũ Duy Dương**. Hôm nay, nhóm chúng em xin phép được trình bày chuyên đề **Chủ đề 01: Nền tảng OOP nâng cao & Xử lý lỗi trong Dart**.
>
> Thưa Thầy và các bạn, khi chúng ta bước từ lập trình cơ bản lên xây dựng các ứng dụng di động thực tế với Flutter, hai thách thức lớn nhất mà mọi lập trình viên đều phải đối mặt là:
> 1. **Thứ nhất:** Làm sao để cấu trúc dữ liệu linh hoạt, tái sử dụng mã nguồn tối đa mà không rơi vào các cạm bẫy kế thừa phức tạp?
> 2. **Thứ hai:** Khi dữ liệu mạng trả về bị sai định dạng, hoặc người dùng nhập liệu bất thường, làm sao để ứng dụng **không bao giờ bị dừng đột ngột (crash/màn hình đỏ)**, mà vẫn đưa ra thông báo lịch sự, dễ hiểu cho người dùng cuối?
>
> Để giải quyết trọn vẹn 2 bài toán trên, nhóm chúng em đã phân chia mã nguồn thành **4 tệp mạch lạc** trong thư mục `lib/`:
> - Tệp `product_model.dart` do em phụ trách, chuyên sâu về Named Constructor, Factory Constructor và Mixins.
> - Tệp `error_handler.dart` do bạn Dương phụ trách, chuyên sâu về Custom Exception, Generics và Hàm bao bọc gom lỗi tập trung.
> - Cùng tệp `home_screen.dart` kết nối giao diện thực tế và `main.dart` để khởi chạy.
>
> Sau đây, em xin phép đi sâu vào phần lý thuyết và phân tích mã nguồn phần đầu tiên: **Lập trình hướng đối tượng nâng cao trong Dart**."

---

### PHÚT 1:00 - 2:30: NAMED CONSTRUCTOR & PHÂN TÍCH CODE `Product.free` (SƠN)

> **[Chuyển Slide sang phần: Named Constructor]**  
> **[Mở file `lib/product_model.dart` trên máy chiếu]**
>
> "Thưa Thầy và các bạn, điểm đặc biệt đầu tiên của ngôn ngữ Dart là: **Dart không hỗ trợ nạp chồng hàm tạo (Constructor Overloading)** giống như Java hay C++.
>
> Trong Java, nếu muốn tạo nhiều constructor, chúng ta phải viết nhiều hàm trùng tên nhưng thay đổi số lượng hoặc kiểu tham số. Điều này rất dễ gây nhập nhằng nếu hai hàm tạo có số tham số bằng nhau nhưng khác ngữ nghĩa.
>
> Dart giải quyết bài toán này bằng một giải pháp thông minh hơn rất nhiều: đó là **Named Constructor** (Hàm khởi tạo có tên). Cú pháp chuẩn của nó là:  
> `TênLớp.tên_hàm_tạo(...)`
>
> **Lợi ích cốt lõi của Named Constructor:**
> - Thứ nhất là tính **tường minh ngữ nghĩa (Self-documenting)**: Người đọc code nhìn vào tên hàm là hiểu ngay mục đích khởi tạo mà không cần đọc code bên trong.
> - Thứ hai là cho phép sử dụng **Initializer List** (dấu hai chấm `:`) để tính toán hoặc gán giá trị mặc định cho các biến `final` trước khi phần thân hàm constructor bắt đầu chạy.
>
> Xin mời Thầy và các bạn cùng nhìn vào dòng code thực tế trong tệp `lib/product_model.dart` của nhóm em:

```dart
class Product {
  final String name;
  final double price;

  // 1. Constructor mặc định (Generative Constructor)
  Product(this.name, this.price);

  // 2. Named Constructor: Khởi tạo sản phẩm tặng kèm (giá mặc định là 0 đ)
  Product.free(this.name) : price = 0;
}
```

> **[Chỉ tay vào dòng code `Product.free(this.name) : price = 0;`]**
>
> "Như mọi người thấy, lớp `Product` có 2 trường `final` là `name` và `price`. Nếu dùng constructor thông thường, mỗi khi muốn tạo một món hàng khuyến mãi tặng kèm, chúng ta phải truyền thủ công số `0`: `Product('Chuột', 0)`.
>
> Nhưng với Named Constructor `Product.free(this.name)`, nhóm em dùng Initializer List `: price = 0`. Người lập trình chỉ cần gọi `Product.free('Chuột không dây')`. Biến `price` tự động được ấn định bằng 0 một cách an toàn và tường minh tuyệt đối. Đây chính là sức mạnh đầu tiên của OOP trong Dart."

---

### PHÚT 2:30 - 4:00: FACTORY CONSTRUCTOR & PHÂN TÍCH CODE `Product.fromJson` (SƠN)

> **[Chuyển Slide sang phần: Factory Constructor]**
>
> "Tiếp theo là khái niệm cực kỳ quan trọng và hay bị nhầm lẫn nhất: **Factory Constructor** (Hàm tạo nhà máy), được khai báo bằng từ khóa `factory`.
>
> Để mọi người dưới lớp hiểu rõ, em xin chỉ ra **sự khác biệt cốt tử** giữa Constructor thông thường và Factory Constructor:
> - Constructor thông thường (Generative Constructor): **Bắt buộc luôn luôn tạo mới một instance** của chính lớp đó. Chúng ta không có quyền can thiệp vào giá trị trả về và không được dùng câu lệnh `return`.
> - Trong khi đó, **Factory Constructor hoạt động hệt như một hàm tạo linh hoạt**:
>   1. Nó **bắt buộc phải có câu lệnh `return`** trả về một đối tượng hợp lệ.
>   2. Nó cho phép chúng ta kiểm tra dữ liệu đầu vào (Validation) trước khi quyết định có tạo đối tượng hay không. Nếu dữ liệu sai, nó có quyền ném Exception ngay lập tức!
>   3. Nó có thể trả về một đối tượng có sẵn trong bộ nhớ cache (áp dụng mẫu Singleton), hoặc thậm chí trả về một thể hiện của lớp con.
>
> Trong phát triển ứng dụng di động, ứng dụng phổ biến nhất của Factory Constructor là **chuyển đổi dữ liệu JSON từ API thành Model (`fromJson`)**.
>
> Xin mời Thầy và các bạn quan sát cách nhóm em hiện thực trong tệp `lib/product_model.dart`:"

```dart
  // Factory Constructor: Chuyển đổi dữ liệu từ Map/JSON linh hoạt
  factory Product.fromJson(Map<String, dynamic> json) {
    // Bước 1: Kiểm tra trường 'name' không được để trống
    if (json['name'] == null || json['name'].toString().trim().isEmpty) {
      throw MyException('Tên sản phẩm không được để trống!');
    }
    // Bước 2: Kiểm tra trường 'price' không được âm
    if (json['price'] == null || (json['price'] as num) < 0) {
      throw MyException('Giá sản phẩm không được nhỏ hơn 0!');
    }
    // Bước 3: Dữ liệu hợp lệ mới tạo và trả về đối tượng Product
    return Product(json['name'].toString(), (json['price'] as num).toDouble());
  }
```

> **[Giải thích cặn kẽ từng dòng]**
>
> "Mọi người có thể thấy: Khi nhận vào một `Map<String, dynamic> json` từ Server, chúng ta không vội vàng tạo `Product` ngay.
> - Tại bước 1: Nếu Server trả về JSON thiếu khóa `'name'`, Factory sẽ chặn lại và ném ra `MyException('Tên sản phẩm không được để trống!')`.
> - Tại bước 2: Nếu `'price'` là số âm, nó tiếp tục chặn lại và ném `MyException`.
> - Chỉ khi tất cả dữ liệu đã hoàn toàn sạch sẽ và hợp lệ, lệnh `return Product(...)` ở bước 3 mới được kích hoạt.
>
> Nhờ Factory Constructor, chúng ta đã biến Model thành một **màng lọc bảo vệ vững chắc**, loại bỏ hoàn toàn nguy cơ dữ liệu rác đi sâu vào ứng dụng."

---

### PHÚT 4:00 - 5:30: MIXINS (`LoggerMixin`) & GENERICS CƠ BẢN (`DataStore<T>`) (SƠN)

> **[Chuyển Slide sang phần: Mixin & Generics]**
>
> "Khái niệm OOP nâng cao thứ ba là **Mixins** - kỹ thuật tái sử dụng tính năng không qua kế thừa.
>
> Vì sao Dart lại cần Mixin?  
> Trong khoa học máy tính, kế thừa là mối quan hệ 'Is-a' (Con là một Cha). Tuy nhiên, các ngôn ngữ cho phép đa kế thừa như C++ gặp phải một vấn đề kinh điển gọi là **Sự cố Kim Cương (Diamond Problem)**: Nếu lớp A có hai lớp con là B và C, rồi lớp D kế thừa cả B và C; khi B và C có phương thức trùng tên, lớp D sẽ không biết phải thực thi phương thức của ai, gây xung đột mã nguồn nghiêm trọng.
>
> Để khắc phục, Dart quy định **đơn kế thừa** (chỉ `extends` một cha), nhưng cung cấp **Mixin** thông qua từ khóa `mixin` và `with`. Mixin hoạt động theo cơ chế **Linearization (tuyến tính hóa)**: Nó cho phép một lớp mượn các hành vi 'Can-do' từ nhiều mixin khác nhau mà không tạo ra xung đột cây phân cấp.
>
> Trong bài, nhóm em tạo một mixin ghi log tự động:"

```dart
mixin LoggerMixin {
  void logInfo(String message) {
    print('📢 [LOG HỆ THỐNG]: $message');
  }
}

// Lớp ProductService tái sử dụng tính năng ghi log bằng từ khóa `with`
class ProductService with LoggerMixin {
  final DataStore<Product> store = DataStore<Product>();

  void addFromJson(Map<String, dynamic> json) {
    logInfo('Bắt đầu đọc dữ liệu JSON...');
    final product = Product.fromJson(json);
    store.add(product);
    logInfo('Đã thêm sản phẩm: ${product.name} - ${product.price} đ');
  }
}
```

> "Như Thầy và các bạn thấy, lớp `ProductService` chỉ cần viết `with LoggerMixin` là ngay lập tức có sẵn phương thức `logInfo` để in nhật ký ra console chuẩn hóa, rất sạch sẽ và chuyên nghiệp.
>
> Đi cùng với đó là **Generics cơ bản (`<T>`)** trong lớp `DataStore<T>`:
> - Thay vì viết một kho lưu trữ cố định cho mỗi lớp, nhóm em dùng ký hiệu `<T>`: `class DataStore<T>`.
> - Lợi ích lớn nhất của Generics là **Compile-time Type Safety (An toàn kiểu tại thời điểm biên dịch)**: Khi khai báo `DataStore<Product>`, trình biên dịch sẽ ngăn cấm ngay lập tức nếu ai đó cố tình nhét một chuỗi String hay số int vào kho. Điều này loại bỏ hoàn toàn các lỗi ép kiểu lúc chạy (`TypeError`), giúp ứng dụng chạy cực kỳ mượt mà.
>
> Sau đây, em xin nhường phần trình bày lại cho bạn **Vũ Duy Dương** để phân tích phần then chốt: **Kỹ thuật Xử lý lỗi và Hàm Wrapper gom lỗi tập trung**."

---

### PHÚT 5:30 - 7:00: KỸ THUẬT XỬ LÝ LỖI, `try-on-catch-finally` & CUSTOM EXCEPTION (DƯƠNG)

> **[Vũ Duy Dương bước lên, cảm ơn Sơn và tiếp tục bài thuyết trình]**
>
> "Em xin kính chào Thầy và các bạn. Em là **Vũ Duy Dương**. Em xin phép được đại diện nhóm trình bày phần 2 của đề tài: **Kỹ thuật xử lý lỗi chuyên nghiệp trong Dart & Flutter**.
>
> Thưa Thầy, một trong những nguyên nhân hàng đầu khiến ứng dụng di động bị người dùng gỡ cài đặt là hiện tượng **Crash ứng dụng (văng app)** hoặc xuất hiện **Màn hình đỏ chết chóc (Red Screen of Death)** khi gặp lỗi ngoài ý muốn.
>
> Trong Dart, cú pháp xử lý ngoại lệ chuẩn bao gồm 4 khối lệnh:
> 1. Khối `try`: Chứa đoạn mã nghiệp vụ có nguy cơ phát sinh lỗi.
> 2. Mệnh đề `on <ExceptionType>`: Dùng để **bắt chính xác loại lỗi** mong muốn.
> 3. Mệnh đề `catch (e)`: Dùng để lấy đối tượng lỗi và vết ngăn xếp phục vụ cho việc debug.
> 4. Khối `finally`: Khối lệnh **luôn luôn chạy** dù có lỗi hay không, thường dùng để dọn dẹp bộ nhớ hoặc đóng kết nối.
>
> Tuy nhiên, nếu chúng ta chỉ dùng lớp `Exception` mặc định của hệ thống: `throw Exception('Lỗi')`, chúng ta sẽ gặp 2 nhược điểm rất lớn:
> - Thứ nhất: Không thể dùng mệnh đề `on` để phân biệt đâu là lỗi nhập liệu do người dùng, đâu là lỗi mạng của hệ thống.
> - Thứ hai: Lỗi mặc định thường mang các thông điệp tiếng Anh kỹ thuật thô ráp như `FormatException` hay `Null check operator used on null value`. Nếu hiển thị những dòng này lên màn hình, người dùng sẽ hoang mang và không biết xử lý ra sao; đồng thời còn làm lộ cấu trúc mã nguồn cho kẻ xấu lợi dụng.
>
> Vì vậy, trong tệp `lib/error_handler.dart`, em đã định nghĩa một **Custom Exception** tùy biến:"

```dart
// 1. ĐỊNH NGHĨA LỖI TÙY BIẾN (CUSTOM EXCEPTION)
class MyException implements Exception {
  final String message;
  MyException(this.message);

  @override
  String toString() => message;
}
```

> **[Phân tích ý nghĩa dòng code]**
>
> "Lớp `MyException` của em triển khai giao diện `implements Exception` của Dart. Điểm đắt giá ở đây là nó mang theo thuộc tính `message` chứa câu thông báo bằng **tiếng Việt thân thiện, nhã nhặn và có tính hướng dẫn** (ví dụ: *'Giá sản phẩm không được nhỏ hơn 0!'*).
>
> Nhờ có `MyException`, ở tầng xử lý lỗi chúng ta có thể viết `on MyException catch (e)` để tóm gọn riêng lỗi này và hiển thị thông điệp thân thiện lên giao diện một cách hoàn hảo."

---

### PHÚT 7:00 - 8:30: HÀM BAO BỌC GOM LỖI TẬP TRUNG (`safeRun`) - CHỐNG CRASH ỨNG DỤNG (DƯƠNG)

> **[Chuyển Slide sang phần: Hàm bao bọc gom lỗi tập trung]**  
> **[Mở file `lib/error_handler.dart` trên máy chiếu]**
>
> "Thưa Thầy và các bạn, đây chính là **trọng tâm kỹ thuật quan trọng nhất** của đề tài hôm nay: **Hàm bao bọc (Wrapper) gom lỗi tập trung**.
>
> **Hãy tưởng tượng bài toán thực tế:**  
> Trong một ứng dụng có 20 màn hình và hàng trăm nút bấm. Nếu mỗi nút bấm trên giao diện đều phải tự viết một khối `try-catch`, chúng ta sẽ gặp 3 thảm họa:
> 1. **Mã nguồn bị trùng lặp (Boilerplate code):** Chỗ nào cũng lặp lại việc bắt lỗi và gọi SnackBar.
> 2. **Vi phạm nguyên lý Clean Architecture:** Giao diện UI chỉ nên lo việc vẽ và hiển thị dữ liệu, không nên ôm đồm việc phân loại ngoại lệ kỹ thuật.
> 3. **Nguy cơ bỏ sót lỗi:** Chỉ cần một lập trình viên trong đội ngũ quên viết `try-catch` ở một nút mới, khi có lỗi phát sinh ngoài dự kiến, **toàn bộ ứng dụng sẽ bị crash ngay lập tức!**
>
> Để giải quyết triệt để, em đã xây dựng hàm bao bọc duy nhất mang tên `safeRun()` trong tệp `lib/error_handler.dart`. Xin mời Thầy và các bạn cùng phân tích từng khối lệnh:"

```dart
// HÀM BAO BỌC (WRAPPER) GOM LỖI TẬP TRUNG - CHỐNG CRASH ỨNG DỤNG
void safeRun(BuildContext context, VoidCallback action) {
  try {
    // Khối A: Thực thi đoạn mã nghiệp vụ có nguy cơ lỗi
    action();
  } on MyException catch (e) {
    // Khối B: Bắt chính xác lỗi nghiệp vụ tùy biến đã biết
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('⚠️ Lỗi nghiệp vụ: $e'),
        backgroundColor: Colors.orange.shade800,
        behavior: SnackBarBehavior.floating,
      ),
    );
  } catch (e) {
    // Khối C: Bắt tất cả các lỗi hệ thống bất ngờ chưa lường trước
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('❌ Lỗi hệ thống: $e'),
        backgroundColor: Colors.red.shade800,
        behavior: SnackBarBehavior.floating,
      ),
    );
  } finally {
    // Khối D: Luôn luôn thực thi dù thành công hay thất bại
    print('🏁 [FINALLY]: Hoàn thành bước kiểm tra an toàn.');
  }
}
```

> **[Nhấn mạnh cơ chế chống Crash]**
>
> "Mọi người hãy chú ý đến sự phân tầng chặt chẽ của hàm `safeRun`:
> - **Nhánh 1 (`on MyException catch (e)`):** Khi người dùng nhập sai (ví dụ giá âm), lỗi nghiệp vụ `MyException` sẽ rơi vào đây. Hàm lập tức bắn ra một SnackBar **màu cam cảnh báo nhẹ nhàng**: *'⚠️ Lỗi nghiệp vụ: Giá sản phẩm không được nhỏ hơn 0!'*.
> - **Nhánh 2 (`catch (e)` tổng quát):** Đây chính là **'tấm khiên bảo vệ'** tối thượng. Giả sử hệ thống phát sinh một lỗi runtime cực kỳ nghiêm trọng mà lập trình viên chưa từng nghĩ tới (ví dụ: con trỏ null, lỗi chia cho 0, hoặc tràn bộ nhớ). Thay vì để lỗi này làm văng ứng dụng ra màn hình chính điện thoại, mệnh đề `catch (e)` này sẽ **bắt trọn 100% lỗi đó**, chuyển thành SnackBar **màu đỏ cảnh báo**: *'❌ Lỗi hệ thống: ...'*.
> - **Ứng dụng vẫn tiếp tục chạy bình thường, giao diện vẫn tương tác mượt mà, người dùng không hề bị gián đoạn trải nghiệm!**
> - **Khối `finally`:** Đảm bảo in log xác nhận bước xử lý an toàn đã hoàn tất.
>
> Và bây giờ, để minh chứng cho những gì nhóm vừa trình bày, bạn Sơn và em sẽ cùng chạy ứng dụng và thực hành Demo 4 kịch bản trực tiếp trên màn hình."

---

### PHÚT 8:30 - 9:30: TRÌNH DIỄN DEMO TRỰC TIẾP 4 KỊCH BẢN TRÊN MÀN HÌNH (SƠN & DƯƠNG)

> **[Chuyển màn hình máy chiếu sang Ứng dụng Flutter đang chạy trên Windows / Giả lập]**  
> **[Phan Vĩnh Sơn cầm chuột thao tác, Vũ Duy Dương thuyết minh hiện tượng]**

```text
+------------------------------------------------------------------------+
|                      OOP NÂNG CAO & XỬ LÝ LỖI                          |
| Bấm các nút dưới đây để chạy thử nghiệm:                               |
| [ 1. Thêm từ JSON (Factory) ]   [ 2. Quà tặng (Named) ]               |
| [ 3. Lỗi JSON (Giá âm) ]        [ 4. Thử Crash (Không văng app) ]      |
+------------------------------------------------------------------------+
```

> **Dương thuyết minh:**
> "Thưa Thầy và các bạn, trên màn hình ứng dụng là giao diện kiểm thử được thiết kế với 4 nút bấm đại diện cho 4 kịch bản thực tế:
>
> **👉 Kịch bản 1: Thêm sản phẩm từ JSON hợp lệ**  
> **[Sơn nhấn nút 1: '1. Thêm từ JSON (Factory)']**  
> *Hiện tượng:* Danh sách ngay lập tức xuất hiện sản phẩm **'Bàn phím cơ - 500,000 đ'**, đồng thời dưới console in log: `[LOG HỆ THỐNG]: Đã thêm sản phẩm...`.  
> *Cơ chế:* Factory Constructor `Product.fromJson` kiểm tra dữ liệu thành công, `LoggerMixin` tự động in log và lưu vào `DataStore<Product>`.
>
> **👉 Kịch bản 2: Thêm quà tặng bằng Named Constructor**  
> **[Sơn nhấn nút 2: '2. Quà tặng (Named)']**  
> *Hiện tượng:* Danh sách xuất hiện **'Chuột không dây - Miễn phí (0 đ)'**.  
> *Cơ chế:* Hàm tạo có tên `Product.free` tự động thiết lập giá bằng 0 đ qua Initializer List.
>
> **👉 Kịch bản 3: Thử nghiệm Lỗi nghiệp vụ (Giá âm)**  
> **[Sơn nhấn nút 3: '3. Lỗi JSON (Giá âm)']**  
> *Hiện tượng:* Trên màn hình xuất hiện một SnackBar màu cam nổi bật: **'⚠️ Lỗi nghiệp vụ: Giá sản phẩm không được nhỏ hơn 0!'**. Không có sản phẩm lỗi nào bị thêm vào danh sách.  
> *Cơ chế:* Factory phát hiện giá âm `-100,000 đ`, chủ động ném `MyException`. Hàm `safeRun` bắt được ở nhánh `on MyException` và báo lỗi thân thiện cho User.
>
> **👉 Kịch bản 4: Thử nghiệm Lỗi Crash hệ thống bất ngờ (Fail-safe)**  
> **[Sơn nhấn nút 4: '4. Thử Crash (Không văng app)']**  
> *Hiện tượng:* Dưới code cố tình ném ra một `StateError` nghiêm trọng của Dart Runtime. Ngay lập tức, một thanh SnackBar màu đỏ hiện lên: **'❌ Lỗi hệ thống: Bad state: Sự cố chia cho 0 hoặc lỗi hệ thống!'**.  
> **Ứng dụng không hề bị văng! Không hề có màn hình đỏ! Người dùng vẫn có thể tiếp tục bấm các nút khác bình thường!**  
> *Cơ chế:* Khối `catch (e)` tổng quát của hàm Wrapper đã bắt trọn lỗi chưa biết, bảo vệ ứng dụng an toàn 100%."

---

### PHÚT 9:30 - 10:00: ĐÚC KẾT KIẾN TRÚC & KẾT LUẬN (SƠN & DƯƠNG)

> **[Cả hai thành viên cùng đứng trước lớp tổng kết]**
>
> **Sơn tổng kết:**
> "Kính thưa Thầy và các bạn, qua 10 phút báo cáo vừa rồi, nhóm chúng em đã chứng minh cách kết hợp hài hòa giữa:
> - **OOP nâng cao:** Dùng Named và Factory Constructor để làm chủ việc tạo đối tượng, dùng Mixins để tái sử dụng mã nguồn sạch sẽ, và dùng Generics để đảm bảo an toàn kiểu dữ liệu.
> - **Xử lý lỗi tập trung:** Dùng Custom Exception và hàm Wrapper `safeRun` để xây dựng một kiến trúc Fail-safe bền bỉ, mang lại trải nghiệm mượt mà và thân thiện cho người dùng.
>
> Toàn bộ mã nguồn đã được kiểm thử tự động với bộ Unit Test đạt kết quả 100% thành công.
>
> Nhóm chúng em xin chân thành cảm ơn Thầy TS. Nguyễn Duy Nhật Viễn đã tận tình hướng dẫn và cảm ơn các bạn đã chú ý lắng nghe. Nhóm chúng em đã sẵn sàng đón nhận những câu hỏi phản biện từ Thầy và các bạn ạ!"

---

## 4. BỘ 6 CÂU HỎI VẤN ĐÁP PHẢN BIỆN CHUYÊN SÂU (Q&A)

Dưới đây là 6 câu hỏi Giảng viên rất hay hỏi khi chấm bài về OOP và Xử lý lỗi trong Dart, kèm câu trả lời mẫu chuẩn xác 100% giúp sinh viên tự tin đạt điểm tối đa:

---

#### Câu 1: "Tại sao Dart không hỗ trợ nạp chồng constructor (Constructor Overloading) như Java mà lại tạo ra Named Constructor?"
- **Trả lời phản biện chuẩn:**  
  *"Dạ thưa Thầy, trong Java, khi dùng Constructor Overloading, trình biên dịch chỉ phân biệt các hàm tạo dựa vào danh sách kiểu tham số. Nếu chúng ta có hai hàm tạo cùng nhận 1 tham số String (ví dụ một hàm là `User(String email)` và một hàm là `User(String username)`), Java sẽ báo lỗi trùng chữ ký (Signature conflict) và không thể biên dịch được.  
  Dart giải quyết triệt để vấn đề này bằng Named Constructor. Tên của constructor mang tính **tường minh về mặt ngữ nghĩa (Self-documenting)**: Chúng ta có thể tạo `User.byEmail(String email)` và `User.byUsername(String username)`. Điều này vừa tránh được sự nhập nhằng trong mã nguồn, vừa giúp người đọc code hiểu ngay mục đích khởi tạo mà không cần xem tài liệu."*

---

#### Câu 2: "Điểm khác biệt bản chất nhất giữa Factory Constructor và Constructor thông thường là gì? Khi nào bắt buộc phải dùng Factory?"
- **Trả lời phản biện chuẩn:**  
  *"Dạ thưa Thầy, có 3 điểm khác biệt bản chất:  
  1. **Về việc tạo instance:** Constructor thông thường luôn tự động cấp phát và tạo mới một đối tượng của chính lớp đó. Trong khi Factory Constructor hoạt động như một hàm tạo nhà máy, bắt buộc phải có câu lệnh `return` trả về một đối tượng hợp lệ.  
  2. **Về khả năng kiểm tra (Validation):** Constructor thông thường không thể hủy việc tạo đối tượng nếu dữ liệu sai; còn Factory Constructor có thể kiểm tra dữ liệu đầu vào và ném ra Exception trước khi tạo đối tượng.  
  3. **Về tính linh hoạt:** Factory Constructor có thể trả về một đối tượng có sẵn từ bộ nhớ đệm (Cache/Singleton Pattern) hoặc trả về một thể hiện của lớp con (Subtype polymorphism).  
  Chúng ta bắt buộc hoặc nên dùng Factory khi parse dữ liệu từ JSON/API (`fromJson`) hoặc khi xây dựng Service Singleton."*

---

#### Câu 3: "Sự cố Kim Cương (Diamond Problem) là gì? Cơ chế Linearization của Mixin giải quyết nó như thế nào?"
- **Trả lời phản biện chuẩn:**  
  *"Dạ thưa Thầy, Diamond Problem xảy ra trong các ngôn ngữ đa kế thừa như C++: Giả sử lớp B và lớp C cùng kế thừa từ lớp A và cùng ghi đè phương thức `display()`. Nếu lớp D kế thừa đồng thời cả B và C, khi đối tượng của D gọi `display()`, trình biên dịch sẽ không biết phải gọi hàm của B hay của C, gây xung đột mã nguồn.  
  Dart giải quyết bằng cách chỉ cho phép đơn kế thừa và cung cấp Mixin thông qua từ khóa `with`. Khi một lớp khai báo `with MixinA, MixinB`, Dart áp dụng cơ chế **Linearization (tuyến tính hóa)**: Nó xếp các mixin thành một danh sách phẳng theo thứ tự từ trái sang phải. Mixin nào được viết sau cùng (`MixinB`) sẽ có độ ưu tiên cao nhất và ghi đè phương thức trùng tên của các mixin trước đó. Nhờ đó, loại bỏ hoàn toàn sự nhập nhằng."*

---

#### Câu 4: "Mệnh đề `on SpecificException` khác mệnh đề `catch (e)` ở điểm nào? Trong hàm Wrapper các em phối hợp 2 mệnh đề này ra sao?"
- **Trả lời phản biện chuẩn:**  
  *"Dạ thưa Thầy:  
  - Mệnh đề `on` dùng để **so khớp mẫu theo kiểu dữ liệu (Pattern Matching by Type)**: Nó chỉ bắt đúng kiểu ngoại lệ được chỉ định để xử lý nghiệp vụ riêng biệt.  
  - Mệnh đề `catch (e)` dùng để **lấy đối tượng lỗi `e` và vết ngăn xếp `stackTrace`**.  
  Trong hàm `safeRun()`, nhóm em phối hợp 2 mệnh đề này theo mô hình phễu lọc:  
  - Tầng trên dùng `on MyException catch (e)` để tóm đúng các lỗi nghiệp vụ thân thiện đã biết trước (như giá âm, tên rỗng) và báo cho người dùng bằng SnackBar cam.  
  - Tầng dưới dùng `catch (e)` tổng quát như một 'lưới vét đáy' để tóm trọn mọi lỗi hệ thống bất ngờ chưa lường trước, biến thành SnackBar đỏ và ngăn chặn hoàn toàn nguy cơ ứng dụng bị crash."*

---

#### Câu 5: "Nếu không dùng hàm bao bọc Wrapper mà viết try-catch trực tiếp ở từng Widget thì có vấn đề gì xảy ra?"
- **Trả lời phản biện chuẩn:**  
  *"Dạ thưa Thầy, nếu viết `try-catch` trực tiếp tại từng Widget trên giao diện, sẽ có 3 hệ quả tiêu cực:  
  1. **Trùng lặp mã (Boilerplate):** Mã nguồn của ứng dụng sẽ phình to gấp đôi vì nút bấm nào cũng phải sao chép lại đoạn code bắt lỗi và hiện SnackBar giống hệt nhau.  
  2. **Vi phạm nguyên lý Đơn trách nhiệm (Single Responsibility):** Giao diện UI bị gánh thêm trách nhiệm phân loại ngoại lệ kỹ thuật, khiến việc bảo trì sau này cực kỳ khó khăn.  
  3. **Rủi ro văng ứng dụng (High Crash Risk):** Khi dự án có nhiều người cùng phát triển, chỉ cần một bạn lập trình viên quên bọc `try-catch` ở một sự kiện `onPressed`, khi có lỗi phát sinh thì toàn bộ ứng dụng sẽ bị crash ngay lập tức. Hàm Wrapper tập trung là giải pháp chuẩn công nghiệp để khắc phục triệt để vấn đề này."*

---

#### Câu 6: "Các em đã viết Unit Test để chứng minh các khẳng định lý thuyết trên như thế nào?"
- **Trả lời phản biện chuẩn:**  
  *"Dạ thưa Thầy, trong tệp `test/widget_test.dart`, nhóm em đã viết đầy đủ 5 test cases tự động:  
  1. Test Factory Constructor chuyển đổi JSON hợp lệ thành công.  
  2. Test Named Constructor `Product.free` tự động gán giá bằng 0 đ.  
  3. Test ném đúng ngoại lệ `MyException` khi dữ liệu JSON có giá âm.  
  4. Test kho lưu trữ Generic `DataStore<T>` lưu trữ chính xác đối tượng.  
  5. Test Widget Smoke Test đảm bảo giao diện hiển thị đầy đủ các nút bấm.  
  Khi chạy lệnh `flutter test`, toàn bộ 5/5 bài kiểm thử đều vượt qua 100% ạ."*
