import 'package:flutter/material.dart';
import 'package:inherited_widget/home_page.dart';
import 'package:provider/provider.dart';

import '/auth_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => AuthProvider(), child: MainApp()),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}
