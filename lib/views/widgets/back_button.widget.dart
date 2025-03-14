import 'package:islamic_will/utils/constants.util.dart';
import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  final VoidCallback onTap;
  const AppBackButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(1.0),
        margin: EdgeInsets.only(left: 16, top: 16.0, bottom: 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            width: 1.0,
            color: AppColors.background,
          ),
        ),
        child: Icon(
          Icons.arrow_back_ios_rounded,
          size: 20,
        ),
      ),
    );
  }
}
