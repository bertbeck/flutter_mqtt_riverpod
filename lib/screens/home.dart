import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'route1.dart';

class Home extends HookConsumerWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const MaterialApp(
      // themeMode: ThemeMode.dark,
      // title: 'Call me an app!',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: Route1(),
    );
  }
}
