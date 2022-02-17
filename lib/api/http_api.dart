import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';

import '../screens/enter_wifi.dart';

final endpoint = Uri.parse('http://10.42.0.1:5000/wifi/scan');
final endpoint2 = Uri.parse('http://10.42.0.1:5000/wifi/set');

// final endpoint = Uri.parse('http://10.0.0.20:5000/wifi/scan');
// final endpoint2 = Uri.parse('http://10.0.0.20:5000/wifi/set');

final uri1 = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
final uri2 = uri1.replace(path: 'todos/2');
final httpClientProvider = Provider((_) => Client());

final apiWifiListProvider = FutureProvider<List<String>>((ref) async {
  final client = ref.watch(httpClientProvider);
  final response =
      await client.get(endpoint, headers: {'Accept': 'application/json'});
  final List decoded = jsonDecode(response.body);
  final wifiList = decoded
      .map<String>((wifi) => wifi.toString())
      .where((e) => e.length < 30 && e.isNotEmpty)
      .toSet()
      .toList()
    ..sort();

  return wifiList;
});

final apiSendWifiProvider = FutureProvider((ref) async {
  final client = ref.watch(httpClientProvider);
  final selectedWifi = ref.watch(selectedWifiProvider);
  final password = ref.watch(wifiPasswordProvider);
  final endwithargs = endpoint2
      .replace(queryParameters: {'ssid': selectedWifi, 'password': password});
  final response =
      await client.get(endwithargs, headers: {'Accept': 'application/json'});
  final decoded = jsonDecode(response.body);
  return decoded;
});
