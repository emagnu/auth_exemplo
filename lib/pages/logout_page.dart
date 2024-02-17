//   ///
//  Import LIBRARIES
import 'package:auth_exemplo/data/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';
//  Import FILES
//  SIGNALS
//  //   ///

class LogoutPage extends StatelessWidget {
  final LoginController loginController;

  const LogoutPage({super.key, required this.loginController});

  @override
  Widget build(BuildContext context) {
    loginController.isLoggedIn.listen(context, () {
      Navigator.of(context).pop();
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Logout Page')),
      body: Center(
        child: FilledButton(
          onPressed: () {
            loginController.logout();
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
