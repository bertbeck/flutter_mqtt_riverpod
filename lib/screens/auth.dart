import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../shared/theme.dart';
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
        title: 'Call me an app!',
        theme: getGlobalTheme(),
        home: const Home(),
      ),
    );
  }
}
