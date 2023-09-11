import 'package:flutter/material.dart';

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
          const SizedBox(
            height: 15,
          ),
          if (noInternetConnection)
            const Text(
              'No Internet Connection',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )
          else
            const Text(
              "Something's wrong",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          const SizedBox(
            height: 12,
          ),
          if (noInternetConnection)
            const Text(
              'Check your connection, then refresh the page.',
              style: TextStyle(
                fontSize: 14,
              ),
            )
          else
            const Text(
              "We're having issue to loading this page",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          const SizedBox(height: 24),
          InkWell(
            onTap: onRefreshPage,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white70,
                border: Border.all(color: Colors.blue, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Refresh',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
