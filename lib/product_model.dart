import 'error_handler.dart';

// ============================================================================
// NỘI DUNG: OOP NÂNG CAO (NAMED & FACTORY CONSTRUCTOR), MIXINS VÀ SERVICE
// ============================================================================

/// 1. MIXIN (TÁI SỬ DỤNG TÍNH NĂNG KHÔNG QUA KẾ THỪA)
/// Dùng từ khóa `mixin`, cho phép bất kỳ lớp nào dùng `with LoggerMixin`
/// đều có ngay khả năng in log ghi vết mà không cần quan hệ cha-con.
mixin LoggerMixin {
  void logInfo(String message) {
    // ignore: avoid_print
    print('📢 [LOG HỆ THỐNG]: $message');
  }
}

/// 2. LỚP PRODUCT: MINH HỌA NAMED VÀ FACTORY CONSTRUCTOR
class Product {
  final String name;
  final double price;

  // Constructor mặc định
  Product(this.name, this.price);

  // A. Named Constructor: Khởi tạo sản phẩm tặng kèm (giá mặc định là 0 đ)
  Product.free(this.name) : price = 0;

  // B. Factory Constructor: Chuyển đổi dữ liệu từ Map/JSON linh hoạt
  // Có thể kiểm tra tính hợp lệ và ném ngoại lệ MyException nếu dữ liệu sai
  factory Product.fromJson(Map<String, dynamic> json) {
    // Kiểm tra tên không được để trống
    if (json['name'] == null || json['name'].toString().trim().isEmpty) {
      throw MyException('Tên sản phẩm không được để trống!');
    }
    // Kiểm tra giá tiền hợp lệ và không được âm
    if (json['price'] is! num || (json['price'] as num) < 0) {
      throw MyException('Giá sản phẩm không hợp lệ hoặc nhỏ hơn 0!');
    }
    return Product(json['name'].toString(), (json['price'] as num).toDouble());
  }
}

/// 3. SERVICE QUẢN LÝ DỮ LIỆU (SỬ DỤNG MIXIN VÀ DATASTORE)
class ProductService with LoggerMixin {
  // Kho lưu trữ dùng Generic DataStore<Product> của bạn Dương
  final DataStore<Product> store = DataStore<Product>();

  // Thêm sản phẩm từ JSON bằng Factory Constructor
  void addFromJson(Map<String, dynamic> json) {
    logInfo('Bắt đầu đọc dữ liệu JSON...');
    final product = Product.fromJson(json); // Gọi Factory Constructor
    store.add(product);
    logInfo('Đã thêm sản phẩm: ${product.name} - ${product.price} đ');
  }

  // Thêm quà tặng bằng Named Constructor
  void addGift(String name) {
    logInfo('Tạo quà tặng bằng Named Constructor...');
    final product = Product.free(name); // Gọi Named Constructor
    store.add(product);
    logInfo('Đã thêm quà tặng: ${product.name}');
  }
}

