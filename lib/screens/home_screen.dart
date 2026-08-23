import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 12),
          const Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Good morning!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
                    Text('Ehsanur', style: TextStyle(color: AppColors.textMuted, fontSize: 15)),
                  ],
                ),
              ),
              CircleAvatar(radius: 20, backgroundColor: AppColors.surface),
            ],
          ),
          const SizedBox(height: 16),
          InkWell(onTap: () => Navigator.of(context).pushNamed(AppRoutes.disruptions), child: _DisruptionBanner()),
          const SizedBox(height: 16),
          const _NewsCard(
            category: 'Service',
            headline: 'MRT Line 6 running at reduced frequency due to signal maintenance',
            date: '17 Aug 2026',
          ),
          const SizedBox(height: 12),
          const _NewsCard(
            category: 'News',
            headline: 'Student: check our tips for obtaining a student ticket',
            date: '10 Aug 2026',
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _DisruptionBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: const BoxDecoration(border: Border.symmetric(horizontal: BorderSide(color: AppColors.border))),
      child: const Row(
        children: [
          Icon(Icons.error, color: AppColors.alert, size: 18),
          SizedBox(width: 10),
          Expanded(child: Text('Changes and disruptions', style: TextStyle(fontWeight: FontWeight.w600))),
          Icon(Icons.chevron_right, color: AppColors.textMuted),
        ],
      ),
    );
  }
}

class _NewsCard extends StatelessWidget {
  final String category;
  final String headline;
  final String date;
  const _NewsCard({required this.category, required this.headline, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: AppColors.border), borderRadius: BorderRadius.circular(14)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: 140, color: AppColors.surfaceTint),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(category, style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
                const SizedBox(height: 4),
                Text(headline, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
                const SizedBox(height: 4),
                Text(date, style: const TextStyle(color: AppColors.textMuted, fontSize: 11)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
