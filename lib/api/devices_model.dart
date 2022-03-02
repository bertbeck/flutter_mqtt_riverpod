import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/ModelProvider.dart';

// Stream<SubscriptionEvent<Devices>> ipStream =
//     Amplify.DataStore.observe(Devices.classType);

// final ipProvider = StreamProvider((ref) => ipStream);

final ipProvider = FutureProvider<List<Devices>>((ref) {
  var foo = Amplify.DataStore.query(Devices.classType);
  return foo;
});
