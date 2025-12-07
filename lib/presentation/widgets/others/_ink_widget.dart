part of 'widgets.dart';

class InkWidget extends StatelessWidget {
  const InkWidget({
    super.key,
    this.child,
    this.decoration,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
  });

  final Widget? child;
  final BoxDecoration? decoration;
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    BorderRadius? borderRadius;

    if (decoration is BoxDecoration) {
      final boxDecoration = decoration as BoxDecoration;
      if (boxDecoration.borderRadius is BorderRadius) {
        borderRadius = boxDecoration.borderRadius as BorderRadius;
      }
    }
    return Container(
      decoration: decoration,
      child: Material(
        color: Colors.transparent,
        borderRadius: borderRadius,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: onTap,
          onDoubleTap: onDoubleTap,
          onLongPress: onLongPress,
          child: child,
        ),
      ),
    );
  }
}
