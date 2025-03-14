import 'package:islamic_will/utils/constants.util.dart';
import 'package:islamic_will/views/widgets/profile_image.widget.dart';
import 'package:islamic_will/views/widgets/text.widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({super.key});

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting('fr_FR', '');
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormatter = DateFormat('EEE dd MMM yyyy', 'fr_FR');
    return SizedBox(
      child: Column(
        spacing: 25.0,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppText(
                dateFormatter.format(DateTime.now()),
                color: AppColors.cardIconBackground,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
              const InkWell(
                // onTap: () => Get.to(() => HistoricalsPage()),
                child: Row(
                  spacing: 5.0,
                  children: [
                    AppText(
                      'Voir plus',
                      color: AppColors.secondary,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: AppColors.secondary,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .325,
            child: const SingleChildScrollView(
              primary: true,
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  TransactionItem(
                    title: 'Producteur A',
                    subtitle: 'Payment',
                    amount: 2000000,
                    iconType: IconType.profile,
                    profileUrl: '',
                  ),
                  TransactionItem(
                    title: 'Bank of America',
                    subtitle: 'Deposit',
                    amount: 5000000,
                    iconType: IconType.bank,
                  ),
                  TransactionItem(
                    title: 'To Coop A',
                    subtitle: 'Sent',
                    amount: -2000000,
                    iconType: IconType.send,
                  ),
                  TransactionItem(
                    title: 'Producteur A',
                    subtitle: 'Payment',
                    amount: 2000000,
                    iconType: IconType.profile,
                    profileUrl: '',
                  ),
                  TransactionItem(
                    title: 'Bank of America',
                    subtitle: 'Deposit',
                    amount: 5000000,
                    iconType: IconType.bank,
                  ),
                  TransactionItem(
                    title: 'To Coop A',
                    subtitle: 'Sent',
                    amount: -2000000,
                    iconType: IconType.send,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

enum IconType { profile, bank, send }

class TransactionItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final int amount;
  final IconType iconType;
  final String? profileUrl;

  const TransactionItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.iconType,
    this.profileUrl,
  }) : assert(iconType != IconType.profile || (iconType == IconType.profile && profileUrl != null),
            "profileUrl must be provided if iconType is profile");

  @override
  Widget build(BuildContext context) {
    Widget leadingIcon;

    switch (iconType) {
      case IconType.profile:
        leadingIcon = ProfileImage(
          avatarUrl: profileUrl ?? "",
          size: 40,
          borderWidth: 2,
          borderColor: AppColors.secondary,
        );

        break;
      case IconType.bank:
        leadingIcon = const Icon(
          Icons.account_balance,
        );
        break;
      case IconType.send:
        leadingIcon = const Icon(
          Icons.send,
        );
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            width: 50.0,
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(10),
            ),
            child: leadingIcon,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(height: 4),
                AppText(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.cardIconBackground,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          AppText(
            '${amount > 0 ? '+ ' : '- '}${NumberFormat('#,###').format(amount.abs())} FCFA',
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: amount > 0 ? AppColors.secondary : Colors.red.shade500,
          ),
        ],
      ),
    );
  }
}
