//   ///
//  Import LIBRARIES
import 'dart:math';

import 'package:signals_flutter/signals_flutter.dart';
//  Import FILES
import 'user.dart';
//  SIGNALS
//  //   ///

class LoginController {
  final Signal<User?> user = signal<User?>(null); //.value(null);
  late final Computed<bool> isLoggedIn = computed(() => user() is User);
  final Signal<bool> loading = signal<bool>(false); //.value(false);

  login() async {
    loading.value = true;
    await Future.delayed(const Duration(seconds: 3));
    user.value = User(name: 'emagnu', email: 'eemagnu@gmail.com');
    loading.value = false;
  }

  logout() {
    user.value = null;
  }
}
