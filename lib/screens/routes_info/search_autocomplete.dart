import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../routes_screen.dart';

class SearchAutocompleteScreen extends StatelessWidget {
  const SearchAutocompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const suggestions = [
      ('Farmgate', 'MRT station \u00b7 Bus stop'),
      ('Farmgate Overbridge', 'Landmark, Farmgate'),
      ('Farmgate Police Box', 'Landmark, Farmgate'),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(10)),
          child: const Text('Farmg', style: TextStyle(color: AppColors.text)),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            for (final s in suggestions)
              ListTile(
                leading: const Icon(Icons.circle, size: 8, color: AppColors.textMuted),
                title: Text(s.$1, style: const TextStyle(fontWeight: FontWeight.w600)),
                subtitle: Text(s.$2),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const RouteResultsScreen(from: 'Uttara Center', to: 'Motijheel')),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
