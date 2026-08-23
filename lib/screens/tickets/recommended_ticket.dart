import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../routes.dart';

class RecommendedTicketScreen extends StatelessWidget {
  const RecommendedTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recommended for this trip')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Uttara Center \u2192 Motijheel', style: TextStyle(color: AppColors.textMuted)),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: AppColors.surfaceTint, border: Border.all(color: AppColors.primary, width: 1.5), borderRadius: BorderRadius.circular(14)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Single ticket', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                    Text('Valid for your full route, no transfer fee', style: TextStyle(color: AppColors.textMuted, fontSize: 12)),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [Text('This trip', style: TextStyle(color: AppColors.textMuted, fontSize: 12)), Text('Tk 60', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700))],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Take this route often?', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                    Text('A 30-day season ticket breaks even after 20 trips', style: TextStyle(color: AppColors.textMuted, fontSize: 11)),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pushNamed(AppRoutes.payment),
                  child: const Text('Buy single ticket \u2014 Tk 60'),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: TextButton(
                  onPressed: () => Navigator.of(context).pushNamed(AppRoutes.buyLanding),
                  child: Text('See all ticket options', style: TextStyle(color: AppColors.textMuted)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
