import 'package:flutter/material.dart';
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
            AppText.largeBold('No Internet Connection')
          else
            AppText.largeBold("Something's wrong"),
          const SizedBox(height: 12),
          if (noInternetConnection)
            AppText.small('Check your connection, then refresh the page.')
          else
            AppText.large("We're having issue to loading this page"),
          const SizedBox(height: 24),
          Material(
            child: InkWell(
              onTap: onRefreshPage,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 6),
                decoration: BoxDecoration(
                  color: context.colors.primaryColor,
                  border: Border.all(color: Colors.blue, width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: AppText.normal('Refresh'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
