import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../routes.dart';
import '../../widgets/common.dart';

class TicketQuizScreen extends StatelessWidget {
  const TicketQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicScreen(
      title: 'Which ticket should I choose?',
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('How often do you travel?', style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            _opt('Just today', selected: true),
            _opt('A few days', selected: false),
            _opt('Every day', selected: false),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: AppColors.surfaceTint, borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [Text('Recommended for you', style: TextStyle(color: AppColors.textMuted, fontSize: 11)), Text('Single ticket \u2014 Tk 30', style: TextStyle(fontWeight: FontWeight.w700))],
              ),
            ),
            const SizedBox(height: 14),
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Navigator.of(context).pushNamed(AppRoutes.single), child: const Text('Buy this ticket'))),
            const SectionLabel('More like this'),
            SettingsRow(title: 'Sales and service points', onTap: () => Navigator.of(context).pushNamed(AppRoutes.servicePoints)),
            SettingsRow(title: 'Tap in with card or phone', onTap: () => Navigator.of(context).pushNamed(AppRoutes.tapIn)),
            SettingsRow(title: 'App vs. physical card', onTap: () => Navigator.of(context).pushNamed(AppRoutes.appVsCard)),
            SettingsRow(title: 'Discount groups', onTap: () => Navigator.of(context).pushNamed(AppRoutes.discountOverview)),
          ],
        ),
      ),
    );
  }

  Widget _opt(String label, {required bool selected}) => Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: selected ? AppColors.surfaceTint : Colors.white,
          border: Border.all(color: selected ? AppColors.primary : AppColors.border, width: selected ? 1.5 : 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(label),
      );
}

class ServicePointsScreen extends StatelessWidget {
  const ServicePointsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    const points = [
      ('Farmgate MRT counter', 'Open 7am\u201310pm \u00b7 0.4 km away'),
      ('Motijheel service point', 'Open 9am\u20136pm \u00b7 2.1 km away'),
      ('Gulistan counter', 'Open 8am\u20138pm \u00b7 3.4 km away'),
    ];
    return BasicScreen(
      title: 'Sales and service points',
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          for (final p in points)
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(10)),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(p.$1, style: const TextStyle(fontWeight: FontWeight.w600)), Text(p.$2, style: const TextStyle(fontSize: 11, color: AppColors.textMuted))]),
            ),
        ],
      ),
    );
  }
}

class TapInScreen extends StatelessWidget {
  const TapInScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BasicScreen(
      title: 'Tap in with card or phone',
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 140, decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(12))),
            const SizedBox(height: 14),
            const Text(
              'Scan your bKash or Nagad QR directly at the gate or on board for instant payment. Contactless bank cards work too, if you have one, as a secondary option.',
            ),
            const SizedBox(height: 10),
            Text('Discount tickets and season passes still require the app.', style: TextStyle(color: AppColors.textMuted, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

class AppVsCardScreen extends StatelessWidget {
  const AppVsCardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BasicScreen(
      title: 'App vs. physical card',
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(child: _col('Jatri app', ['Free', 'All ticket types', 'Needs charged phone'])),
            const SizedBox(width: 10),
            Expanded(child: _col('Jatri card', ['Tk 200 card fee', 'Single and season only', 'No phone needed'])),
          ],
        ),
      ),
    );
  }

  Widget _col(String title, List<String> rows) => Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
            const SizedBox(height: 6),
            for (final r in rows) Padding(padding: const EdgeInsets.only(top: 2), child: Text(r, style: const TextStyle(fontSize: 11, color: AppColors.textMuted))),
          ],
        ),
      );
}

class SafetyScreen extends StatelessWidget {
  const SafetyScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BasicScreen(
      title: 'Safety and lost property',
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _card('Report a safety concern', 'Emergency: 999 \u00b7 Fire: 199'),
          _card('Lost something on board?', 'File a lost property report with your route and time'),
        ],
      ),
    );
  }

  Widget _card(String title, String sub) => Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(10)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontWeight: FontWeight.w600)), Text(sub, style: const TextStyle(fontSize: 11, color: AppColors.textMuted))]),
      );
}

class DiscountOverviewScreen extends StatelessWidget {
  const DiscountOverviewScreen({super.key});
  @override
  Widget build(BuildContext context) {
    const groups = [('Student', '40% off'), ('Child (7\u201317)', '50% off'), ('Senior (65+)', '40% off'), ('Reduced mobility', '50% off')];
    return BasicScreen(
      title: 'Discount groups',
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('See if you qualify before you buy.', style: TextStyle(color: AppColors.textMuted)),
          const SizedBox(height: 12),
          for (final g in groups)
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(10)),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(g.$1), Text(g.$2, style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600))]),
            ),
        ],
      ),
    );
  }
}
