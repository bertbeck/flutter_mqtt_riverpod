import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MQTTManager {
  // Private instance of client
  MqttServerClient? _client;
  final String _identifier;
  final String _host;
  final String _topic;

  // Constructor
  // ignore: sort_constructors_first
  MQTTManager({
    required String host,
    required String topic,
    required String identifier,
  })  : _identifier = identifier,
        _host = host,
        _topic = topic;
  void initializeMQTTClient() {
    _client = MqttServerClient(_host, _identifier);
    _client!.port = 1883;
    _client!.keepAlivePeriod = 20;
    _client!.onDisconnected = onDisconnected;
    _client!.secure = false;
    _client!.logging(on: true);

    /// Add the successful connection callback
    _client!.onConnected = onConnected;
    _client!.onSubscribed = onSubscribed;

    final MqttConnectMessage connMess = MqttConnectMessage()
        .withClientIdentifier(_identifier)
        .withWillTopic(
            'willtopic') // If you set this you must set a will message
        .withWillMessage('My Will message')
        .startClean() // Non persistent session for testing
        .withWillQos(MqttQos.atLeastOnce);
    debugPrint('EXAMPLE::Mosquitto client connecting....');
    _client!.connectionMessage = connMess;
  }

  // Connect to the host
  // ignore: avoid_void_async
  void connect() async {
    assert(_client != null);
    try {
      debugPrint('EXAMPLE::Mosquitto start client connecting....');
      // _currentState.setAppConnectionState(MQTTAppConnectionState.connecting);
      await _client!.connect();
    } on Exception catch (e) {
      debugPrint('EXAMPLE::client exception - $e');
      disconnect();
    }
  }

  void disconnect() {
    debugPrint('Disconnected');
    _client!.disconnect();
  }

  void publish(String message) {
    final MqttClientPayloadBuilder builder = MqttClientPayloadBuilder();
    builder.addString(message);
    _client!.publishMessage(_topic, MqttQos.exactlyOnce, builder.payload!);
  }

  /// The subscribed callback
  void onSubscribed(String topic) {
    debugPrint('EXAMPLE::Subscription confirmed for topic $topic');
  }

  /// The unsolicited disconnect callback
  void onDisconnected() {
    debugPrint(
        'EXAMPLE::OnDisconnected client callback - Client disconnection');
    if (_client!.connectionStatus!.returnCode ==
        MqttConnectReturnCode.noneSpecified) {
      debugPrint(
          'EXAMPLE::OnDisconnected callback is solicited, this is correct');
    }
  }

  /// The successful connect callback
  void onConnected() {
    debugPrint('EXAMPLE::Mosquitto client connected....');
    _client!.subscribe(_topic, MqttQos.atLeastOnce);
    _client!.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      // ignore: avoid_as
      final MqttPublishMessage recMess = c![0].payload as MqttPublishMessage;

      // final MqttPublishMessage recMess = c![0].payload;
      final String pt =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      // _currentState.setReceivedText(pt);
      debugPrint(
          'EXAMPLE::Change notification:: topic is <${c[0].topic}>, payload is <-- $pt -->');
      debugPrint('');
    });
    debugPrint(
        'EXAMPLE::OnConnected client callback - Client connection was sucessful');
  }

  @override
  String toString() {
    return 'MQTTManager(_client: $_client, _identifier: $_identifier, _host: $_host, _topic: $_topic)';
  }
}
