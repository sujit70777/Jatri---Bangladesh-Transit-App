import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/common.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicScreen(
      title: 'Notifications and email',
      body: ListView(
        children: [
          _toggle('Service disruptions', true),
          _toggle('Saved route alerts', true),
          _toggle('Ticket expiry reminders', true),
          _toggle('Promotions and offers', false),
          _toggle('Email summaries', false),
        ],
      ),
    );
  }

  Widget _toggle(String label, bool value) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: AppColors.border))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(label), Switch(value: value, onChanged: (_) {}, activeThumbColor: AppColors.primary)],
        ),
      );
}

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicScreen(
      title: 'Send us a message',
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MockField(label: 'Your card or ticket number (optional)', placeholder: 'e.g. 124446 67471345'),
            const SizedBox(height: 14),
            const MockField(label: 'Your message', placeholder: 'Tell us what happened...'),
            const SizedBox(height: 14),
            const Row(children: [
              Icon(Icons.check_box, color: AppColors.primary, size: 18),
              SizedBox(width: 8),
              Text('I would like a response', style: TextStyle(fontSize: 13)),
            ]),
            const Spacer(),
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Send feedback'))),
          ],
        ),
      ),
    );
  }
}

class PenaltyFareScreen extends StatelessWidget {
  const PenaltyFareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicScreen(
      title: 'Penalty fare',
      body: Padding(
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
                  Text('Remember to activate your ticket', style: TextStyle(color: AppColors.alert, fontWeight: FontWeight.w700, fontSize: 13)),
                  SizedBox(height: 4),
                  Text("If you don't have a valid ticket, you'll be charged a Tk 1,000 penalty fare plus the price of a single ticket.", style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              'This applies to MRT Line 6, where gate enforcement is in place. Private bus fares are still collected by conductors and are not enforced through the app.',
              style: TextStyle(color: AppColors.textMuted),
            ),
          ],
        ),
      ),
    );
  }
}
