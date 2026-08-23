import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../routes.dart';

class StrongAuthScreen extends StatelessWidget {
  const StrongAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verify your identity')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'NID verification confirms your identity using your Bangladesh National ID number and a one-time SMS code, so we can apply the correct fare and discounts to your account.',
                style: TextStyle(color: AppColors.textMuted),
              ),
              const SizedBox(height: 16),
              const Text('Verify using', style: TextStyle(color: AppColors.textMuted, fontSize: 12, fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              _method('NID verification', 'NID number + SMS OTP', selected: true),
              _method('Mobile banking KYC', 'bKash, Nagad verified identity', selected: false),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () => Navigator.of(context).pushNamed(AppRoutes.payment), child: const Text('Verify')),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _method(String title, String sub, {required bool selected}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: selected ? AppColors.primary : AppColors.border, width: selected ? 1.5 : 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          CircleAvatar(radius: 16, backgroundColor: selected ? AppColors.primary : AppColors.surface),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(title, style: const TextStyle(fontWeight: FontWeight.w600)), Text(sub, style: const TextStyle(fontSize: 11, color: AppColors.textMuted))],
          ),
        ],
      ),
    );
  }
}
