//   ///
//  Import LIBRARIES
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';
//  Import FILES
import '../data/login_controller.dart';
import 'logout_page.dart';
//  SIGNALS
//  //   ///

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController controller = LoginController();
  late final void Function() disposer;

  @override
  void initState() {
    effect(() => debugPrint(controller.user()?.name ?? 'no user'));
    disposer = effect(() {
      if (controller.isLoggedIn()) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => LogoutPage(
            loginController: controller,
          ),
        ));
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: Scaffold(
        appBar: AppBar(title: const Text('Login Page')),
        body: Center(
          child: Watch((context) => controller.loading.value
              ? const CircularProgressIndicator()
              : FilledButton(
                  onPressed: controller.login,
                  child: const Text('Login'),
                )),
        ),
      ),
    );
  }
}
