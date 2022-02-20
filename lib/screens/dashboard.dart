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
    // final getIp = ref
    //     .watch(getThingShadowProvider('RandalPi:ip'))
    //     .value
    //     ?.toJson()['state']['reported'];
    // final getFarmConfig = ref
    //     .watch(getThingShadowProvider('RandalPi:farm_config'))
    //     .value
    //     ?.toJson()['state']['reported'];
    // final getFarmStatus = ref
    //     .watch(getThingShadowProvider('RandalPi:farm_status'))
    //     .value
    //     ?.toJson()['state']['reported'];
    // final getWalletStatus = ref
    //     .watch(getThingShadowProvider('RandalPi:wallet_status'))
    //     .value
    //     ?.toJson()['state']['reported'];
    // final getDeviceConfiguration = ref
    //     .watch(getThingShadowProvider('RandalPi:device_config'))
    //     .value
    //     ?.toJson()['state']['reported'];
    // final getDeviceStatus = ref
    //     .watch(getThingShadowProvider('RandalPi:device_status'))
    //     .value
    //     ?.toJson()['state']['reported'];

    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: FractionallySizedBox(
            widthFactor: 0.9,
            heightFactor: 0.9,
            child: Container(
              color: Colors.red,
              // color: const Color(0xFFEBEBEB),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16),
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Wallet 1', style: textTheme.headline6),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.ideographic,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('6.2', style: textTheme.headline2),
                                  Text('XCH', style: textTheme.headline6),
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
                        Card(
                            child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.ideographic,
                              children: [
                                Text('Current Profitability',
                                    style: textTheme.headline6),
                                Text('daily', style: textTheme.bodyText1),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.ideographic,
                              children: [
                                Text('0.006144', style: textTheme.headline4),
                                Text('XCH', style: textTheme.headline6),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.ideographic,
                              children: [
                                Text('\$1.68', style: textTheme.bodyText1),
                              ],
                            )
                          ],
                        ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
