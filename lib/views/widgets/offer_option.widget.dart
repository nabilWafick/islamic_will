import 'package:islamic_will/utils/constants.util.dart';
import 'package:islamic_will/views/widgets/text.widget.dart';
import 'package:flutter/material.dart';

class OfferOption extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  const OfferOption({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: AppValues.circularBorder,
          color: AppColors.cardBackground,
        ),
        padding: const EdgeInsets.all(AppValues.padding * .5),
        child: Row(
          spacing: 15.0,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                //  color: AppColors.primary,
              ),
              child: Icon(
                icon,
                color: AppColors.primary,
                //  size: 30.0,
              ),
            ),
            Expanded(
              child: AppText(
                label,
                fontSize: 14.0,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.cardIconBackground,
              size: 20.0,
            )
          ],
        ),
      ),
    );
  }
}
