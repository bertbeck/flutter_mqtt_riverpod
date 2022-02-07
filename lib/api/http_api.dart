import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';

final uri = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');

final httpClientProvider = Provider((_) => Client());

final apiWifiListProvider = FutureProvider((ref) async {
  final client = ref.watch(httpClientProvider);
  final response =
      await client.get(uri, headers: {'Accept': 'application/json'});
  final decoded = jsonDecode(response.body);
  return decoded;
});
