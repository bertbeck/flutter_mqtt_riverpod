import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:aws_iot_api/iot-2015-05-28.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authSessionProvider =
    FutureProvider((ref) async => await Amplify.Auth.fetchAuthSession(
          options: CognitoSessionOptions(getAWSCredentials: true),
        ) as CognitoAuthSession);

final iotProvider = FutureProvider((ref) async {
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
  final iot = IoT(
    region: 'us-west-2',
    credentials: clientCredentials,
    endpointUrl: 'https://iot.us-west-2.amazonaws.com',
  );
  debugPrint('iot: $iot');
  return iot;
});
