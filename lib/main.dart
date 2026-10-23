import 'package:flutter/material.dart';
import 'home_screen.dart';

// ============================================================================
// ĐIỂM KHỞI CHẠY ỨNG DỤNG (ENTRY POINT)
// ============================================================================

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OOP Nâng Cao & Xử Lý Lỗi trong Dart',
      home: HomeScreen(),
    );
  }
}
