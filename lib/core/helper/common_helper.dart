import 'package:flutter/services.dart';

class CommonHelper {
  static Future<void> copyText({required String text}) async {
    await Clipboard.setData(ClipboardData(text: text));
  }
}
