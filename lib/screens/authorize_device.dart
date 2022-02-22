import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../api/iot.dart';
import '../shared/my_page_frame.dart';

final mockCreatePolicyProvider =
    FutureProvider((ref) => Future.delayed(const Duration(seconds: 3)));
final mockAttachPolicyProvider =
    FutureProvider((ref) => Future.delayed(const Duration(seconds: 3)));
final mockWaitForPiToRegisterProvider =
    FutureProvider((ref) => Future.delayed(const Duration(seconds: 3)));
final mockAuthorizingPiProvider =
    FutureProvider((ref) => Future.delayed(const Duration(seconds: 3)));
final mockInstallingSoftwareProvider =
    FutureProvider((ref) => Future.delayed(const Duration(seconds: 3)));

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
        const Text('Connecting Account Y to device X'),
        const SizedBox(height: 20),
        const _CreatePolicy(),
      ],
      bottomChildren: const [
        ElevatedButton(child: Text('Get Help'), onPressed: null),
      ],
    );
  }
}

class _CreatePolicy extends HookConsumerWidget {
  const _CreatePolicy({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createPolicy = ref.watch(setIotPolicyProvider);
    return createPolicy.when(
      data: (data) => const _AttachPolicy(),
      loading: () => JumpingText('creating aws policy..'),
      error: (e, _) => Text('Error: $e'),
    );
  }
}

class _AttachPolicy extends HookConsumerWidget {
  const _AttachPolicy({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final attachPolicy = ref.watch(setAttachIotPolicyProvider);
    return attachPolicy.when(
      data: (data) => const _WaitForPiRegistration(),
      loading: () => JumpingText('attaching aws policy..'),
      error: (e, _) => Text('Error: $e'),
    );
  }
}

class _WaitForPiRegistration extends HookConsumerWidget {
  const _WaitForPiRegistration({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final waitForPiToRegister = ref.watch(getConnectivityProvider);
    return waitForPiToRegister.when(
      data: (data) => const _AuthorizingPi(),
      loading: () => JumpingText('waiting for device to register..'),
      error: (e, _) => Text('Error: $e'),
    );
  }
}

class _AuthorizingPi extends HookConsumerWidget {
  const _AuthorizingPi({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authorizingPi = ref.watch(mockAuthorizingPiProvider);
    return authorizingPi.when(
      data: (data) => const _InstallingSoftware(),
      loading: () => JumpingText('authorizing device..'),
      error: (e, _) => Text('Error: $e'),
    );
  }
}

class _InstallingSoftware extends HookConsumerWidget {
  const _InstallingSoftware({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final installingSoftware = ref.watch(mockInstallingSoftwareProvider);
    return installingSoftware.when(
      data: (data) => const _Continue(),
      loading: () => JumpingText('installing software..'),
      error: (e, _) => Text('Error: $e'),
    );
  }
}

class _Continue extends HookConsumerWidget {
  const _Continue({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      child: const Text('Continue'),
      onPressed: () {
        context.goNamed('sign in to wallet');
      },
    );
  }
}
