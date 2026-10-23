import 'package:flutter_test/flutter_test.dart';
import 'package:tuan12_oop_error_handling/error_handler.dart';
import 'package:tuan12_oop_error_handling/main.dart';
import 'package:tuan12_oop_error_handling/product_model.dart';

void main() {
  test('1. Factory Constructor chuyển đổi JSON thành công', () {
    final json = {'name': 'Tai nghe', 'price': 250000};
    final p = Product.fromJson(json);

    expect(p.name, 'Tai nghe');
    expect(p.price, 250000.0);
  });

  test('2. Named Constructor Product.free khởi tạo giá 0 đ', () {
    final p = Product.free('Quà tặng');
    expect(p.name, 'Quà tặng');
    expect(p.price, 0);
  });

  test('3. Ném MyException khi giá âm', () {
    final invalidJson = {'name': 'Lỗi', 'price': -500};
    expect(() => Product.fromJson(invalidJson), throwsA(isA<MyException>()));
  });

  test('4. DataStore<T> lưu trữ dữ liệu với Generics', () {
    final store = DataStore<Product>();
    store.add(Product('Sách', 50000));
    expect(store.items.length, 1);
    expect(store.items.first.name, 'Sách');
  });

  testWidgets('5. Giao diện hiển thị đúng các nút chức năng', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('OOP Nâng Cao & Xử Lý Lỗi'), findsOneWidget);
    expect(find.text('1. Thêm từ JSON (Factory)'), findsOneWidget);
    expect(find.text('2. Quà tặng (Named)'), findsOneWidget);
  });
}
