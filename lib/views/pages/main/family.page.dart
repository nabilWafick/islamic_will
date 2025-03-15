// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:islamic_will/utils/constants.util.dart';
import 'package:islamic_will/views/widgets/item_card.widget.dart';
import 'package:islamic_will/views/widgets/text.widget.dart';

class FamilyPage extends HookConsumerWidget {
  const FamilyPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: AppDimensions.contentPadding,
      width: double.infinity,
      child: Column(
        spacing: 70.0,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.cardIconBackground,
              borderRadius: AppDimensions.cardBorder,
            ),
            padding: AppDimensions.cardPadding,
            child: Center(
              child: AppText(
                "Membre de la famille",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.secondaryText,
                    ),
              ),
            ),
          ),
          Expanded(
            child: Wrap(
              //  runAlignment: WrapAlignment.center,
              // crossAxisAlignment: WrapCrossAlignment.start,
              //  alignment: WrapAlignment.spaceEvenly,
              runSpacing: 10,
              spacing: 10,
              children: [
                ItemCard(
                  icon: Icons.boy, // ou Icons.person_outline
                  title: "Fils",
                  onTap: () {},
                ),
                ItemCard(
                  icon: Icons.girl, // ou Icons.person_outline
                  title: "Fille",
                  onTap: () {},
                ),
                ItemCard(
                  icon: Icons.woman_rounded,
                  title: "Femme",
                  onTap: () {},
                ),
                ItemCard(
                  icon: Icons.accessibility_rounded,
                  title: "Frère",
                  onTap: () {},
                ),
                ItemCard(
                  icon: Icons.accessibility_new_rounded,
                  title: "Soeur",
                  onTap: () {},
                ),
                ItemCard(
                  icon: Icons.people_rounded,
                  title: "Parents",
                  onTap: () {},
                ),
                ItemCard(
                  icon: Icons.account_tree_rounded,
                  title: "Parenté",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
