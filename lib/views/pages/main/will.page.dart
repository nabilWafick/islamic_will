import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:islamic_will/views/widgets/text.widget.dart';

class WillPage extends ConsumerWidget {
  const WillPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Center(
        child: AppText("Will Page"),
      ),
    );
  }
}
