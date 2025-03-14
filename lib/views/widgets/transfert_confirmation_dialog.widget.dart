import 'package:islamic_will/utils/constants.util.dart';
import 'package:islamic_will/views/widgets/elevated_button.widget.dart';
import 'package:islamic_will/views/widgets/text.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class TransfertConfirmationDialog extends StatelessWidget {
  const TransfertConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.background,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 10.0,
            color: AppColors.cardBackground,
          ),
          borderRadius: BorderRadius.circular(AppValues.cardRadius),
        ),
        //  height: 500,
        width: MediaQuery.sizeOf(context).width * .9,
        padding: const EdgeInsets.all(AppValues.padding),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              spacing: 20.0,
              children: [
                const SizedBox(height: 26.0),
                const AppText(
                  "Confirmation du transfert",
                  color: AppColors.primary,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(),
                const TransferInfo(
                  label: 'From',
                  name: 'Client1',
                  accountNumber: '**** 1121',
                  walletName: 'AgriWallet',
                ),
                const Divider(height: 3),
                const TransferInfo(
                  label: 'To',
                  name: 'Linda',
                  accountNumber: '**** 8456',
                  walletName: 'Producteur1/Coop1',
                ),
                const Divider(height: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AppText(
                      "Total",
                      color: AppColors.cardBackground,
                      fontSize: 16.0,
                    ),
                    AppText(
                      NumberFormat("#,###").format(3000000),
                      color: AppColors.primary,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                AppElevatedButton(
                  text: "Confirmer",
                  onPressed: () {
                    //  Get.to(() => SuccessTransfertPage());
                  },
                ),
              ],
            ),
            Positioned(
              top: -115,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade300,
                  border: Border.all(
                    width: 10.0,
                    color: AppColors.background,
                  ),
                ),
                //  padding: EdgeInsets.all(10),
                height: 150,
                width: 150,

                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SvgPicture.asset(
                    AppSvgs.walletCards,
                    //  fit: BoxFit.cover,
                    height: 100,
                    width: 100,
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

class TransferInfo extends StatelessWidget {
  final String label;
  final String name;
  final String accountNumber;
  final String walletName;

  const TransferInfo({
    super.key,
    required this.label,
    required this.name,
    required this.accountNumber,
    required this.walletName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              label,
              fontSize: 14,
              color: AppColors.cardIconBackground,
            ),
            AppText(
              walletName,
              fontSize: 12,
              color: AppColors.cardIconBackground,
              textAlign: TextAlign.right,
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              name,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryText,
            ),
            AppText(
              accountNumber,
              fontSize: 16,
              color: AppColors.primary,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ],
    );
  }
}
