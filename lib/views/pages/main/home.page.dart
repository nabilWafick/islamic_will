// File: main.dart
import 'package:flutter/material.dart';
import 'package:islamic_will/utils/constants.util.dart';
import 'package:islamic_will/views/widgets/text.widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * .5,
                width: double.infinity,
                padding: AppDimensions.cardPadding,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(AppDimensions.cardRadius),
                    bottomRight: Radius.circular(AppDimensions.cardRadius),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(),
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
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: -50,
                left: AppDimensions.horizontalPadding,
                right: AppDimensions.verticalPadding,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  spacing: 20.0,
                  children: [
                    MainItem(
                      title: "Biens",
                      value: "5M",
                      icon: Icons.diamond,
                      color: AppColors.cardBackground,
                    ),
                    MainItem(
                      title: "Dettes",
                      value: "0",
                      icon: Icons.trending_down,
                      color: AppColors.secondary,
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
      //  bottomNavigationBar: const AppBottomNavigation(),
    );
  }
}

class MainItem extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const MainItem({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppDimensions.cardPadding,
      width: 200,
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10.0,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: AppDimensions.iconCardBorder, color: AppColors.cardIconBackground),
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
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.secondaryText,
                      ),
                ),
                AppText(
                  value,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.primaryText,
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
