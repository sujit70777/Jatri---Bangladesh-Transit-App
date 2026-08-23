import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/common.dart';

class ReauthScreen extends StatelessWidget {
  const ReauthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Re-authenticate')),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(width: 64, height: 64, decoration: const BoxDecoration(color: AppColors.surfaceTint, shape: BoxShape.circle)),
                const SizedBox(height: 16),
                const Text("Confirm it's you", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
                const SizedBox(height: 8),
                const Text(
                  'Your details were verified previously. Re-verify to update your home address, discount group, or payment info.',
                  style: TextStyle(color: AppColors.textMuted),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Re-authenticate'))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StudentDiscountScreen extends StatelessWidget {
  const StudentDiscountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicScreen(
      title: 'Add student discount',
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('We\u2019ll review your documents and confirm your discount within 24 hours.', style: TextStyle(color: AppColors.textMuted)),
            const SizedBox(height: 16),
            const MockField(label: 'Institution', placeholder: 'Select your university or college'),
            const SizedBox(height: 14),
            const MockField(label: 'Student ID', placeholder: 'Enter your student ID number'),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(10)),
              child: const Text('Upload a photo of your student ID. Verification usually completes within 24 hours.', style: TextStyle(color: AppColors.textMuted, fontSize: 12)),
            ),
            const Spacer(),
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Submit for verification'))),
          ],
        ),
      ),
    );
  }
}

class ActOnBehalfScreen extends StatelessWidget {
  const ActOnBehalfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicScreen(
      title: 'Manage on behalf of',
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Guardians can manage a child\u2019s tickets and account after identity verification.', style: TextStyle(color: AppColors.textMuted)),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(10)),
              child: const Row(
                children: [
                  CircleAvatar(radius: 16, backgroundColor: AppColors.primary),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text('Rafiq Rahman', style: TextStyle(fontWeight: FontWeight.w600)), Text('Child \u00b7 Age 12', style: TextStyle(fontSize: 11, color: AppColors.textMuted))],
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: const Text('Add a child account'))),
          ],
        ),
      ),
    );
  }
}
