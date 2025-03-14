import 'package:islamic_will/models/wallet.model.dart';
import 'package:islamic_will/utils/constants.util.dart';
import 'package:islamic_will/utils/helpers.util.dart';
import 'package:islamic_will/views/widgets/text.widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WalletCard extends StatelessWidget {
  final Wallet? wallet;

  const WalletCard({
    super.key,
    required this.wallet,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      // margin: EdgeInsets.symmetric(horizontal: AppValues.padding),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppValues.cardRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppValues.cardRadius),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: AppValues.padding, vertical: 20),
              color: AppColors.secondary,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    'Solde portefeuille',
                    color: AppColors.background,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      AppText(
                        wallet != null ? NumberFormat('#,###').format(wallet!.balance) : "-----",
                        color: AppColors.background,
                        fontSize: 37,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(width: 8),
                      AppText(
                        'cfa',
                        color: AppColors.background,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: AppValues.padding, vertical: 16),
              color: AppColors.primary, // Gold background
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppText(
                        '**** **** **** ',
                        color: AppColors.background,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      AppText(
                        wallet != null
                            ? Helpers.extractLastChars(
                                input: wallet!.id ?? "----",
                              )
                            : "----",
                        color: AppColors.background,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 17),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.secondary,
                          ),
                        ),
                        Positioned(
                          right: -17,
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.secondary.withValues(alpha: .5),
                            ),
                            margin: const EdgeInsets.only(left: 8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
