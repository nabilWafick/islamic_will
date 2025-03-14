import 'package:islamic_will/utils/constants.util.dart';
import 'package:islamic_will/views/widgets/text.widget.dart';
import 'package:flutter/material.dart';

class HomeOption extends StatelessWidget {
  final String imagePath;
  final String title;
  const HomeOption({
    super.key,
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(AppValues.cardRadius),
      ),
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            imagePath,
            height: MediaQuery.sizeOf(context).height * .13,
            //  width: 50,
          ),
          AppText(
            title,
            fontSize: 12.0,
            color: AppColors.background,
            fontWeight: FontWeight.w700,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
