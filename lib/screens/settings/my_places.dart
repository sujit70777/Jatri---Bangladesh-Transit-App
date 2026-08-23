import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../routes.dart';
import '../../widgets/common.dart';

class MyPlacesScreen extends StatelessWidget {
  const MyPlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicScreen(
      title: 'My places and options',
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SectionLabel('Places'),
          _place('Home', 'Mirpur 10, Dhaka'),
          _place('Work', 'Motijheel, Dhaka'),
          _place('University', 'Dhaka University area'),
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Navigator.of(context).pushNamed(AppRoutes.savePlace), child: const Text('Add place'))),
          const SectionLabel('Stops'),
          SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () {}, child: const Text('Add stop'))),
        ],
      ),
    );
  }

  Widget _place(String name, String addr) => Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            const Icon(Icons.circle, size: 10, color: AppColors.primary),
            const SizedBox(width: 12),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(name, style: const TextStyle(fontWeight: FontWeight.w600)), Text(addr, style: const TextStyle(fontSize: 11, color: AppColors.textMuted))]),
          ],
        ),
      );
}

class SavePlaceScreen extends StatelessWidget {
  const SavePlaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicScreen(
      title: 'Save place',
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MockField(label: 'Address or place name', placeholder: 'Enter street address'),
            const SizedBox(height: 14),
            const MockField(label: 'Give it a name (optional)', placeholder: 'e.g. Home, Work, Gym'),
            const Spacer(),
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Save'))),
          ],
        ),
      ),
    );
  }
}
