import 'package:islamic_will/utils/constants.util.dart';
import 'package:islamic_will/views/widgets/text.widget.dart';
import 'package:flutter/material.dart';

class AppElevatedIconButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? textColor;
  final Color? backgroundColor;
  final ButtonStyle? buttonStyle;
  final Function() onTap;

  const AppElevatedIconButton({
    super.key,
    required this.icon,
    required this.text,
    this.textColor,
    this.backgroundColor,
    this.buttonStyle,
    required this.onTap,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: IntrinsicWidth(
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppValues.cardRadius * .7),
              color: AppColors.primary,
            ),
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: Row(
              spacing: 15.0,
              children: [
                Icon(
                  icon,
                  size: 20.0,
                  color: AppColors.background,
                ),
                AppText(
                  text,
                  color: AppColors.background,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w700,
                ),
              ],
            )),
      ),
    );
  }
}
