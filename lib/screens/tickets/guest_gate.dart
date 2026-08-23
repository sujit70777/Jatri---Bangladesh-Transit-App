import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../routes.dart';

/// The flow-logic fix identified earlier in this project: guest users
/// attempting to buy a season ticket must be gated into account creation
/// first, matching real HSL behavior. Previously this was missing.
class GuestGateScreen extends StatelessWidget {
  const GuestGateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 64, height: 64, decoration: const BoxDecoration(color: AppColors.surfaceTint, shape: BoxShape.circle), child: const Icon(Icons.lock_outline, color: AppColors.primary)),
              const SizedBox(height: 16),
              const Text('Create an account to continue', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700), textAlign: TextAlign.center),
              const SizedBox(height: 10),
              const Text(
                'Season and multi-journey tickets require an account so we can confirm your discount eligibility and keep your ticket safe if you switch phones.',
                style: TextStyle(color: AppColors.textMuted),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pushNamed(AppRoutes.createAccount),
                  child: const Text('Create account'),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => Navigator.of(context).pushNamed(AppRoutes.payment),
                  child: const Text('I already have an account'),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () => Navigator.of(context).popUntil((r) => r.isFirst),
                child: const Text('Choose a different ticket type', style: TextStyle(color: AppColors.textMuted)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
