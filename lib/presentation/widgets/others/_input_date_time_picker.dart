part of 'widgets.dart';

class InputDateTimePicker extends StatefulWidget {
  const InputDateTimePicker({
    super.key,
    this.initialDate,
    this.onDateSelected,
    required this.hintText,
    this.dateOnly = false,
    this.startDate,
    this.endDate,
    this.validator,
    this.controller,
    this.suffixIcon,
    this.suffixIconSize,
    this.suffixIconColor,
    this.suffixClick,
    this.radius = 12,
    this.fillColor = const Color(0xFFF1F3FC),
    this.hintStyle,
    this.titleStyle,
    this.activeBorderColor,
    this.enabled = true,
  });

  final DateTime? initialDate;
  final void Function(DateTime? dateTime)? onDateSelected;
  final String hintText;
  final bool dateOnly;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final double radius;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final TextStyle? titleStyle;
  final Color? activeBorderColor;
  final bool enabled;

  final Widget? suffixIcon;
  final double? suffixIconSize;
  final Color? suffixIconColor;
  final VoidCallback? suffixClick;

  @override
  State<InputDateTimePicker> createState() => _InputDateTimePickerState();
}

class _InputDateTimePickerState extends State<InputDateTimePicker> {
  late final TextEditingController _controller;
  final format = DateFormat("dd/MM/yyyy");

  DateTime? initialDate;
  bool hasData = false;

  @override
  void initState() {
    super.initState();
    initialDate = widget.initialDate;
    _controller = widget.controller ?? TextEditingController();

    if (widget.initialDate.isValid) {
      _controller.text = widget.dateOnly
          ? widget.initialDate!.toDate()
          : widget.initialDate!.toMonthNameDate();
      hasData = true;
    }

    _controller.addListener(() {
      if (mounted) {
        setState(() {
          hasData = _controller.text.isNotEmpty;
        });
      }
    });
  }

  @override
  void dispose() {
    if (widget.controller == null) _controller.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    if (!context.mounted || !widget.enabled) return;

    DateTime date = initialDate ?? DateTime.now();
    if (widget.startDate.isValid && date.isBefore(widget.startDate!)) {
      date = widget.startDate!;
    }

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: widget.startDate ?? DateTime(1900, 1),
      lastDate: widget.endDate ?? DateTime.now(),
    );

    if (picked != null && mounted) {
      if (widget.dateOnly) {
        initialDate = picked;
        _controller.text = format.format(picked);
        widget.onDateSelected?.call(picked);
      } else {
        final TimeOfDay? time = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(initialDate ?? DateTime.now()),
        );

        if (time != null) {
          final selectedDateTime = DateTime(
            picked.year,
            picked.month,
            picked.day,
            time.hour,
            time.minute,
          );
          initialDate = selectedDateTime;
          _controller.text =
              "${format.format(selectedDateTime)} ${selectedDateTime.toTime()}";
          widget.onDateSelected?.call(selectedDateTime);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      readOnly: true,
      enabled: widget.enabled,
      onTap: _selectDate,
      validator:
          widget.validator ??
          (v) {
            if (v == null || v.isEmpty) return "context.l10n.emptyField";
            return null;
          },
      style:
          widget.titleStyle ??
          context.textStyle.bodyMedium.copyWith(
            color: context.colors.onBackground,
          ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle:
            widget.hintStyle ??
            context.textStyle.bodyMedium.copyWith(
              color: context.colors.disabled,
            ),
        fillColor: widget.fillColor,
        filled: widget.fillColor == null ? false : true,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppConstant.horizontalGap16,
          vertical: AppConstant.verticalGap12,
        ),
        border: InputBorder.none,
        enabledBorder: inputBorder(),
        disabledBorder: inputBorder(isDisabled: true),
        focusedBorder: inputBorder(isActive: true),
        errorBorder: inputBorder(isError: true),
        focusedErrorBorder: inputBorder(isActive: true, isError: true),
        suffixIconConstraints: const BoxConstraints(
          maxHeight: 48,
          maxWidth: 48,
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.only(
            left: AppConstant.horizontalGap4,
            right: AppConstant.horizontalGap16,
          ),
          child: GestureDetector(
            onTap: widget.suffixClick ?? _selectDate,
            child: _buildSuffixIconWithFallback(),
          ),
        ),
      ),
      textAlignVertical: TextAlignVertical.center,
    );
  }

  Widget _buildSuffixIconWithFallback() {
    if (widget.suffixIcon != null) {
      return _applySuffixIconStyling(widget.suffixIcon!);
    }

    return Icon(
      Icons.calendar_month,
      size: widget.suffixIconSize ?? AppConstant.iconSize,
      color: widget.enabled
          ? widget.suffixIconColor ?? context.colors.disabled
          : context.colors.disabled,
    );
  }

  Widget _applySuffixIconStyling(Widget icon) {
    return SizedBox(
      width: widget.suffixIconSize ?? AppConstant.iconSize,
      height: widget.suffixIconSize ?? AppConstant.iconSize,
      child: Center(child: icon),
    );
  }

  InputBorder inputBorder({
    bool isActive = false,
    bool isError = false,
    bool isDisabled = false,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.radius),
      borderSide: BorderSide(
        color: isActive
            ? widget.activeBorderColor ?? Colors.transparent
            : isError
            ? context.colors.error
            : isDisabled
            ? context.colors.onSurface
            : Colors.transparent,
        width: isActive || (isActive && isError) ? 1.6 : 1.2,
        style: BorderStyle.solid,
      ),
    );
  }
}
