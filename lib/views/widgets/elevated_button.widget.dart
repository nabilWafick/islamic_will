import 'package:islamic_will/views/widgets/text.widget.dart';
import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? backgroundColor;
  final Function() onPressed;

  const AppElevatedButton({
    super.key,
    required this.text,
    this.textColor,
    this.backgroundColor,
    required this.onPressed,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
        ),
        child: AppText(
          text,
          textAlign: TextAlign.center,
          color: textColor,
        ),
      ),
    );
  }
}
