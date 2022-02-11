import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:aws_iot_api/iot-2015-05-28.dart';
import 'package:aws_iot_data_api/iot-data-2015-05-28.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const String _awsIotEndpoint = 'a2fa43d73ede4i-ats.iot.us-west-2.amazonaws.com';

final authSessionProvider =
    FutureProvider((ref) async => await Amplify.Auth.fetchAuthSession(
          options: CognitoSessionOptions(getAWSCredentials: true),
        ) as CognitoAuthSession);

final iotProvider = FutureProvider((ref) async {
  final clientCredentials = await ref.watch(credentialsProvider.future);
  final iot = IoT(
    region: 'us-west-2',
    credentials: clientCredentials,
    endpointUrl: _awsIotEndpoint,
  );
  debugPrint('iot: $iot');
  return iot;
});

final iotDataPlaneProvider = FutureProvider((ref) async {
  final clientCredentials = await ref.watch(credentialsProvider.future);
  final iotDataPlane = IoTDataPlane(
    region: 'us-west-2',
    credentials: clientCredentials,
    endpointUrl: _awsIotEndpoint,
  );
  debugPrint('iot: $iotDataPlane');
  return iotDataPlane;
});

final credentialsProvider = FutureProvider(
  (ref) async {
    final session = await ref.watch(authSessionProvider.future);
    debugPrint('session: $session');
    final credentials = session.credentials;
    final awsAccessKey = credentials?.awsAccessKey ?? 'missing';
    final awsSecretKey = credentials?.awsSecretKey ?? 'missing';
    final awsSessionToken = credentials?.sessionToken ?? 'missing';
    final clientCredentials = AwsClientCredentials(
        accessKey: awsAccessKey,
        secretKey: awsSecretKey,
        sessionToken: awsSessionToken);
    debugPrint('clientCredentials: $clientCredentials');
    return clientCredentials;
  },
);

final getThingShadowProvider = FutureProvider((ref) async {
  final iotDataPlane = await ref.watch(iotDataPlaneProvider.future);
  final getThingShadow = iotDataPlane.getThingShadow(thingName: 'RandalPi');
  debugPrint('getThingShadow: $getThingShadow');
  return getThingShadow;
});
