import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../routes.dart';
import '../../widgets/common.dart';

class MyInformationScreen extends StatelessWidget {
  const MyInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nav = Navigator.of(context);
    return BasicScreen(
      title: 'My information',
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _field('Full name', 'Ehsanur Rahman'),
          _field('Home area', 'Mirpur, Dhaka'),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: AppColors.surfaceTint, borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Verified through NID authentication', style: TextStyle(color: AppColors.primaryPressed, fontWeight: FontWeight.w700, fontSize: 13)),
                Text('Re-authenticate to update your information.', style: TextStyle(color: AppColors.textMuted, fontSize: 12)),
              ],
            ),
          ),
          _fieldWithEdit('Phone number (verified)', '+880 17XX XXX XXX'),
          _fieldWithEdit('Email (verified)', 'ehsanur@example.com'),
          _fieldWithEdit('Discount group', 'No discount group'),
          const SizedBox(height: 10),
          SettingsRow(title: 'Re-authenticate', onTap: () => nav.pushNamed(AppRoutes.reauth)),
          SettingsRow(title: 'Add student discount', onTap: () => nav.pushNamed(AppRoutes.studentDiscount)),
          SettingsRow(title: 'Manage on behalf of a child', onTap: () => nav.pushNamed(AppRoutes.actOnBehalf)),
        ],
      ),
    );
  }

  Widget _field(String label, String value) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(label, style: TextStyle(color: AppColors.textMuted, fontSize: 12)), Text(value, style: const TextStyle(fontSize: 15))],
        ),
      );

  Widget _fieldWithEdit(String label, String value) => Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: AppColors.border))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(label, style: TextStyle(color: AppColors.textMuted, fontSize: 12)), const Text('Edit', style: TextStyle(color: AppColors.primary, fontSize: 12, fontWeight: FontWeight.w600))],
            ),
            Text(value, style: const TextStyle(fontSize: 15)),
          ],
        ),
      );
}
