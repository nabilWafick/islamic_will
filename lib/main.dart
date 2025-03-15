import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:islamic_will/views/pages/main/main.page.dart';
import 'package:toastification/toastification.dart';

void main() {
  runApp(
    const ProviderScope(
      child: IslamicWill(),
    ),
  );
}

class IslamicWill extends StatelessWidget {
  const IslamicWill({super.key});

  @override
  Widget build(BuildContext context) {
    return const ToastificationWrapper(
      child: MaterialApp(
        home: Scaffold(
          body: MainPage(),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
