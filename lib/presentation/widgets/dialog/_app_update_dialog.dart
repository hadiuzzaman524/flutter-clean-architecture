part of 'dialog.dart';

class AppUpdateDialog extends StatelessWidget {
  static bool _showing = false;
  final bool _force;
  final String title;
  final String description;

  static Future<bool> show(
    BuildContext context, {
    required bool force,
    required String title,
    required String description,
  }) async {
    if (_showing) _showing = true;
    final flag =
        await showModalBottomSheet<bool>(
          context: context,
          isScrollControlled: true,
          isDismissible: !force,
          enableDrag: false,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) => AppUpdateDialog._soft(
            key: const ValueKey('soft_update'),
            title: title,
            description: description,
          ),
        ) ??
        false;
    _showing = false;
    return flag;
  }

  const AppUpdateDialog._soft({
    super.key,
    required this.title,
    required this.description,
  }) : _force = false;

  const AppUpdateDialog.force({
    super.key,
    required this.title,
    required this.description,
  }) : _force = true;

  @override
  Widget build(BuildContext context) {
    return _DialogPage(_force, title, description);
  }
}

class _DialogPage extends StatelessWidget {
  const _DialogPage(this.force, this.title, this.description);

  final String title;
  final String description;

  final bool force;

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}
