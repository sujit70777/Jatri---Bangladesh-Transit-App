import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Language')),
      body: SafeArea(
        child: Column(
          children: [
            _row('\u09ac\u09be\u0982\u09b2\u09be (Bangla)', selected: true),
            _row('English', selected: false),
          ],
        ),
      ),
    );
  }

  Widget _row(String label, {required bool selected}) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: AppColors.border))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(label, style: const TextStyle(fontSize: 15)), if (selected) const Icon(Icons.check, color: AppColors.primary)],
        ),
      );
}
