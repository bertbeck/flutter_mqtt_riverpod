import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'route2.dart';

final sendWifiProvider = FutureProvider<bool>((_) {
  return Future.delayed(const Duration(seconds: 5), () => true);
});

class Route3 extends HookConsumerWidget {
  const Route3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Route 3'),
      ),
      body: const SafeArea(child: Route3Page()),
      // floatingActionButton: MyFAB(),
    );
  }
}

class Route3Page extends HookConsumerWidget {
  const Route3Page({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedWifi = ref.watch(selectedWifiProvider);
    final password = ref.watch(wifiPasswordProvider);
    final sendWifi = ref.watch(sendWifiProvider);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selected Wifi: $selectedWifi\nPassword: $password',
              style: Theme.of(context).textTheme.headline6,
            ),
            sendWifi.when(
              loading: () {
                return const CircularProgressIndicator();
              },
              data: (bool data) {
                return Text('Success: $data');
              },
              error: (Object error, StackTrace? stackTrace) {
                return Text('Error: $error');
              },
            ),

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
    final _isObscure = useState(true);
    final selectedWifi = ref.watch(selectedWifiProvider.notifier);

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
              value: data.first,
              items: items,
              onChanged: (String? value) {
                selectedWifi.state = value ?? '';
              },
            ),
            TextField(
                controller: passwordController,
                obscureText: _isObscure.value,
                decoration: InputDecoration(
                    labelText: 'WiFi Password',
                    suffixIcon: IconButton(
                        icon: Icon(_isObscure.value
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          _isObscure.value = !_isObscure.value;
                        }))),
            ElevatedButton(
              onPressed: () {
                debugPrint(
                    'CONNECTING: ${selectedWifi.state} ${passwordController.text}');
                Navigator.pop(
                  context,
                );
              },
              child: const Text('Set WiFi!'),
            ),
          ],
        ),
      ),
    );
  }
}