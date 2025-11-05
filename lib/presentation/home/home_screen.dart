import 'package:flutter/material.dart';
import 'package:tsl_flutter_template/presentation/theme/text/app_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Template'),
      ),
      body: Center(child: AppText.titleLarge('Hello World')),
    );
  }
}
