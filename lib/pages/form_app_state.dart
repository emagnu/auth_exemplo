//   ///
//  Import LIBRARIES
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';
//  Import FILES
//  SIGNALS
//  //   ///

class FormAppState extends StatelessWidget {
  final Signal<String> email = signal('');
  final Signal<String> passw = signal('');
  late final Computed<bool> isValid =
      computed(() => email().isNotEmpty && passw().isNotEmpty);
  // computed(() => email.value.isNotEmpty && passw.value.isNotEmpty);
  final Signal<String?> passError = signal<String?>(null);

  FormAppState({super.key});

  validateForm() {
    debugPrint('validateForm');
    if (passw.value.length >= 6) {
      // passError.set(null);
      passError.value = null;
      debugPrint('Good - Password length ${passw().length}');
    } else {
      // passError.set('Password must be at least 6 characters');
      passError.value = 'Error! Minimo de 6 caracteres';
      debugPrint('Error - Password length ${passw().length}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authorisation Page',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Flexible(
              flex: 4,
              child: TextField(
                onChanged: email.set,
                // onChanged: (value) => email.set(value),
                // onChanged: (value) => email.value = value,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Email'),
                    hintText: 'email'),
              ),
            ),
            const Spacer(flex: 1),
            Flexible(
              flex: 5,
              child: TextField(
                onChanged: passw.set,
                // onChanged: (value) => passw.set(value),
                // onChanged: (value) => passw.value = value,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    label: const Text('Password'),
                    errorText: passError.watch(context), //passError.value,
                    hintText: 'password'),
              ),
            ),
            const Spacer(flex: 1),
            Flexible(
              flex: 5,
              child: SizedBox(
                //width: MediaQuery.sizeOf(context).width),
                height: 60,
                child: FilledButton(
                    // onPressed: () {debugPrint('FilledButton pressed');},
                    onPressed: isValid.watch(context) ? validateForm : null,
                    child: const Text('Ingresar')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
