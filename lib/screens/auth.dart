import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'home.dart';

class Auth extends HookConsumerWidget {
  const Auth({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Authenticator(
      child: MaterialApp(
        builder: Authenticator.builder(),
        // themeMode: ThemeMode.dark,
        title: 'Call me an app!',
        // theme: ThemeData(
        //   primarySwatch: Colors.blue,
        // ),
        home: const Home(),
      ),
    );
  }
}
