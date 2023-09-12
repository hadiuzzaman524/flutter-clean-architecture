import 'package:flutter/material.dart';
import 'package:network_calling/l10n/l10n.dart';
import 'package:network_calling/resources/app_colors.dart';
import 'package:network_calling/resources/app_text.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({
    required this.noInternetConnection,
    required this.onRefreshPage,
    super.key,
  });

  final bool noInternetConnection;

  final VoidCallback onRefreshPage;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/noint.png',
            height: 165,
            width: 165,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 15),
          if (noInternetConnection)
            AppText.largeBold(l10n.noInternetTitleText)
          else
            AppText.largeBold(l10n.somethingsWrongText),
          const SizedBox(height: 12),
          if (noInternetConnection)
            AppText.small(l10n.noInternetDetails)
          else
            AppText.large(l10n.someThingsWrongDetails),
          const SizedBox(height: 24),
          Material(
            child: InkWell(
              onTap: onRefreshPage,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 6),
                decoration: BoxDecoration(
                  color: context.colors.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: AppText.normal(l10n.refreshText),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
