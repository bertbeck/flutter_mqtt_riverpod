import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthorizeDevice extends HookConsumerWidget {
  const AuthorizeDevice({
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
                  Text('Authorize Device',
                      style: Theme.of(context).textTheme.headline5),
                  const SizedBox(height: 20),
                  const Text('Connect Account Y to device X'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      child: const Text('Continue'),
                      onPressed: () {
                        // context.goNamed('enter wifi');
                      }),
                  const ElevatedButton(
                      child: Text('Get Help'), onPressed: null),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
