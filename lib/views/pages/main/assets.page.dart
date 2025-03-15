// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:islamic_will/utils/constants.util.dart';
import 'package:islamic_will/views/widgets/item_card.widget.dart';
import 'package:islamic_will/views/widgets/text.widget.dart';

class AssetsPage extends HookConsumerWidget {
  const AssetsPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: AppDimensions.contentPadding,
      width: double.infinity,
      child: Column(
        spacing: 5,
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
                "Ressources",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.secondaryText,
                    ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                padding: const EdgeInsetsDirectional.only(top: 30, bottom: 100.0),
                child: StaggeredGrid.count(
                    //  runAlignment: WrapAlignment.center,
                    // crossAxisAlignment: WrapCrossAlignment.start,
                    //  alignment: WrapAlignment.spaceEvenly,
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: [
                      ItemCard(
                        icon: Icons.money_off_rounded,
                        title: "Dette",
                        onTap: () {},
                      ),
                      ItemCard(
                        icon: Icons.attach_money_rounded,
                        title: "Prêt",
                        onTap: () {},
                      ),
                      ItemCard(
                        icon: Icons.account_balance_wallet_rounded,
                        title: "Portefeuille",
                        onTap: () {},
                      ),
                      ItemCard(
                        icon: Icons.credit_card_rounded,
                        title: "Carte bancaire",
                        onTap: () {},
                      ),
                      ItemCard(
                        icon: Icons.account_balance_rounded,
                        title: "Compte bancaire",
                        onTap: () {},
                      ),
                      ItemCard(
                        icon: Icons.home_rounded,
                        title: "Maison",
                        onTap: () {},
                      ),
                      ItemCard(
                        icon: Icons.map_rounded,
                        title: "Parcelle",
                        onTap: () {},
                      ),
                      ItemCard(
                        icon: Icons.directions_car_rounded,
                        title: "Voiture",
                        onTap: () {},
                      ),
                      ItemCard(
                        icon: Icons.two_wheeler_rounded,
                        title: "Moto",
                        onTap: () {},
                      ),
                      ItemCard(
                        icon: Icons.payments_rounded,
                        title: "Épargne",
                        onTap: () {},
                      ),
                      ItemCard(
                        icon: Icons.currency_bitcoin_rounded,
                        title: "Crypto",
                        onTap: () {},
                      ),
                      ItemCard(
                        icon: Icons.business_center_rounded,
                        title: "Collection",
                        onTap: () {},
                      ),
                      ItemCard(
                        icon: Icons.diamond_rounded,
                        title: "Pierres précieuses",
                        onTap: () {},
                      ),
                      ItemCard(
                        icon: Icons.watch_rounded,
                        title: "Objets de luxe",
                        onTap: () {},
                      ),
                      ItemCard(
                        icon: Icons.show_chart_rounded,
                        title: "Action",
                        onTap: () {},
                      ),
                      ItemCard(
                        icon: Icons.more_horiz_rounded,
                        title: "Autres",
                        onTap: () {},
                      ),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
