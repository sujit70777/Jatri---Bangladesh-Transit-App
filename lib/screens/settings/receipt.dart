import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class ReceiptScreen extends StatelessWidget {
  const ReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Receipt')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(14)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Season ticket \u2014 30 days', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
                    const SizedBox(height: 10),
                    _row('Transaction ID', 'JTR-88213041'),
                    _row('Purchased', '3 Aug 2026, 8:14 AM'),
                    _row('Paid via', 'bKash \u00b7 017XX XXX XXX'),
                    _row('Valid until', '2 Sep 2026'),
                    const Divider(),
                    _row('Total paid', 'Tk 1,200', bold: true),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () {}, child: const Text('Download receipt'))),
            ],
          ),
        ),
      ),
    );
  }

  Widget _row(String l, String v, {bool bold = false}) => Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(l, style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
            Text(v, style: TextStyle(fontWeight: bold ? FontWeight.w700 : FontWeight.w600, fontSize: bold ? 14 : 12)),
          ],
        ),
      );
}
