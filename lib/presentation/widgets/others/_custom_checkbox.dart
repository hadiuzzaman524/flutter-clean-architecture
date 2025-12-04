
part of'widgets.dart';
class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({
    super.key,
    this.text,
    this.initialValue = false,
    this.unSelectedColor,
    this.selectedColor,
    this.unSelectedTextStyle,
    this.selectedTextStyle,
    this.onChange,
    this.gap = 8,
    this.title,
  });

  final String? text;
  final Widget? title;
  final bool initialValue;
  final Color? unSelectedColor;
  final Color? selectedColor;
  final TextStyle? unSelectedTextStyle;
  final TextStyle? selectedTextStyle;
  final void Function(bool value)? onChange;
  final double gap;

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  late ValueNotifier<bool> valueNotifier;

  @override
  void initState() {
    valueNotifier = ValueNotifier(widget.initialValue);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    valueNotifier.value = widget.initialValue;
  }

  @override
  void dispose() {
    valueNotifier.dispose();
    super.dispose();
  }

  TextStyle getTextStyle(bool value) {
    final defaultStyle = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: context.colors.primary,
    );

    if (value) {
      if (widget.selectedTextStyle == null) {
        return defaultStyle;
      } else {
        return widget.selectedTextStyle!;
      }
    } else {
      if (widget.unSelectedTextStyle == null) {
        return defaultStyle;
      } else {
        return widget.unSelectedTextStyle!;
      }
    }
  }

  Color getColor(bool value) {
    if (value) {
      if (widget.selectedColor == null) {
        return context.colors.success;
      } else {
        return widget.selectedColor!;
      }
    } else {
      if (widget.unSelectedColor == null) {
        return context.colors.border;
      } else {
        return widget.unSelectedColor!;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: valueNotifier,
      builder: (context, value, child) {
        return InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          onTap: () {
            widget.onChange?.call(!value);
            valueNotifier.value = !value;
          },
          child: Row(
            children: [
              WidgetSwiper(
                key: const ValueKey("___CheckBox___"),
                isInitial: !value,
                /// You can change design from here
                secondChild: Icon(Icons.check_box_rounded),
                initialChild: Icon(Icons.check_box_outline_blank_rounded),
              ),

              if (widget.title == null &&
                  widget.text != null &&
                  widget.text!.isNotEmpty) ...[
                Gap(widget.gap),
                if (widget.title == null)
                  AnimatedDefaultTextStyle(
                    style: getTextStyle(value),
                    duration: const Duration(milliseconds: 400),
                    child: AppText.displayLarge(widget.text!),
                  ),
                Gap(AppConstant.horizontalGap8),
              ],
              if (widget.title != null) ...[
                Gap(widget.gap),
                if (widget.title != null) Expanded(child: widget.title!),
                Gap(AppConstant.horizontalGap8),
              ],
            ],
          ),
        );
      },
    );
  }
}
