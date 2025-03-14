import 'package:flutter/material.dart';
import 'package:islamic_will/views/pages/main/home.page.dart';

void main() {
  runApp(const IslamicWill());
}

class IslamicWill extends StatelessWidget {
  const IslamicWill({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}
