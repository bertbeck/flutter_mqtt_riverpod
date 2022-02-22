import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:aws_iot_api/iot-2015-05-28.dart';
import 'package:aws_iot_data_api/iot-data-2015-05-28.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wifi_iot/wifi_iot.dart';

const String _awsIotEndpoint = 'https://iot.us-west-2.amazonaws.com';
const String _awsDataPlaneEndpoint =
    "https://a2fa43d73ede4i-ats.iot.us-west-2.amazonaws.com";

final getAuthSessionProvider =
    FutureProvider((ref) async => await Amplify.Auth.fetchAuthSession(
          options: CognitoSessionOptions(getAWSCredentials: true),
        ) as CognitoAuthSession);

final getIotProvider = FutureProvider((ref) async {
  final clientCredentials = await ref.watch(getAwsCredentialsProvider.future);
  final iot = IoT(
    region: 'us-west-2',
    credentials: clientCredentials,
    endpointUrl: _awsIotEndpoint,
  );
  debugPrint('iot: $iot');
  return iot;
});

final getIotEndpointProvider = FutureProvider((ref) async {
  final iot = await ref.read(getIotProvider.future);
  final describeEndpoint = await iot.describeEndpoint(
    endpointType: 'iot:CredentialProvider',
  );

  debugPrint('describeEndpoint: $describeEndpoint');
  return describeEndpoint;
});

final getIotPolicyProvider = FutureProvider((ref) async {
  final iot = await ref.watch(getIotProvider.future);
  final getPolicy = await iot.getPolicy(
    policyName: 'endOurTears',
  );

  debugPrint('getPolicy: $getPolicy');
  return getPolicy;
});

final iotDataPlaneProvider = FutureProvider((ref) async {
  final clientCredentials = await ref.watch(getAwsCredentialsProvider.future);
  final iotDataPlane = IoTDataPlane(
    region: 'us-west-2',
    credentials: clientCredentials,
    endpointUrl: _awsDataPlaneEndpoint,
  );
  debugPrint('iot: $iotDataPlane');
  return iotDataPlane;
});

final getAwsCredentialsProvider = FutureProvider(
  (ref) async {
    final session = await ref.watch(getAuthSessionProvider.future);
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

final getThingShadowProvider =
    FutureProvider.family<String, String>((ref, value) async {
  final thingShadow = value.split(':');
  final iotDataPlane = await ref.watch(iotDataPlaneProvider.future);
  final getThingShadow = await iotDataPlane.getThingShadow(
    thingName: thingShadow[0],
    shadowName: thingShadow[1],
  );
  debugPrint('getThingShadow for $value: $getThingShadow');
  String s = String.fromCharCodes(getThingShadow.payload ?? []);
  return s;
});
final getShadowListProvider = FutureProvider((ref) async {
  final iotDataPlane = await ref.watch(iotDataPlaneProvider.future);
  final getShadowList =
      await iotDataPlane.listNamedShadowsForThing(thingName: '1');
  debugPrint('getShadowList: $getShadowList');
  return getShadowList;
});

final getSsidProvider = FutureProvider((ref) async {
  final ssid = await WiFiForIoTPlugin.getSSID();
  debugPrint('ssid: $ssid');
  return ssid;
});
