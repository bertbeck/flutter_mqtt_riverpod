// remember to add flutter_hooks and hooks_riverpod to pubspec.yaml
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'screens/home.dart';

void main() {
  runApp(
    const ProviderScope(
      child: Home(),
    ),
  );
}
