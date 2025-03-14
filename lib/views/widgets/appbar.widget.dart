import 'package:islamic_will/utils/constants.util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:iconify_flutter/icons/ep.dart';

class AgriWalletAppbar extends StatelessWidget implements PreferredSizeWidget {
  const AgriWalletAppbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(builder: (context) {
        return GestureDetector(
          onTap: () => Scaffold.of(context).openDrawer(),
          child: Container(
              margin: EdgeInsets.only(left: AppValues.padding * .5), child: Icon(Icons.menu)),
        );
      }),
      //  leadingWidth: 50.0,
      title: SvgPicture.asset(
        AppSvgs.logo,
        fit: BoxFit.contain,
        height: 55,
      ),
      centerTitle: true,
      actions: [
        Iconify(
          Ep.chat_dot_round,
          color: AppColors.primary,
        ),
        SizedBox(width: 7),
        Iconify(
          Bx.bell,
          color: AppColors.primary,
        ),
        SizedBox(width: AppValues.padding * .5),
      ],
    );
  }
}
