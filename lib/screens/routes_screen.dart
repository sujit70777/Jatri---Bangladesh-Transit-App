import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/transit_data.dart';
import '../routes.dart';

class RoutesScreen extends StatelessWidget {
  const RoutesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(height: 260, width: double.infinity, color: AppColors.surfaceTint),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Where to?', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 14),
                  _FieldRow(icon: Icons.circle, color: AppColors.primary, label: 'Your current location'),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed(AppRoutes.searchAutocomplete),
                    child: _FieldRow(icon: Icons.location_on, color: AppColors.alert, label: 'Select destination'),
                  ),
                  const SizedBox(height: 16),
                  Text('Quick places', style: TextStyle(color: AppColors.textMuted, fontSize: 12)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => const RouteResultsScreen(from: 'Uttara Center', to: 'Motijheel')),
                          ),
                          child: _QuickChip(icon: Icons.home, label: 'Home'),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).pushNamed(AppRoutes.savePlace),
                          child: _QuickChip(icon: Icons.add, label: 'Add place'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () => Navigator.of(context).pushNamed(AppRoutes.serviceArea),
                    child: const Align(alignment: Alignment.centerLeft, child: Text('View service area map')),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FieldRow extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  const _FieldRow({required this.icon, required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 10),
          Text(label, style: TextStyle(color: AppColors.textMuted)),
        ],
      ),
    );
  }
}

class _QuickChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _QuickChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(10)),
      child: Column(children: [Icon(icon, color: AppColors.primary), const SizedBox(height: 6), Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600))]),
    );
  }
}

/// Real MRT6 + BRTA bus data feeding the example itineraries.
class RouteResultsScreen extends StatelessWidget {
  final String from;
  final String to;
  const RouteResultsScreen({super.key, required this.from, required this.to});

  @override
  Widget build(BuildContext context) {
    final itineraries = exampleItineraries(from, to);
    return Scaffold(
      appBar: AppBar(title: Text('$from \u2192 $to')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: itineraries.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, i) {
          final it = itineraries[i];
          final featured = i == 0;
          return InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => ItineraryDetailScreen(from: from, to: to, itinerary: it))),
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                border: Border.all(color: featured ? AppColors.primary : AppColors.border, width: featured ? 1.5 : 1),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(color: AppColors.surfaceTint, borderRadius: BorderRadius.circular(20)),
                      child: Text(it.badge, style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700, fontSize: 12)),
                    ),
                    const SizedBox(width: 8),
                    Text('${it.minutes} min \u00b7 Tk ${it.fareTaka}', style: TextStyle(color: AppColors.textMuted, fontSize: 12)),
                  ]),
                  const SizedBox(height: 8),
                  Row(children: [
                    Icon(it.modeType == 'mrt' ? Icons.train : Icons.directions_bus, color: it.modeType == 'mrt' ? AppColors.modeMetro : AppColors.modeBus, size: 20),
                    const SizedBox(width: 8),
                    Expanded(child: Text(it.modeLabel, style: const TextStyle(fontSize: 13))),
                  ]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ItineraryDetailScreen extends StatelessWidget {
  final String from;
  final String to;
  final Itinerary itinerary;
  const ItineraryDetailScreen({super.key, required this.from, required this.to, required this.itinerary});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trip details')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${itinerary.minutes} min', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
                Text('Tk ${itinerary.fareTaka}', style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700)),
              ],
            ),
            const SizedBox(height: 20),
            _StepTile(time: '8:05 AM', title: from, subtitle: 'Board ${itinerary.modeLabel}'),
            _StepTile(time: '8:39 AM', title: to, subtitle: 'Arrive', isLast: true),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () => Navigator.of(context).pushNamed(AppRoutes.liveTracking),
              child: const Align(alignment: Alignment.centerLeft, child: Text('Track this trip live')),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pushNamed(AppRoutes.stopTimetable),
              child: const Align(alignment: Alignment.centerLeft, child: Text('View stop timetable')),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pushNamed(AppRoutes.recommended),
                child: const Text('See recommended ticket'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StepTile extends StatelessWidget {
  final String time;
  final String title;
  final String subtitle;
  final bool isLast;
  const _StepTile({required this.time, required this.title, required this.subtitle, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              const Icon(Icons.circle, size: 12, color: AppColors.primary),
              if (!isLast) Expanded(child: Container(width: 2, color: AppColors.border)),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(time, style: TextStyle(color: AppColors.textMuted, fontSize: 12)),
                  Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
                  Text(subtitle, style: TextStyle(color: AppColors.textMuted, fontSize: 12)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
