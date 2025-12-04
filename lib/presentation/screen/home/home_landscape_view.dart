import 'package:flutter/material.dart';
import 'package:tsl_flutter_template/presentation/screen/home/components/theme_drop_down_button.dart';
import 'package:tsl_flutter_template/presentation/screen/home/components/user_list.dart';

class HomeLandscapeView extends StatelessWidget {
  const HomeLandscapeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Template'),
        actions: [ThemeDropDownButton()],
      ),
      body: const UserList(),
    );
  }
}
