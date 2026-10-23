import 'package:flutter/material.dart';
import 'error_handler.dart';
import 'product_model.dart';

// ============================================================================
// PHẦN PHỤ TRÁCH: PHAN VĨNH SƠN & VŨ DUY DƯƠNG (PHỐI HỢP)
// NỘI DUNG: GIAO DIỆN NGƯỜI DÙNG (UI) VÀ CÁC NÚT BẤM DEMO KỊCH BẢN THỰC TẾ
// ============================================================================

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Khởi tạo Service quản lý
  final ProductService _service = ProductService();

  @override
  Widget build(BuildContext context) {
    final list = _service.store.items;

    return Scaffold(
      appBar: AppBar(
        title: const Text('OOP Nâng Cao & Xử Lý Lỗi'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            tooltip: 'Xóa danh sách',
            onPressed: () {
              setState(() {
                _service.store.clear();
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // 1. BẢNG ĐIỀU KHIỂN CÁC NÚT BẤM DEMO
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.blue.shade50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Bấm các nút dưới đây để chạy thử nghiệm:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    // Nút 1: Thêm hợp lệ từ JSON (Dùng Factory Constructor)
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        safeRun(context, () {
                          _service.addFromJson({
                            'name': 'Bàn phím cơ',
                            'price': 500000,
                          });
                          setState(() {});
                        });
                      },
                      child: const Text('1. Thêm từ JSON (Factory)'),
                    ),

                    // Nút 2: Thêm quà tặng (Dùng Named Constructor)
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        safeRun(context, () {
                          _service.addGift('Chuột không dây');
                          setState(() {});
                        });
                      },
                      child: const Text('2. Quà tặng (Named)'),
                    ),

                    // Nút 3: Thử lỗi JSON (Giá âm) -> Ném MyException
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange.shade800,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        safeRun(context, () {
                          // Cố tình gửi giá âm: -100000
                          _service.addFromJson({
                            'name': 'Sản phẩm lỗi',
                            'price': -100000,
                          });
                          setState(() {});
                        });
                      },
                      child: const Text('3. Lỗi JSON (Giá âm)'),
                    ),

                    // Nút 4: Thử lỗi Crash bất ngờ -> Wrapper gom lại, app không văng
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade800,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        safeRun(context, () {
                          // Cố tình ném lỗi runtime bất ngờ
                          throw StateError('Sự cố chia cho 0 hoặc lỗi hệ thống!');
                        });
                      },
                      child: const Text('4. Thử Crash (Không văng app)'),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // 2. DANH SÁCH SẢN PHẨM HIỂN THỊ TỪ DATASTORE<Product>
          Expanded(
            child: list.isEmpty
                ? const Center(
                    child: Text(
                      'Danh sách đang trống.\nHãy bấm các nút trên để thử nghiệm!',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      final item = list[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text('${index + 1}'),
                          ),
                          title: Text(
                            item.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: Text(
                            item.price == 0
                                ? 'Miễn phí (0 đ)'
                                : '${item.price.toStringAsFixed(0)} đ',
                            style: TextStyle(
                              color: item.price == 0 ? Colors.green : Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

