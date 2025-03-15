import 'package:islamic_will/utils/constants.util.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String avatarUrl;
  final double size;
  final double borderWidth;
  final Color borderColor;
  final Color? backgroundColor;
  final bool? hideUserIcon;
  final bool isGroup;

  const ProfileImage({
    super.key,
    required this.avatarUrl,
    required this.size,
    required this.borderWidth,
    required this.borderColor,
    this.backgroundColor,
    this.hideUserIcon,
    this.isGroup = false,
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
        color: backgroundColor ?? AppColors.cardIconBackground,
      ),
      height: size,
      width: size,
      child: ClipOval(
        child: Image.network(
          avatarUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              // decoration: BoxDecoration(
              //   color: backgroundColor ?? AppColors.cardIconBackground,
              //   border: Border.all(width: .0),
              // ),
              child: hideUserIcon == true
                  ? null
                  : Icon(
                      isGroup ? Icons.people : Icons.person,
                      size: size * .7,
                      color: AppColors.iconColor,
                    ),
            );
          },
        ),
      ),
    );
  }
}
