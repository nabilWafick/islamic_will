import 'package:islamic_will/utils/constants.util.dart';
import 'package:islamic_will/views/widgets/elevated_button.widget.dart';
import 'package:islamic_will/views/widgets/text.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SuccessRecharge extends StatelessWidget {
  const SuccessRecharge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(AppValues.cardRadius * 3),
            topLeft: Radius.circular(AppValues.cardRadius * 3),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppValues.padding,
          vertical: 25.0,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 30.0,
                children: [
                  SvgPicture.asset(
                    AppSvgs.withdrawal,
                    height: 150.0,
                  ),
                  const AppText(
                    "Rechargement réussi",
                    color: AppColors.primary,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                  const AppText(
                    "Les recharges sont examinées, ce qui peut entraîner des retards ou le gel des fonds.",
                    textAlign: TextAlign.center,
                    color: AppColors.cardIconBackground,
                    fontSize: 12.0,
                  ),
                ],
              ),
            ),
            const Expanded(child: SizedBox()),
            AppElevatedButton(
              text: "Retour",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
