part of 'widgets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showSettingsIcon;
  final bool showNotificationIcon;
  final bool showBackIcon;
  final Widget? leading;
  final String? title;
  final VoidCallback? onBackIconTap;
  final List<Widget> action;
  final double actionSpacing;
  final bool centerTitle;
  final Color? backgroundColor;

  const CustomAppBar({
    super.key,
    this.showSettingsIcon = false,
    this.showNotificationIcon = false,
    this.showBackIcon = false,
    this.leading,
    this.title,
    this.onBackIconTap,
    this.action = const [],
    this.actionSpacing = 12,
    this.centerTitle = false,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? context.colors.background,
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      centerTitle: centerTitle,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (showBackIcon)
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: context.colors.onPrimary,
                  ),
                  onPressed: onBackIconTap ?? () => context.pop(),
                ),
              if (leading != null && !showBackIcon)
                Padding(
                  padding: EdgeInsets.only(right: AppConstant.horizontalGap8),
                  child: leading!,
                ),
            ],
          ),
          if (title != null)
            AppText.displaySmall(title!, color: context.colors.primary),
          const Spacer(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < action.length; i++) ...[
                action[i],
                if (i < action.length - 1) Gap(actionSpacing.w),
              ],
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
