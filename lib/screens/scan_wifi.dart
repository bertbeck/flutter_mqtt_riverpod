import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../api/http_api.dart';

final piProvider = Provider((ref) => 3.14);
final wifiListProvider = FutureProvider((ref) async {
  final data = await ref.watch(apiWifiListProvider.future);
  debugPrint('wifiListProvider: $data');
  return data;
});

// shared state
final selectedWifiProvider = StateProvider((ref) => '');
final wifiPasswordProvider = StateProvider((ref) => '');

class ScanWifi extends HookConsumerWidget {
  const ScanWifi({
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
            wifiList.when(
                data: (List<String> data) => SelectWiFi(data: data),
                error: (Object error, StackTrace? stackTrace) =>
                    Text('$error $stackTrace'),
                loading: () => const CircularProgressIndicator()),
            // Text(
            //   'Pi says $wifiList',
            //   textAlign: TextAlign.center,
            // ),
          ],
        ),
      ),
    );
  }
}

class SelectWiFi extends HookConsumerWidget {
  final List<String> data;
  const SelectWiFi({
    required this.data,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passwordController = useTextEditingController(text: '');
    final isObscuraState = useState(true);
    final dropdownState = useState(data.first);
    final selectedWifiState = ref.watch(selectedWifiProvider.state);
    final passwordState = ref.watch(wifiPasswordProvider.state);

    final items = [
      for (final item in data) DropdownMenuItem(value: item, child: Text(item))
    ];
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text('$data'),
            DropdownButton<String>(
              value: dropdownState.value,
              items: items,
              onChanged: (String? value) {
                debugPrint(' new wifi is: $value');
                dropdownState.value = value ?? '';
                debugPrint(' updated wifi is: ${dropdownState.value}');
              },
            ),
            TextField(
                controller: passwordController,
                obscureText: isObscuraState.value,
                decoration: InputDecoration(
                    labelText: 'WiFi Password',
                    suffixIcon: IconButton(
                        icon: Icon(isObscuraState.value
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          isObscuraState.value = !isObscuraState.value;
                        }))),
            ElevatedButton(
              onPressed: () {
                selectedWifiState.state = dropdownState.value;
                passwordState.state = passwordController.text;
                debugPrint(
                    'CONNECTING: ${selectedWifiState.state} ${passwordController.text}');
                context.go('/route3');
              },
              child: const Text('Set WiFi!'),
            ),
          ],
        ),
      ),
    );
  }
}
