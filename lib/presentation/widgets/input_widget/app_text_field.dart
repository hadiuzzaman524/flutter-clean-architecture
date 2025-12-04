part of 'widgets.dart';

enum AppTextFieldType { none, email, password, phone, number }

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.focusNode,
    required this.hint,
    this.label,
    this.autoValidate = false,
    this.isObscure = false,
    this.textFieldType = AppTextFieldType.none,
    this.showCounter = false,
    this.prefixIcon,
    this.prefixIconSize,
    this.prefixIconColor,
    this.suffixIcon,
    this.suffixIconSize,
    this.suffixIconColor,
    this.suffixClick,
    this.showLetterCount = false,
    this.maxLength = 200,
    this.maxLines = 1,
    this.minLines = 1,
    this.titleStyle,
    this.hintStyle,
    this.activeBorderColor,
    this.onChanged,
    this.radius = 12,
    this.autoFocus = false,
    this.enabled = true,
    this.willValidate = true,
    this.validator,
    this.fillColor = const Color(0xFFF1F3FC),
    this.readOnly = false,
    this.inputFormatters,
    this.textInputAction,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool autoValidate;
  final bool isObscure;
  final bool showCounter;
  final bool enabled;
  final bool readOnly;
  final AppTextFieldType textFieldType;
  final String hint;
  final String? label;

  final Widget? prefixIcon;
  final double? prefixIconSize;
  final Color? prefixIconColor;

  final Widget? suffixIcon;
  final double? suffixIconSize;
  final Color? suffixIconColor;
  final VoidCallback? suffixClick;

  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final bool showLetterCount;
  final TextStyle? titleStyle;
  final TextStyle? hintStyle;
  final Color? activeBorderColor;
  final void Function(String)? onChanged;
  final bool autoFocus;
  final double radius;
  final bool willValidate;
  final Color? fillColor;
  final TextInputAction? textInputAction;

  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      focusNode: widget.focusNode,
      style:
          widget.titleStyle ??
          Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: context.colors.onSurface),
      obscureText: widget.isObscure,
      autofocus: widget.autoFocus,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      maxLength: widget.showLetterCount ? widget.maxLength : null,
      textInputAction: widget.textInputAction,
      decoration: InputDecoration(
        hintText: widget.hint,
        fillColor: widget.fillColor,
        filled: widget.fillColor == null ? false : true,
        hintStyle:
            widget.hintStyle ??
            context.textStyle.titleLarge.copyWith(
              color: context.colors.disabled,
            ),
        labelText: widget.label,
        labelStyle: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(color: context.colors.onSurface),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        border: InputBorder.none,
        enabledBorder: inputBorder(),
        disabledBorder: inputBorder(isDisabled: true),
        focusedBorder: inputBorder(isActive: true),
        errorBorder: inputBorder(isError: true),
        focusedErrorBorder: inputBorder(isActive: true, isError: true),

        prefixIcon: widget.prefixIcon != null
            ? _applyPrefixIconStyling(widget.prefixIcon!)
            : null,

        suffixIconConstraints:
            (widget.textFieldType == AppTextFieldType.password ||
                widget.suffixIcon != null)
            ? const BoxConstraints(maxHeight: 48, maxWidth: 48)
            : const BoxConstraints(maxHeight: 48, maxWidth: 16),

        suffixIcon: Padding(
          padding: const EdgeInsets.only(left: 4, right: 20),
          child: GestureDetector(
            onTap: widget.suffixClick,
            child: _buildSuffixIcon(),
          ),
        ),

        counterText: widget.showCounter
            ? '${widget.controller?.text.length ?? 0}/${widget.maxLength ?? 200}'
            : null,
      ),
      autovalidateMode: widget.autoValidate
          ? AutovalidateMode.onUserInteraction
          : null,
      keyboardType: widget.textFieldType == AppTextFieldType.email
          ? TextInputType.emailAddress
          : widget.textFieldType == AppTextFieldType.phone
          ? TextInputType.phone
          : widget.textFieldType == AppTextFieldType.number
          ? TextInputType.number
          : TextInputType.text,
      inputFormatters: widget.inputFormatters,
      validator:
          widget.validator ??
          (value) {
            if (!widget.willValidate) return null;
            return null;
          },
      onChanged: widget.onChanged,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
    );
  }

  Widget _buildSuffixIcon() {
    if (widget.suffixIcon != null) {
      return _applySuffixIconStyling(widget.suffixIcon!);
    }

    // if (widget.textFieldType == AppTextFieldType.password) {
    //   return SvgPicture.asset(
    //     widget.isObscure ? SvgAssets.eyeClose : SvgAssets.eyeOpen,
    //     colorFilter: ColorFilter.mode(
    //       context.appColorScheme.content200,
    //       BlendMode.srcIn,
    //     ),
    //     fit: BoxFit.scaleDown,
    //   );
    // }

    return const SizedBox.shrink();
  }

  Widget _applyPrefixIconStyling(Widget icon) {
    return SizedBox(
      width: widget.prefixIconSize ?? 24,
      height: widget.prefixIconSize ?? 24,
      child: Center(
        child: IconTheme(
          data: IconThemeData(
            color: widget.prefixIconColor ?? context.colors.onSurface,
            size: widget.prefixIconSize ?? 24,
          ),
          child: icon,
        ),
      ),
    );
  }

  Widget _applySuffixIconStyling(Widget icon) {
    return SizedBox(
      width: widget.suffixIconSize ?? 24,
      height: widget.suffixIconSize ?? 24,
      child: Center(
        child: IconTheme(
          data: IconThemeData(
            color: widget.suffixIconColor ?? context.colors.onSurface,
            size: widget.suffixIconSize ?? 24,
          ),
          child: icon,
        ),
      ),
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
