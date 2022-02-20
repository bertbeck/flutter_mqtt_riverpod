import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyPageFrame extends HookConsumerWidget {
  const MyPageFrame({
    Key? key,
    required this.children,
    this.bottomChildren = const <Widget>[],
  }) : super(key: key);
  final List<Widget> children;
  final List<Widget> bottomChildren;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Center(
          child: FractionallySizedBox(
            widthFactor: 0.8,
            heightFactor: 0.8,
            child: Container(
              color: Colors.white,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(32),
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(children),
                  ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: bottomChildren,
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
