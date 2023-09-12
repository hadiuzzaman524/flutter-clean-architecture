import 'package:flutter/material.dart';
import 'package:network_calling/resources/app_text.dart';

class ApiInfoCard extends StatelessWidget {
  const ApiInfoCard({
    required this.apiName,
    required this.description,
    required this.url,
    super.key,
  });

  final String apiName;
  final String description;
  final String url;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: AppText.largeBold(apiName),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.normal(description),
          AppText.small(url),
        ],
      ),
    );
  }
}
