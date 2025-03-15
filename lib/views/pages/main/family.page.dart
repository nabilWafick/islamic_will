// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:islamic_will/utils/constants.util.dart';
import 'package:islamic_will/views/widgets/text.widget.dart';

class FamilyPage extends HookConsumerWidget {
  const FamilyPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wrap(
      runSpacing: 20,
      spacing: 20,
      children: [
        FamilyMemberCard(
          icon: Icons.person,
          title: "Fils",
          onTap: () {},
        ),
        FamilyMemberCard(
          icon: Icons.person,
          title: "Fille",
          onTap: () {},
        ),
        FamilyMemberCard(
          icon: Icons.person,
          title: "Femme",
          onTap: () {},
        ),
        FamilyMemberCard(
          icon: Icons.person,
          title: "Frère",
          onTap: () {},
        ),
        FamilyMemberCard(
          icon: Icons.person,
          title: "Soeur",
          onTap: () {},
        ),
        FamilyMemberCard(
          icon: Icons.person,
          title: "Parents",
          onTap: () {},
        ),
        FamilyMemberCard(
          icon: Icons.person,
          title: "Parenté",
          onTap: () {},
        ),
      ],
    );
  }
}

class FamilyMemberCard extends ConsumerWidget {
  final IconData icon;
  final String title;
  final int number;
  final VoidCallback onTap;

  const FamilyMemberCard({
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
                      size: 50,
                      color: AppColors.iconColor,
                    ),
                  ),
                  AppText(
                    title,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: AppColors.secondaryText,
                        ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 10,
              right: -1,
              child: Container(
                padding: EdgeInsets.all(
                  AppDimensions.verticalPadding * .3,
                ),
                decoration: BoxDecoration(
                  color: AppColors.cardIconBackground,
                  borderRadius: AppDimensions.iconCardBorder,
                ),
                child: AppText(
                  number.toString(),
                  style:
                      Theme.of(context).textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
