part of 'widgets.dart';

class InputDateRangePicker extends StatefulWidget {
  const InputDateRangePicker({
    super.key,
    this.initialDateRange,
    this.onDateSelected,
    required this.hintText,
    this.validator,
    this.firstDate,
    this.lastDate,
  });

  final DateTimeRange? initialDateRange;
  final void Function(DateTimeRange? range)? onDateSelected;
  final String hintText;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final String? Function(String?)? validator;

  @override
  State<InputDateRangePicker> createState() => _InputDateRangePickerState();
}

class _InputDateRangePickerState extends State<InputDateRangePicker> {
  final TextEditingController controller = TextEditingController();
  final format = DateFormat("dd/MM/yyyy");

  bool hasData = false;
  DateTimeRange? initialDateRange;

  @override
  void initState() {
    super.initState();
    initialDateRange = widget.initialDateRange;

    if (widget.initialDateRange != null) {
      controller.text =
          '${format.format(widget.initialDateRange!.start)} - ${format.format(widget.initialDateRange!.end)}';
      hasData = true;
    }

    controller.addListener(listen);
  }

  void listen() {
    if (mounted) {
      setState(() {
        hasData = controller.text.isNotEmpty;
      });
    }
  }

  @override
  void dispose() {
    controller.removeListener(listen);
    controller.dispose();
    super.dispose();
  }

  InputBorder get _normalBorder => OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.w),
    borderSide: BorderSide(color: context.colors.disabled, width: 1.w),
  );

  InputBorder get _filledBorder => OutlineInputBorder(
    borderRadius: BorderRadius.circular(AppConstant.borderRadius8),
    borderSide: BorderSide(color: context.colors.background, width: 1.w),
  );

  InputBorder get _errorBorder => OutlineInputBorder(
    borderRadius: BorderRadius.circular(AppConstant.borderRadius8),
    borderSide: BorderSide(color: context.colors.error, width: 1.w),
  );

  Future<void> _selectDate() async {
    if (!context.mounted) return;

    DateTime start = initialDateRange?.start ?? DateTime.now();
    if (widget.firstDate.isValid && start.isBefore(widget.firstDate!)) {
      start = widget.firstDate!;
    }
    DateTime end = initialDateRange?.end ?? DateTime.now();
    if (widget.lastDate.isValid && end.isAfter(widget.lastDate!)) {
      end = widget.lastDate!;
    }

    DateTimeRange range = DateTimeRange(start: start, end: end);

    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      initialDateRange: range,
      firstDate: widget.firstDate ?? DateTime(2025, 1),
      lastDate: widget.lastDate ?? DateTime(DateTime.now().year + 1),
    );

    if (picked != null) {
      initialDateRange = picked;
      widget.onDateSelected?.call(picked);
      controller.text =
          '${format.format(initialDateRange!.start)} - ${format.format(initialDateRange!.end)}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 48.h),
      child: TextFormField(
        controller: controller,
        readOnly: true,
        onTap: _selectDate,
        validator:
            widget.validator ??
            (v) {
              if (v == null || v.isEmpty) return context.l10n.fieldEmpty;
              return null;
            },
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(color: context.colors.disabled),
          contentPadding: EdgeInsets.symmetric(
            horizontal: AppConstant.horizontalGap20,
            vertical: 0,
          ),
          filled: true,
          border: _normalBorder,
          enabledBorder: hasData ? _filledBorder : _normalBorder,
          focusedBorder: _filledBorder,
          errorBorder: _errorBorder,
          focusedErrorBorder: _errorBorder,
          suffixIconConstraints: BoxConstraints(
            maxHeight: 40.h,
            maxWidth: 40.h,
          ),
        ),
        style: Theme.of(
          context,
        ).textTheme.labelMedium?.copyWith(fontSize: 14.sp),
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }
}
