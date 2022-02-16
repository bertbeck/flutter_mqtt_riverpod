import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConnectToPi extends HookConsumerWidget {
  const ConnectToPi({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        color: Colors.green,
        alignment: Alignment.center,
        child: SafeArea(
          child: Center(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Connect Device to Wifi',
                      style: Theme.of(context).textTheme.headline5),
                  const SizedBox(height: 20),
                  const Text(
                      '1. Connect to Device Hotspot (named something that begins with Evergreen).'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      child: const Text('Continue'), onPressed: () {}),
                  ElevatedButton(
                      child: const Text('Get Help'), onPressed: null),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
