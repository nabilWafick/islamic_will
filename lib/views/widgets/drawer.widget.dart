// account_drawer.dart
import 'package:flutter/material.dart';
import 'package:islamic_will/utils/constants.util.dart';
import 'package:islamic_will/views/widgets/text.widget.dart';
import 'package:islamic_will/views/widgets/user_profile_header.widget.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const BeveledRectangleBorder(),
      child: Container(
        color: AppColors.background,
        child: const Column(
          spacing: 16.0,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserProfileHeader(
              name: 'Norbert Ogougbé',
              role: 'Producteur',
              avatarUrl: '',
            ),
            AccountSection(),
            SizedBox(),
            NotificationsSection(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class AccountSection extends StatelessWidget {
  const AccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        // spacing: 8.0,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppText(
            'Mes comptes',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          AccountItem(
            title: 'Mon Compte SFD',
            accountNumber: '',
            provider: '',
            hasValue: false,
            onTap: () {},
          ),
          AccountItem(
            title: 'Mon compte Crédit',
            isSubItem: true,
            accountNumber: '12522552',
            provider: 'PADME',
            onTap: () {},
          ),
          AccountItem(
            title: 'Mon compte Epargne',
            isSubItem: true,
            accountNumber: '012525585',
            provider: 'POSTE',
            onTap: () {},
          ),
          AccountItem(
            title: 'Mon Compte Banque',
            accountNumber: '0258455',
            provider: 'ECOBANK',
            onTap: () {},
          ),
          const AppText(
            'Mon Compte Mobile Money',
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          AccountItem(
            title: '',
            accountNumber: '0194009494',
            provider: 'Moov',
            isSubItem: true,
            onTap: () {},
          ),
          AccountItem(
            title: '',
            accountNumber: '0196693363',
            provider: 'MTN',
            isSubItem: true,
            onTap: () {},
          ),
          AccountItem(
            title: '',
            accountNumber: '0140121234',
            provider: 'Celtiis',
            isSubItem: true,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class AccountItem extends StatelessWidget {
  final String title;
  final String accountNumber;
  final String provider;
  final bool isSubItem;
  final bool hasValue;
  final VoidCallback onTap;

  const AccountItem({
    super.key,
    required this.title,
    required this.accountNumber,
    required this.provider,
    this.isSubItem = false,
    this.hasValue = true,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isSubItem ? 16.0 : .0,
          vertical: 8.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title.isNotEmpty)
              AppText(
                title,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            if (title.isNotEmpty && hasValue) const SizedBox(height: 4),
            if (hasValue)
              Row(
                children: [
                  AppText(
                    accountNumber,
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                  const AppText(
                    ' - ',
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                  AppText(
                    provider,
                    fontSize: 14,
                    color: Colors.green[700],
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class NotificationsSection extends StatelessWidget {
  const NotificationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            'Mes notifications',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          // Notification items can be added here
        ],
      ),
    );
  }
}
