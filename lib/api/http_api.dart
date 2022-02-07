import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';

final uri1 = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
final uri2 = uri1.replace(path: 'todos/2');
final httpClientProvider = Provider((_) => Client());

final apiWifiListProvider = FutureProvider((ref) async {
  final client = ref.watch(httpClientProvider);
  final response =
      await client.get(uri1, headers: {'Accept': 'application/json'});
  final decoded = jsonDecode(response.body);
  return decoded;
});

final apiSendWifiProvider = FutureProvider((ref) async {
  final client = ref.watch(httpClientProvider);
  final response =
      await client.get(uri2, headers: {'Accept': 'application/json'});
  final decoded = jsonDecode(response.body);
  return decoded;
});
