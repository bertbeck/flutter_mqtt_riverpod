import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final piProvider = Provider((ref) => 3.14);
final wifiListProvider = FutureProvider((ref) async {
  return Future.delayed(const Duration(seconds: 5), () => ['wifi1', 'wifi2']);
});

class Route2 extends HookConsumerWidget {
  const Route2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Route 2'),
      ),
      body: const SafeArea(child: Route2Page()),
      // floatingActionButton: MyFAB(),
    );
  }
}

class Route2Page extends HookConsumerWidget {
  const Route2Page({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wifiList = ref.watch(wifiListProvider);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pi says $wifiList',
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(
                  context,
                );
              },
              child: const Text('Done!'),
            ),
          ],
        ),
      ),
    );
  }
}
