part of 'widgets.dart';

class WidgetSwiper extends StatelessWidget {
  const WidgetSwiper({
    required super.key,
    required this.isInitial,
    required this.initialChild,
    this.secondChild,
    this.alignment = Alignment.center,
  });

  final bool isInitial;
  final Widget initialChild;
  final Widget? secondChild;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: AnimatedSize(
        duration: const Duration(milliseconds: 500),
        child: isInitial
            ? initialChild
            : secondChild ?? const SizedBox.shrink(),
      ),
    );
  }
}
