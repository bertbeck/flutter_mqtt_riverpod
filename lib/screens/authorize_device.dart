import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../shared/my_page_frame.dart';

class AuthorizeDevice extends HookConsumerWidget {
  const AuthorizeDevice({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyPageFrame(
      children: [
        Text('Authorize Device', style: Theme.of(context).textTheme.headline5),
        const SizedBox(height: 20),
        const Text('Connect Account Y to device X'),
        const SizedBox(height: 20),
        
        // TODO: Create policy with thingname
        // TODO: Attach Policy to Cognito user
        // TODO: wait for pi to register with server (greengrass.thingconnectivity), and store IP address
        // TODO: move thing to authorized group
        // TODO: wait for pi greengrass deployment success
       
      ],
      bottomChildren: [
        ElevatedButton(
            child: const Text('Continue'),
            onPressed: () {
              context.goNamed('sign in to wallet');
            }),
        const ElevatedButton(child: Text('Get Help'), onPressed: null),
      ],
    );
  }
}
