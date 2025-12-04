part of 'widgets.dart';

class CustomRadioButton<T> extends StatelessWidget {
  const CustomRadioButton({
    super.key,
    required this.value,
    required this.onTap,
    required this.title,
  });

  final VoidCallback onTap;
  final T value;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<T>(
          value: value,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          fillColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.selected)) {
              return context.colors.primary;
            }
            return context.colors.onPrimary;
          }),
        ),
        InkWidget(
          onTap: onTap,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(AppConstant.borderRadius4),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppConstant.horizontalGap4,
              vertical: AppConstant.verticalGap4,
            ),
            child: AppText.titleMedium(title),
          ),
        ),
      ],
    );
  }
}
