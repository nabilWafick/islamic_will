import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:islamic_will/utils/constants.util.dart';
import 'package:islamic_will/views/pages/main/assets.page.dart';
import 'package:islamic_will/views/pages/main/family.page.dart';
import 'package:islamic_will/views/pages/main/home.page.dart';
import 'package:islamic_will/views/pages/main/infos.page.dart';
import 'package:islamic_will/views/pages/main/will.page.dart';
import 'package:islamic_will/views/pages/main/wishes.page.dart';
import 'package:islamic_will/views/pages/settings.page.dart';

class MainPage extends StatefulHookConsumerWidget {
  const MainPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> with SingleTickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;

  @override
  void initState() {
    currentPage = 0;
    tabController = TabController(length: 7, vsync: this);
    tabController.animation?.addListener(() {
      final value = tabController.animation!.value.round();
      if (value != currentPage && mounted) {
        setState(() {
          currentPage = value;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BottomBar(
        clip: Clip.none,
        fit: StackFit.expand,
        borderRadius: AppDimensions.cardBorder,
        duration: const Duration(milliseconds: 300),
        curve: Curves.decelerate,
        showIcon: true,
        width: MediaQuery.of(context).size.width * 0.9,
        barColor: AppColors.cardBackground,
        start: 2,
        end: 0,
        offset: 10,
        barAlignment: Alignment.bottomCenter,
        iconHeight: 30,
        iconWidth: 30,
        hideOnScroll: true,
        body: (context, controller) => TabBarView(
          controller: tabController,
          dragStartBehavior: DragStartBehavior.start,
          physics: const BouncingScrollPhysics(),
          children: const [
            HomePage(),
            FamilyPage(),
            AssetsPage(),
            WillPage(),
            WishesPage(),
            InfosPage(),
            SettingsPage(),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            TabBar(
                indicatorPadding: EdgeInsets.fromLTRB(
                  AppDimensions.horizontalPadding * .7,
                  0,
                  AppDimensions.horizontalPadding * .7,
                  0,
                ),
                controller: tabController,
                labelStyle: const TextStyle(
                  fontSize: 20.0,
                  color: AppColors.primary,
                ),
                indicator: UnderlineTabIndicator(
                  borderRadius: BorderRadius.circular(AppDimensions.iconCardRadius * .7),
                  borderSide: const BorderSide(
                    color: AppColors.primary,
                    width: 4,
                  ),
                  insets: EdgeInsets.fromLTRB(
                    AppDimensions.horizontalPadding,
                    0,
                    AppDimensions.horizontalPadding,
                    AppDimensions.verticalPadding * .5,
                  ),
                ),
                splashBorderRadius: AppDimensions.iconCardBorder,
                dividerHeight: .0,
                tabs: [
                  SizedBox(
                    height: 55,
                    width: 40,
                    child: Center(
                      child: Icon(
                        Icons.home, // Maison
                        color: currentPage == 0 ? AppColors.primary : AppColors.secondaryText,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 55,
                    width: 40,
                    child: Center(
                      child: Icon(
                        Icons.people_rounded,
                        color: currentPage == 1 ? AppColors.primary : AppColors.secondaryText,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 55,
                    width: 40,
                    child: Center(
                      child: Icon(
                        Icons.diamond_rounded,
                        color: currentPage == 2 ? AppColors.primary : AppColors.secondaryText,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 55,
                    width: 40,
                  ),
                  SizedBox(
                    height: 55,
                    width: 40,
                    child: Center(
                      child: Icon(
                        Icons.favorite_rounded,
                        color: currentPage == 4 ? AppColors.primary : AppColors.secondaryText,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 55,
                    width: 40,
                    child: Center(
                      child: Icon(
                        Icons.info_rounded,
                        color: currentPage == 5 ? AppColors.primary : AppColors.secondaryText,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 55,
                    width: 40,
                    child: Center(
                      child: Icon(
                        Icons.settings_rounded,
                        color: currentPage == 6 ? AppColors.primary : AppColors.secondaryText,
                      ),
                    ),
                  ),
                ]),
            Positioned(
              top: -25,
              child: FloatingActionButton(
                onPressed: () {
                  // Navigate to Will page
                  tabController.animateTo(3);
                },
                backgroundColor: AppColors.primary,
                child: const Icon(
                  //  CupertinoIcons.doc_text_viewfinder,
                  Icons.description,
                  color: AppColors.cardBackground,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
