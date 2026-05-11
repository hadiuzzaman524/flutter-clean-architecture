part of 'widgets.dart';

class DropdownField<T> extends StatefulWidget {
  const DropdownField({
    super.key,
    this.value,
    required this.items,
    this.hintText,
    this.onChanged,
    this.validator,
    this.borderColor = const Color(0xFFF1F3FC),
    this.focusedBorderColor,
    this.borderRadius,
    required this.buildTitle,
  });

  final T? value;
  final List<T> items;
  final String? hintText;
  final void Function(T? value)? onChanged;
  final String? Function(T? value)? validator;
  final String Function(T value) buildTitle;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final double? borderRadius;

  @override
  State<DropdownField<T>> createState() => _DropdownFieldState();
}

class _DropdownFieldState<T> extends State<DropdownField<T>> {
  T? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.value;
    if (widget.value != null) {
      WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) => widget.onChanged?.call(widget.value),
      );
    }
  }

  InputBorder getBorder(Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(widget.borderRadius ?? AppConstant.borderRadius8),
    borderSide: BorderSide(color: color, width: 1.w),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DecoratedBox(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0x05000000),
                blurRadius: 5,
                offset: Offset(0, 5),
              ),
              BoxShadow(
                color: Color(0x03000000),
                blurRadius: 7,
                offset: Offset(0, 11),
              ),
            ],
          ),
          child: DropdownButtonFormField<T>(
            initialValue: selectedValue,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: AppConstant.horizontalGap16,
              ),
              border: getBorder(widget.borderColor ?? context.colors.primary),
              enabledBorder: getBorder(
                widget.borderColor ?? context.colors.onPrimary,
              ),
              focusedBorder: getBorder(
                widget.focusedBorderColor ?? context.colors.primary,
              ),
              filled: true,
              fillColor: context.colors.surface,
              hintText: widget.hintText,
            ),
            items: widget.items
                .map(
                  (e) => DropdownMenuItem<T>(
                    value: e,
                    child: AutoSizeText(widget.buildTitle(e)),
                  ),
                )
                .toList(),
            onChanged: (val) {
              setState(() => selectedValue = val);
              widget.onChanged?.call(val);
            },
            validator: widget.validator,
          ),
        ),
      ],
    );
  }
}
