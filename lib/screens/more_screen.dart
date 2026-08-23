import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../routes.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nav = Navigator.of(context);
    final items = [
      ('My account', 'Saved places, profile', () => nav.pushNamed(AppRoutes.myPlaces)),
      ('Settings', 'Manage your settings and information', () => nav.pushNamed(AppRoutes.settingsHub)),
      ('Support and instructions', 'Find answers to frequently asked questions', () => nav.pushNamed(AppRoutes.ticketQuiz)),
      ('Message', 'Send us a message', () => nav.pushNamed(AppRoutes.feedback)),
      ('Safety and lost property', 'Report a concern or a lost item', () => nav.pushNamed(AppRoutes.safety)),
      ('Penalty fare', "What happens if you don't have a valid ticket", () => nav.pushNamed(AppRoutes.penaltyFare)),
    ];
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 12),
          const Text('More', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
          const SizedBox(height: 12),
          for (final item in items)
            InkWell(
              onTap: item.$3,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: AppColors.border))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.$1, style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700, fontSize: 15)),
                    const SizedBox(height: 2),
                    Text(item.$2, style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
                  ],
                ),
              ),
            ),
          const SizedBox(height: 16),
          const Text('App version 1.0.0', style: TextStyle(color: AppColors.textMuted, fontSize: 11)),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
