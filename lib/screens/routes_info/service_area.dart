import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/common.dart';

class ServiceAreaScreen extends StatelessWidget {
  const ServiceAreaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Service area')),
      body: SafeArea(
        child: Column(
          children: [
            Container(height: 380, color: AppColors.surfaceTint),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Dhaka Metro service area is divided into zones by distance from the city center.', style: TextStyle(color: AppColors.textMuted)),
                    const SizedBox(height: 12),
                    _zoneRow('Z1', 'Uttara \u2013 Mirpur corridor'),
                    _zoneRow('Z2', 'Agargaon \u2013 Farmgate'),
                    _zoneRow('Z3', 'Karwan Bazar \u2013 Motijheel'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _zoneRow(String code, String area) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(20)),
              child: Text(code, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12)),
            ),
            const SizedBox(width: 12),
            Text(area),
          ],
        ),
      );
}

class DisruptionsScreen extends StatelessWidget {
  const DisruptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const items = [
      ('MRT Line 6 running at reduced frequency due to signal maintenance', '17 Aug 2026'),
      ('Route A-110 diverted near Gulistan due to road works', '15 Aug 2026'),
      ('Farmgate station: entrance C temporarily closed', '12 Aug 2026'),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Changes and disruptions')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            for (final i in items)
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(i.$1, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)), const SizedBox(height: 4), Text(i.$2, style: TextStyle(color: AppColors.textMuted, fontSize: 11))],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class ComparePricesScreen extends StatelessWidget {
  const ComparePricesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicScreen(
      title: 'Compare ticket prices',
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Check ticket prices by customer group and route.', style: TextStyle(color: AppColors.textMuted)),
            const SizedBox(height: 14),
            const MockField(label: 'Customer group', placeholder: 'Adult'),
            const SizedBox(height: 14),
            const MockField(label: 'Route type', placeholder: 'Metro'),
            const SizedBox(height: 14),
            const MockField(label: 'Mode', placeholder: 'Single ticket'),
            const Spacer(),
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: const Text('Show prices'))),
          ],
        ),
      ),
    );
  }
}

class MyRoutesStopsScreen extends StatelessWidget {
  const MyRoutesStopsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicScreen(
      title: 'My routes and stops',
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('Get alerts and quick timetables for the routes and stops you use most.', style: TextStyle(color: AppColors.textMuted)),
          const SectionLabel('My routes'),
          _chip('MRT Line 6', 'Uttara \u2013 Motijheel', AppColors.modeMetro),
          const SizedBox(height: 8),
          SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () {}, child: const Text('+ Add route'))),
          const SectionLabel('My stops'),
          _chip('Farmgate', 'MRT and bus stop', AppColors.modeBus),
          const SizedBox(height: 8),
          SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () {}, child: const Text('+ Add stop or station'))),
        ],
      ),
    );
  }

  Widget _chip(String title, String sub, Color color) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            CircleAvatar(radius: 10, backgroundColor: color),
            const SizedBox(width: 12),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontWeight: FontWeight.w600)), Text(sub, style: const TextStyle(fontSize: 11, color: AppColors.textMuted))]),
          ],
        ),
      );
}
