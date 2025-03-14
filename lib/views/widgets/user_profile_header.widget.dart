import 'package:islamic_will/utils/constants.util.dart';
import 'package:islamic_will/views/widgets/profile_image.widget.dart';
import 'package:islamic_will/views/widgets/text.widget.dart';
import 'package:flutter/material.dart';

class UserProfileHeader extends StatelessWidget {
  final String name;
  final String role;
  final String avatarUrl;

  const UserProfileHeader({
    super.key,
    required this.name,
    required this.role,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: MediaQuery.sizeOf(context).height * .27,
      color: AppColors.primary,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ProfileImage(
              avatarUrl: "", size: 70, borderWidth: 1, borderColor: AppColors.secondary),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              AppText(
                name,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 4),
              AppText(
                role,
                fontSize: 14,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
