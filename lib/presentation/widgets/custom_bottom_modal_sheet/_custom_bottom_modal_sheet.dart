part of 'bottom_sheet.dart';

class CustomBottomModalSheet {
  static Future<T?> open<T>(
    BuildContext context,
    Widget child, {
    double? maxHeight,
    double? minHeight,
    double? borderRadius,
    bool isDismissible = true,
    bool isScrollControlled = true,
  }) async {
    return await showModalBottomSheet<T>(
      context: context,
      useRootNavigator: true,
      useSafeArea: true,
      constraints: BoxConstraints(
        maxHeight: maxHeight ?? double.infinity,
        minHeight: minHeight ?? 0.0,
      ),
      isScrollControlled: isScrollControlled,
      isDismissible: isDismissible,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadius ?? 0),
          topRight: Radius.circular(borderRadius ?? 0),
        ),
      ),
      builder: (context) {
        return PopScope(
          canPop: isDismissible,
          child: Material(
            color: Colors.transparent,
            child: AnimatedPadding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.viewInsetsOf(context).bottom,
              ),
              duration: const Duration(milliseconds: 300),
              child: child,
            ),
          ),
        );
      },
    );
  }
}
