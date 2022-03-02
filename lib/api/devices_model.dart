import 'package:amplify_api/model_queries.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/ModelProvider.dart';

// Stream<SubscriptionEvent<Devices>> ipStream =
//     Amplify.DataStore.observe(Devices.classType);

// final ipProvider = StreamProvider((ref) => ipStream);

final ipProvider = FutureProvider<List<Devices?>?>((ref) async {
  final request = ModelQueries.list(Devices.classType);
  final response = await Amplify.API.query(request: request).response;
  return response.data?.items;
});
