import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:progress_indicators/progress_indicators.dart';

// ignore: unused_import
import '../api/http_api.dart';
import '../shared/my_page_frame.dart';

class ConnectToPi extends HookConsumerWidget {
  const ConnectToPi({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uuid = ref.watch(getUuidProvider);
    return MyPageFrame(
      children: [
        Text('Connect to Evergreen',
            style: Theme.of(context).textTheme.headline5),
        const SizedBox(height: 20),
        uuid.when(
          data: (String data) {
            debugPrint('uuid is $data');
            return const _SetCredentials();
          },
          error: (Object error, StackTrace? stackTrace) {
            return Text('Error: $error');
          },
          loading: () {
            return JumpingText('getting device info..');
          },
        )
      ],
      bottomChildren: const [
        ElevatedButton(child: Text('Get Help'), onPressed: null),
      ],
    );
  }
}

class _SetCredentials extends HookConsumerWidget {
  const _SetCredentials({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final setCredentials = ref.watch(setCredentialsOnPiProvider);
    return setCredentials.when(
      data: (dynamic data) {
        return const _IsPiOnline();
      },
      error: (Object error, StackTrace? stackTrace) {
        return Text('Error: $error');
      },
      loading: () {
        return JumpingText('setting credentials..');
      },
    );
  }
}

class _IsPiOnline extends HookConsumerWidget {
  const _IsPiOnline({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPiOnline = ref.watch(getIsPiOnlineProvider);
    return isPiOnline.when(
      data: (isOnline) {
        return _Continue(
          isOnline: isOnline,
        );
      },
      error: (Object error, StackTrace? stackTrace) {
        return Text('Error: $error');
      },
      loading: () {
        return JumpingText('is device online?..');
      },
    );
  }
}

class _Continue extends HookConsumerWidget {
  const _Continue({
    Key? key,
    required this.isOnline,
  }) : super(key: key);

  final bool isOnline;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      child: const Text('Continue'),
      onPressed: () {
        context.pushNamed(isOnline ? 'authorize device' : 'enter wifi');
      },
    );
  }
}
