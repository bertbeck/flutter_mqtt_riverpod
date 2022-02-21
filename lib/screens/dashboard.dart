import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ignore: unused_import
import '../api/iot.dart';

extension JsonfromString on String {
  Map<String, dynamic> toJson() => json.decode(this);
}

class Dashboard extends HookConsumerWidget {
  const Dashboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getIp = ref
        .watch(getThingShadowProvider('RandalPi:ip'))
        .value
        ?.toJson()['state']['reported'];
    debugPrint('ip: $getIp');
    final getFarmConfig = ref
        .watch(getThingShadowProvider('RandalPi:farm_config'))
        .value
        ?.toJson()['state']['reported'];
    debugPrint('farm config: $getFarmConfig');
    final getFarmStatus = ref
        .watch(getThingShadowProvider('RandalPi:farm_status'))
        .value
        ?.toJson()['state']['reported'];
    debugPrint('farm status: $getFarmStatus');
    final getWalletStatus = ref
        .watch(getThingShadowProvider('RandalPi:wallet_status'))
        .value
        ?.toJson()['state']['reported'];
    debugPrint('wallet status: $getWalletStatus');
    final getDeviceConfiguration = ref
        .watch(getThingShadowProvider('RandalPi:device_config'))
        .value
        ?.toJson()['state']['reported'];
    debugPrint('device config: $getDeviceConfiguration');
    final getDeviceStatus = ref
        .watch(getThingShadowProvider('RandalPi:device_status'))
        .value
        ?.toJson()['state']['reported'];
    debugPrint('device status: $getDeviceStatus');

    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Positioned(
              //     left: 0,
              //     top: 0,
              //     child: Transform.rotate(
              //         angle: 0.5,
              //         child: Container(
              //             color: Colors.green, width: 400, height: 300))),
              FractionallySizedBox(
                widthFactor: 0.95,
                heightFactor: 0.95,
                child: Container(
                  // color: Colors.red,
                  color: const Color(0xFFEBEBEB),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(16),
                  child: CustomScrollView(
                    slivers: [
                      SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            // const SizedBox(height: 96),
                            Card(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.ideographic,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('${getWalletStatus?['Balance']}',
                                          style: textTheme.headline2),
                                      // Text('XCH', style: textTheme.headline6),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton.icon(
                                        // style: ElevatedButton.styleFrom(),
                                        onPressed: () {},
                                        icon: const Icon(Icons.send),
                                        label: const Text('Send'),
                                      ),
                                      ElevatedButton.icon(
                                        label: const Text('Receive'),
                                        icon: const Icon(Icons.add_outlined),
                                        onPressed: () {},
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Card(
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.ideographic,
                                    children: [
                                      Text('Current Income',
                                          style: textTheme.headline6),
                                      Text('daily', style: textTheme.bodyText1),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.ideographic,
                                    children: [
                                      Text(
                                          '${getFarmStatus?['Current Profitability']}',
                                          style: textTheme.headline4),
                                      // Text('XCH', style: textTheme.headline6),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.ideographic,
                                    children: [
                                      Text('\$1.68',
                                          style: textTheme.bodyText1),
                                    ],
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('Farming',
                                            style: textTheme.bodyText1),
                                      ]),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Card(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('Coins', style: textTheme.headline6),
                                    ],
                                  ),
                                  Row(
                                    children: const [
                                      FlutterLogo(
                                        size: 48,
                                      ),
                                      FlutterLogo(
                                        size: 48,
                                      ),
                                      FlutterLogo(
                                        size: 48,
                                      ),
                                      FlutterLogo(
                                        size: 48,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Card(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('Apps', style: textTheme.headline6),
                                    ],
                                  ),
                                  Row(
                                    children: const [
                                      FlutterLogo(
                                        size: 48,
                                      ),
                                      FlutterLogo(
                                        size: 48,
                                      ),
                                      FlutterLogo(
                                        size: 48,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Card(
                              child: Column(children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('HDD Farm',
                                        style: textTheme.headline6),
                                  ],
                                ),
                                Table(
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  children: [
                                    TableRow(children: [
                                      Card(
                                        color: const Color(0xffcccccc),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text('Status',
                                                    style: textTheme.subtitle2),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                    'Farming for ${getFarmStatus?['uptime']}',
                                                    style: textTheme.bodyText1),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Card(
                                        color: const Color(0xffcccccc),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text('Pool',
                                                    style: textTheme.subtitle1),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text('Flex Pool',
                                                    style: textTheme.bodyText1),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                                    TableRow(children: [
                                      Card(
                                        color: const Color(0xffcccccc),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text('Size of farm',
                                                    style: textTheme.subtitle1),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                    '${getFarmConfig?['Estimated plot size']}',
                                                    style: textTheme.subtitle1),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Card(
                                        color: const Color(0xffcccccc),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text('Manage Storage',
                                                    style: textTheme.subtitle1),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                IconButton(
                                                  icon: const Icon(Icons.add),
                                                  onPressed: () {},
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                                  ],
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
