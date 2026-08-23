import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../routes.dart';
import '../../widgets/common.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicScreen(
      title: 'Create your account',
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MockField(label: 'Full name', placeholder: 'e.g. Ehsanur Rahman'),
            const SizedBox(height: 14),
            const MockField(label: 'Phone number', placeholder: '+880'),
            const SizedBox(height: 14),
            const MockField(label: 'Email', placeholder: 'you@example.com'),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(10)),
              child: Text(
                'You can buy single and day tickets as a guest without an account. Creating an account unlocks season tickets, saved routes, and personalized alerts.',
                style: TextStyle(color: AppColors.textMuted, fontSize: 12),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () => Navigator.of(context).pushNamed(AppRoutes.strongAuth), child: const Text('Continue')),
            ),
          ],
        ),
      ),
    );
  }
}
