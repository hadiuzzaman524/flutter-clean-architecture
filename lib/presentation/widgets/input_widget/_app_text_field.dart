part of 'widgets.dart';

enum AppTextFieldType { none, email, password, phone, number, search }

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
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.textFieldType == AppTextFieldType.password;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      focusNode: widget.focusNode,
      style:
          widget.titleStyle ??
          context.textStyle.bodyMedium.copyWith(
            color: context.colors.onBackground,
          ),
      obscureText: widget.textFieldType == AppTextFieldType.password
          ? _obscureText
          : widget.isObscure,
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
            context.textStyle.bodyMedium.copyWith(
              color: context.colors.disabled,
            ),
        labelText: widget.label,
        labelStyle: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(color: context.colors.disabled),
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
        prefixIcon: widget.prefixIcon != null
            ? _applyPrefixIconStyling(widget.prefixIcon!)
            : _buildLeadingIcon(),
        prefixIconConstraints: const BoxConstraints(
          maxHeight: 48,
          maxWidth: 48,
        ),
        suffixIconConstraints:
            (widget.textFieldType == AppTextFieldType.password ||
                widget.suffixIcon != null)
            ? const BoxConstraints(maxHeight: 48, maxWidth: 48)
            : const BoxConstraints(maxHeight: 48, maxWidth: 16),
        suffixIcon: Padding(
          padding: EdgeInsets.only(
            left: AppConstant.horizontalGap4,
            right: AppConstant.horizontalGap16,
          ),
          child: GestureDetector(
            onTap: widget.textFieldType == AppTextFieldType.password
                ? _togglePasswordVisibility
                : widget.suffixClick,
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
          : widget.textFieldType == AppTextFieldType.password
          ? TextInputType.text
          : TextInputType.text,
      inputFormatters: widget.inputFormatters,
      validator:
          widget.validator ??
          (value) {
            if (!widget.willValidate) return null;

            // Email validation
            if (widget.textFieldType == AppTextFieldType.email) {
              if (value == null || value.isEmpty) {
                return context.l10n.emailRequired;
              }
              final emailRegex = RegExp(
                r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
              );
              if (!emailRegex.hasMatch(value)) {
                return context.l10n.invalidEmail;
              }
            }

            // Password validation (optional - customize as needed)
            if (widget.textFieldType == AppTextFieldType.password) {
              if (value == null || value.isEmpty) {
                return context.l10n.passwordRequired;
              }
              if (value.length < 6) {
                return context.l10n.passwordMinLength;
              }
            }

            return null;
          },
      onChanged: widget.onChanged,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
    );
  }

  Widget? _buildLeadingIcon() {
    return switch (widget.textFieldType) {
      AppTextFieldType.email => Row(
        children: [
          Gap(AppConstant.horizontalGap16),
          _buildDefaultIcon(Icons.email_outlined),
        ],
      ),
      AppTextFieldType.password => Row(
        children: [
          Gap(AppConstant.horizontalGap16),
          _buildDefaultIcon(Icons.lock_outlined),
        ],
      ),
      AppTextFieldType.search => Row(
        children: [
          Gap(AppConstant.horizontalGap16),
          _buildDefaultIcon(Icons.search_rounded),
        ],
      ),
      AppTextFieldType.phone => Row(
        children: [
          Gap(AppConstant.horizontalGap16),
          _buildDefaultIcon(Icons.phone_outlined),
        ],
      ),
      AppTextFieldType.number => Row(
        children: [
          Gap(AppConstant.horizontalGap16),
          _buildDefaultIcon(Icons.numbers_outlined),
        ],
      ),
      AppTextFieldType.none => null,
    };
  }

  Widget _buildDefaultIcon(IconData icon) {
    return SizedBox(
      width: AppConstant.iconSize,
      height: AppConstant.iconSize,
      child: Center(
        child: Icon(
          icon,
          size: 20,
          color: widget.prefixIconColor ?? context.colors.disabled,
        ),
      ),
    );
  }

  Widget _buildSuffixIcon() {
    if (widget.textFieldType == AppTextFieldType.password) {
      return SizedBox(
        width: widget.suffixIconSize ?? AppConstant.iconSize,
        height: widget.suffixIconSize ?? AppConstant.iconSize,
        child: Center(
          child: Icon(
            _obscureText
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: widget.suffixIconColor ?? context.colors.disabled,
            size: widget.suffixIconSize ?? 20,
          ),
        ),
      );
    }
    if (widget.suffixIcon != null) {
      return _applySuffixIconStyling(widget.suffixIcon!);
    }

    return const SizedBox.shrink();
  }

  Widget _applyPrefixIconStyling(Widget icon) {
    return Row(
      children: [
        Gap(AppConstant.horizontalGap16),
        SizedBox(
          width: widget.prefixIconSize ?? AppConstant.iconSize,
          height: widget.prefixIconSize ?? AppConstant.iconSize,
          child: Center(
            child: IconTheme(
              data: IconThemeData(
                color: widget.prefixIconColor ?? context.colors.disabled,
                size: widget.prefixIconSize ?? AppConstant.iconSize,
              ),
              child: icon,
            ),
          ),
        ),
      ],
    );
  }

  Widget _applySuffixIconStyling(Widget icon) {
    return SizedBox(
      width: widget.suffixIconSize ?? AppConstant.iconSize,
      height: widget.suffixIconSize ?? AppConstant.iconSize,
      child: Center(
        child: IconTheme(
          data: IconThemeData(
            color: widget.suffixIconColor ?? context.colors.disabled,
            size: widget.suffixIconSize ?? AppConstant.iconSize,
          ),
          child: icon,
        ),
      ),
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  InputBorder inputBorder({
    bool isActive = false,
    bool isError = false,
    bool isDisabled = false,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.radius),
      borderSide: BorderSide(
        color: isError
            ? context.colors.error
            : isActive
            ? widget.activeBorderColor ?? context.colors.primary
            : isDisabled
            ? context.colors.border
            : context.colors.border,
        width: isActive ? 1.6 : 1.2,
        style: BorderStyle.solid,
      ),
    );
  }
}
