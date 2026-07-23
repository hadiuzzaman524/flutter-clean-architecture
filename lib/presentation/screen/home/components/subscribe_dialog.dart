import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/core/constants/app_constant.dart';
import 'package:flutter_template/l10n/l10n.dart';
import 'package:flutter_template/presentation/screen/home/cubits/user_cubit.dart';
import 'package:flutter_template/presentation/theme/base/theme_extension.dart';
import 'package:flutter_template/presentation/theme/text/app_text.dart';

class SubscribeDialog extends StatefulWidget {
  const SubscribeDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (dialogContext) => BlocProvider.value(
        value: context.read<UserCubit>(),
        child: const SubscribeDialog(),
      ),
    );
  }

  @override
  State<SubscribeDialog> createState() => _SubscribeDialogState();
}

class _SubscribeDialogState extends State<SubscribeDialog> {
  bool _isSubscribing = false;

  Future<void> _subscribe() async {
    setState(() => _isSubscribing = true);
    await context.read<UserCubit>().subscribeAndRefresh();
    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.colors;

    return AlertDialog(
      icon: Icon(
        Icons.workspace_premium_rounded,
        color: theme.premium,
        size: 40,
      ),
      title: AppText.titleLarge(
        context.l10n.unlockPremiumTitle,
        textAlign: TextAlign.center,
      ),
      content: AppText.bodyMedium(
        context.l10n.unlockPremiumSubtitle,
        textAlign: TextAlign.center,
        color: theme.onSurface.withAlpha(178),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        TextButton(
          onPressed: _isSubscribing ? null : () => Navigator.of(context).pop(),
          child: Text(context.l10n.cancel),
        ),
        SizedBox(width: AppConstant.horizontalGap8),
        FilledButton(
          onPressed: _isSubscribing ? null : _subscribe,
          child: _isSubscribing
              ? const SizedBox(
                  height: 16,
                  width: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text(context.l10n.subscribe),
        ),
      ],
    );
  }
}
