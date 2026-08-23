import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../routes.dart';

class ManageSubscriptionScreen extends StatelessWidget {
  const ManageSubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Manage subscription')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: AppColors.surfaceTint, borderRadius: BorderRadius.circular(14)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Season ticket \u2014 30 days', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
                    const Text('Auto-renewing subscription', style: TextStyle(color: AppColors.primaryPressed, fontSize: 12)),
                    const SizedBox(height: 10),
                    _row('Next renewal', '2 Sep 2026 \u00b7 Tk 1,200'),
                    _row('Billed to', 'bKash \u00b7 017XX XXX XXX'),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => Navigator.of(context).pushNamed(AppRoutes.paymentMethods),
                  child: const Text('Change payment method'),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(foregroundColor: AppColors.alert, side: const BorderSide(color: AppColors.alert)),
                  onPressed: () => Navigator.of(context).pushNamed(AppRoutes.cancelSubscription),
                  child: const Text('Cancel auto-renewal'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _row(String l, String v) => Padding(
        padding: const EdgeInsets.only(top: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(l, style: const TextStyle(color: AppColors.textMuted, fontSize: 12)), Text(v, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12))],
        ),
      );
}

class CancelSubscriptionScreen extends StatelessWidget {
  const CancelSubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cancel auto-renewal')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(color: const Color(0xFFFCEBEA), borderRadius: BorderRadius.circular(10)),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Your ticket stays active until it expires', style: TextStyle(color: AppColors.alert, fontWeight: FontWeight.w700, fontSize: 13)),
                    SizedBox(height: 4),
                    Text(
                      "Cancelling stops future renewals. Your current season ticket remains valid until 2 Sep 2026 \u2014 you won't be charged again after that.",
                      style: TextStyle(color: AppColors.textMuted, fontSize: 12),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.alert),
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Confirm cancellation'),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Keep my subscription')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
