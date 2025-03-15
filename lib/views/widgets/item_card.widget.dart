import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:islamic_will/utils/constants.util.dart';
import 'package:islamic_will/views/widgets/text.widget.dart';

class ItemCard extends ConsumerWidget {
  final IconData icon;
  final String title;
  final int number;
  final VoidCallback onTap;

  const ItemCard({
    super.key,
    required this.icon,
    required this.title,
    this.number = 0,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: AppDimensions.cardBorder,
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryText.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: AppDimensions.cardPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                spacing: 15.0,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: AppDimensions.iconCardBorder,
                      color: AppColors.cardIconBackground,
                    ),
                    padding: AppDimensions.contentPadding,
                    child: Icon(
                      icon,
                      size: 70,
                      color: AppColors.iconColor,
                    ),
                  ),
                  AppText(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: AppColors.secondaryText,
                        ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -8.5,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: AppDimensions.verticalPadding * .7,
                  horizontal: AppDimensions.horizontalPadding * .7,
                ),
                decoration: BoxDecoration(
                  //  color: AppColors.primary,
                  borderRadius: AppDimensions.iconCardBorder,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryText.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: AppText(
                  number.toString(),
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
