import 'package:hooks_riverpod/hooks_riverpod.dart';
// File: main.dart
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:islamic_will/utils/constants.util.dart';
import 'package:islamic_will/views/widgets/profile_image.widget.dart';
import 'package:islamic_will/views/widgets/text.widget.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        spacing: 20.0,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * .37,
                width: double.infinity,
                padding: AppDimensions.cardPadding,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                      AppDimensions.cardRadius * .7,
                    ),
                    bottomRight: Radius.circular(
                      AppDimensions.cardRadius,
                    ),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const IntrinsicWidth(
                          child: UserTile(
                            avatarUrl: "",
                            name: "ADBOU Rahman",
                            detail: "ML Engineer",
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.settings,
                            size: AppDimensions.iconSize,
                            color: AppColors.buttonText,
                          ),
                        )
                      ],
                    ),
                    Column(
                      spacing: 15.0,
                      children: [
                        AppText(
                          'الوصية',
                          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        AppText(
                          'Wasiyyah',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        )
                      ],
                    ),
                    const SizedBox(),
                  ],
                ),
              ),
              Positioned(
                bottom: -40,
                left: AppDimensions.horizontalPadding,
                right: AppDimensions.verticalPadding,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  spacing: 20.0,
                  children: [
                    Expanded(
                      child: ItemCard(
                        title: "Bien",
                        value: "5M",
                        icon: Icons.diamond,
                        color: AppColors.cardBackground,
                      ),
                    ),
                    Expanded(
                      child: ItemCard(
                        title: "Dette",
                        value: "0",
                        icon: Icons.trending_down,
                        color: AppColors.secondary,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: AppDimensions.pagePadding,
              child: Column(
                spacing: 10.0,
                children: [
                  AppText(
                    "Bénéficiaires",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: AppColors.secondaryText),
                  ),
                  const Row(
                    spacing: 10.0,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: FamilyCard(
                          title: "Directe",
                          value: "5",
                          color: AppColors.cardBackground,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          spacing: 10.0,
                          children: [
                            ItemCard(
                              title: "Parenté",
                              value: "7",
                              icon: Icons.account_tree,
                              color: AppColors.cardBackground,
                            ),
                            ItemCard(
                              title: "Don",
                              value: "1",
                              icon: Icons.volunteer_activism_rounded,
                              color: AppColors.cardBackground,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  AppText(
                    "Ressources",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: AppColors.secondaryText),
                  ),
                  StaggeredGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: const [
                      ItemCard(
                        title: "Bien",
                        value: "7",
                        icon: Icons.diamond,
                        color: AppColors.cardBackground,
                      ),
                      ItemCard(
                        title: "Dette",
                        value: "0",
                        icon: Icons.trending_down,
                        color: AppColors.cardBackground,
                      ),
                      ItemCard(
                        title: "Volonté",
                        value: "1",
                        icon: Icons.favorite,
                        color: AppColors.cardBackground,
                      ),
                      ItemCard(
                        title: "Témoin",
                        value: "3",
                        icon: Icons.groups_2,
                        color: AppColors.cardBackground,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      //  bottomNavigationBar: const AppBottomNavigation(),
    );
  }
}

class ItemCard extends StatelessWidget {
  final String title;
  final String value;
  final Color? titleColor;
  final Color? valueColor;
  final IconData icon;
  final Color color;

  const ItemCard({
    super.key,
    required this.title,
    required this.value,
    this.titleColor = AppColors.secondaryText,
    this.valueColor = AppColors.primaryText,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppDimensions.cardPadding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: AppDimensions.cardBorder,
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryText.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10.0,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: AppDimensions.iconCardBorder,
              color: AppColors.cardIconBackground,
            ),
            padding: AppDimensions.contentPadding,
            child: Icon(
              icon,
              color: AppColors.iconColor,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: titleColor ?? AppColors.secondaryText),
                ),
                AppText(
                  value,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: valueColor ?? AppColors.primaryText,
                        fontWeight: FontWeight.bold,
                      ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FamilyMemberCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color titleColor;
  final Color valueColor;

  const FamilyMemberCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    this.titleColor = AppColors.secondaryText,
    this.valueColor = AppColors.primaryText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: AppDimensions.verticalPadding * .5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10.0,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: AppDimensions.iconCardBorder,
              color: AppColors.cardIconBackground,
            ),
            padding: AppDimensions.contentPadding,
            child: Icon(
              icon,
              color: AppColors.iconColor,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  title,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: titleColor),
                ),
                AppText(
                  value,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: valueColor,
                        fontWeight: FontWeight.bold,
                      ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FamilyCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final Color titleColor;
  final Color valueColor;

  const FamilyCard({
    super.key,
    required this.title,
    required this.value,
    required this.color,
    this.titleColor = AppColors.secondaryText,
    this.valueColor = AppColors.primaryText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppDimensions.cardPadding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: AppDimensions.cardBorder,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: titleColor,
                ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          const FamilyMemberCard(
            title: "Homme",
            value: "3",
            icon: Icons.person_rounded,
          ),
          const SizedBox(
            height: 10,
          ),
          const FamilyMemberCard(
            title: "Femme",
            value: "2",
            icon: Icons.person_2_rounded,
          ),
        ],
      ),
    );
  }
}

class UserTile extends StatelessWidget {
  final String avatarUrl;
  final String name;
  final String detail;
  final VoidCallback? onTap;
  const UserTile({
    super.key,
    required this.avatarUrl,
    required this.name,
    required this.detail,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        margin: const EdgeInsets.symmetric(vertical: 2.0),
        child: Row(
          spacing: 10.0,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ProfileImage(
              avatarUrl: avatarUrl,
              size: 40,
              borderWidth: .0,
              borderColor: Colors.transparent,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    name,
                    fontSize: 12.0,
                    color: AppColors.lightText,
                    fontWeight: FontWeight.w700,
                  ),
                  AppText(
                    detail,
                    color: AppColors.lightText,
                    fontSize: 10.0,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
