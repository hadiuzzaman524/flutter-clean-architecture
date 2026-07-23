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
    // Don't show if already showing
    if (_showing) return false;

    _showing = true;
    final flag =
        await showModalBottomSheet<bool>(
          context: context,
          isScrollControlled: true,
          isDismissible: !force,
          enableDrag: !force,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) => AppUpdateDialog._internal(
            force: force,
            title: title,
            description: description,
          ),
        ) ??
        false;

    _showing = false;
    return flag;
  }

  const AppUpdateDialog._internal({
    required this.title,
    required this.description,
    required bool force,
  }) : _force = force;

  @override
  Widget build(BuildContext context) {
    return _DialogPage(force: _force, title: title, description: description);
  }
}

class _DialogPage extends StatelessWidget {
  const _DialogPage({
    required this.force,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;
  final bool force;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Gap(AppConstant.horizontalGap16),
            if (!force) ...[
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Gap(AppConstant.horizontalGap16),
            ],
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            Gap(AppConstant.horizontalGap16),

            // Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                description,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),

            Gap(AppConstant.horizontalGap16),

            // Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  // Cancel button (only show if not force update)
                  if (!force) ...[
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          side: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        child: Text(
                          context.l10n.updateLater,
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                    Gap(AppConstant.horizontalGap16),
                  ],

                  // Update button
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        context.l10n.updateNow,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Gap(AppConstant.horizontalGap16),
          ],
        ),
      ),
    );
  }
}
