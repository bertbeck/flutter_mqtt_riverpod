import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../api/http_api.dart';
import '../shared/my_page_frame.dart';

class ConnectToPi extends HookConsumerWidget {
  const ConnectToPi({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uuid = ref.watch(getUuidProvider); // todo: save uuid to datastore
    final isPiOnline = ref.watch(getIsPiOnlineProvider.future);
    return MyPageFrame(
      children: [
        Text('Connect to Evergreen',
            style: Theme.of(context).textTheme.headline5),
        const SizedBox(height: 20),
        uuid.when(
          data: (String data) {
            // refactor to extracted widget
            return ElevatedButton(
              child: const Text('Continue'),
              onPressed: () {
                isPiOnline.then(
                  (isOnline) {
                    context
                        .goNamed(isOnline ? 'authorize device' : 'enter wifi');
                  },
                );
              },
            );
          },
          error: (Object error, StackTrace? stackTrace) {
            return Text('Error: $error');
          },
          loading: () {
            return const CircularProgressIndicator();
          },
        )
      ],
      bottomChildren: const [
        ElevatedButton(child: Text('Get Help'), onPressed: null),
      ],
    );
  }
}
