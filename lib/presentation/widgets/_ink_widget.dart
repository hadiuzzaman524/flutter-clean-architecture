part of "widgets.dart";

class InkWidget extends StatelessWidget {
  const InkWidget({super.key, this.child, this.decoration, this.onTap});

  final Widget? child;
  final BoxDecoration? decoration;
  final VoidCallback? onTap;

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
        child: InkWell(borderRadius: borderRadius, onTap: onTap, child: child),
      ),
    );
  }
}
