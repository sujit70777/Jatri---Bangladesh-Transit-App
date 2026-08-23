import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class StopTimetableScreen extends StatelessWidget {
  const StopTimetableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const rows = [
      ('MRT Line 6', 'toward Motijheel', '3 min', true),
      ('Bus A-114', 'toward Sayedabad', '7 min', false),
      ('MRT Line 6', 'toward Uttara North', '9 min', true),
      ('Bus A-115', 'toward Jatrabari', '14 min', false),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Farmgate')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            for (final r in rows)
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: AppColors.border))),
                child: Row(
                  children: [
                    Icon(r.$4 ? Icons.train : Icons.directions_bus, color: r.$4 ? AppColors.modeMetro : AppColors.modeBus),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text(r.$1, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)), Text(r.$2, style: TextStyle(color: AppColors.textMuted, fontSize: 11))],
                      ),
                    ),
                    Text(r.$3, style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
