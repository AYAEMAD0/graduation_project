import 'package:flutter/material.dart';
import 'package:mock_mate_ai/core/routes/app_routes.dart';
import 'package:mock_mate_ai/core/routes/auth_guard.dart';

import '../config/di.dart';
import '../../domain/repo/auth/token/token_storage.dart';

class ProtectedRoute extends StatelessWidget {

  final Widget child;

  const ProtectedRoute({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<bool>(
      future: AuthGuard.isLoggedIn(
        getIt<TokenStorage>(),
      ),

      builder: (context, snapshot) {

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        final isLoggedIn = snapshot.data ?? false;

        if (!isLoggedIn) {

          WidgetsBinding.instance.addPostFrameCallback((_) {

            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.login,
                  (route) => false,
            );

          });

          return const SizedBox.shrink();
        }

        return child;
      },
    );
  }
}