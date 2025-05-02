import 'package:flutter/material.dart';

class LogoutScreen extends StatelessWidget {
  static const routeName = '/logout';

  const LogoutScreen({super.key});

  void _logout(BuildContext context) {
    // Perform logout logic like clearing tokens/session here

    // Navigate to login or home page
    Navigator.of(context).pushReplacementNamed('/logout'); // change '/login' to your login route
  }

  @override
  Widget build(BuildContext context) {
    // Call logout logic when the screen is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _logout(context);
    });

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(), // Show a loading spinner while logging out
      ),
    );
  }
}
