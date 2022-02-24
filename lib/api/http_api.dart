import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';

import '../screens/enter_wifi.dart';
import 'iot.dart';

final endpoint = Uri.parse('http://10.42.0.1:5000/wifi/scan');
final endpoint2 = Uri.parse('http://10.42.0.1:5000/wifi/set');
final uuidEndpoint = Uri.parse('http://10.42.0.1:5000/uuid/generate');
final setCredentialsEndpoint =
    Uri.parse('http://10.42.0.1:5000/credentials/set');

final getPiIsOnlineEndpoint = Uri.parse('http://10.42.0.1:5000/isOnline');
// final endpoint = Uri.parse('http://10.0.0.20:5000/wifi/scan');
// final endpoint2 = Uri.parse('http://10.0.0.20:5000/wifi/set');

final uri1 = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
final uri2 = uri1.replace(path: 'todos/2');
final httpClientProvider = Provider((_) => Client());

final getUuidProvider = FutureProvider((ref) async {
  final client = ref.watch(httpClientProvider);
  final response =
      await client.get(uuidEndpoint, headers: {'Accept': 'application/json'});
  final decoded = jsonDecode(response.body);
  return decoded['uuid'] as String;
});

final getIsPiOnlineProvider = FutureProvider((ref) async {
  final client = ref.watch(httpClientProvider);
  final response = await client
      .get(getPiIsOnlineEndpoint, headers: {'Accept': 'application/json'});
  final decoded = jsonDecode(response.body);
  return decoded['status'] as bool;
});

final getWifiListProvider = FutureProvider<List<String>>((ref) async {
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

final setWifiOnPiProvider = FutureProvider((ref) async {
  final client = ref.watch(httpClientProvider);
  final selectedWifi = ref.watch(selectedWifiProvider);
  final password = ref.watch(wifiPasswordProvider);
  final endwithargs = endpoint2
      .replace(queryParameters: {'ssid': selectedWifi, 'password': password});
  final response =
      await client.get(endwithargs, headers: {'Accept': 'application/json'});
  final decoded = jsonDecode(response.body);
  debugPrint(decoded.toString());
  return true;
});

final setCredentialsOnPiProvider = FutureProvider((ref) async {
  final client = ref.watch(httpClientProvider);

  final credentials = await ref.watch(getAwsCredentialsProvider.future);
  final accessKey = credentials.accessKey;
  final secretKey = credentials.secretKey;
  final sessionToken = credentials.sessionToken;

  // final endwithargs = setCredentialsEndpoint.replace(queryParameters: {
  //   'accessKey': accessKey,
  //   'secretKey': secretKey,
  //   'sessionToken': sessionToken
  // });

  final sendBody = {
    'accessKey': accessKey,
    'secretKey': secretKey,
    'sessionToken': sessionToken,
  };
  final response = await client.post(setCredentialsEndpoint,
      body: jsonEncode(sendBody), headers: {'Accept': 'application/json'});
  final decoded = jsonDecode(response.body);
  return decoded;
});
