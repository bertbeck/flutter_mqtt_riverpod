import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddYourDevice extends HookConsumerWidget {
  const AddYourDevice({
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
                  Text('Add Your Device',
                      style: Theme.of(context).textTheme.headline5),
                  const SizedBox(height: 20),
                  const Text(
                    '''
1. Connect your Device to Ethernet (optional).
2. Plug your Device into Power.
3. Wait 3 Minutes.
4. Is the LED Red or Blue?
''',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(child: const Text('Red'), onPressed: () {}),
                  ElevatedButton(child: const Text('Blue'), onPressed: () {}),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
