import 'package:flutter/material.dart';
import 'package:tsl_flutter_template/presentation/theme/extension/theme_extension.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Text('This is Hadi', style: context.textStyle.displayD3),
      ),
    );
  }
}
