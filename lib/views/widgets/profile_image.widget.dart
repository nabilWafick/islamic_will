import 'package:islamic_will/utils/constants.util.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String avatarUrl;
  final double size;
  final double borderWidth;
  final Color borderColor;
  final Color? backgroundColor;
  final bool? hideUserIcon;
  final bool isCooperative;

  const ProfileImage({
    super.key,
    required this.avatarUrl,
    required this.size,
    required this.borderWidth,
    required this.borderColor,
    this.backgroundColor,
    this.hideUserIcon,
    this.isCooperative = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: borderWidth,
          color: borderColor,
        ),
        color: backgroundColor ?? AppColors.primary,
      ),
      height: size,
      width: size,
      child: ClipOval(
        child: Image.network(
          avatarUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: backgroundColor ?? AppColors.primary,
              child: hideUserIcon == true
                  ? null
                  : Icon(
                      isCooperative ? Icons.people : Icons.person,
                      size: size * .7,
                      color: Colors.white,
                    ),
            );
          },
        ),
      ),
    );
  }
}
