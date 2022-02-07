import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'mqtt_manager.dart';

final piMqttManagerProvider = FutureProvider<MQTTManager>((ref) {
  final manager = MQTTManager(
    host: '10.0.0.20',
    topic: 'testTopic',
    identifier: 'Evergreen Test',
  );
  manager.initializeMQTTClient();
  manager.connect();

  return manager;
});
