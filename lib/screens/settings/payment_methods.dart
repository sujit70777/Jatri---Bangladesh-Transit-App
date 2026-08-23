import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../routes.dart';
import '../../widgets/common.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicScreen(
      title: 'Payment methods',
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _method('bKash', '017XX XXX XXX \u00b7 Default'),
          _method('Visa ending 4471', 'Expires 08/28'),
          const SizedBox(height: 10),
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: const Text('Add payment method'))),
        ],
      ),
    );
  }

  Widget _method(String name, String sub) => Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            const CircleAvatar(radius: 16, backgroundColor: AppColors.primary),
            const SizedBox(width: 12),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(name, style: const TextStyle(fontWeight: FontWeight.w600)), Text(sub, style: const TextStyle(fontSize: 11, color: AppColors.textMuted))]),
          ],
        ),
      );
}

class PurchaseLimitsScreen extends StatelessWidget {
  const PurchaseLimitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicScreen(
      title: 'Purchase limits',
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Set a monthly spending cap to help manage your travel budget.', style: TextStyle(color: AppColors.textMuted)),
            const SizedBox(height: 14),
            const MockField(label: 'Monthly limit (Tk)', placeholder: '2,500'),
            const SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [
              Text('Used this month', style: TextStyle(color: AppColors.textMuted, fontSize: 12)),
              Text('Tk 840 / Tk 2,500', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
            ]),
            const Spacer(),
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Save limit'))),
          ],
        ),
      ),
    );
  }
}

class PurchaseHistoryScreen extends StatelessWidget {
  const PurchaseHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const items = [
      ('Season ticket \u2014 30 days', '3 Aug 2026', 'Tk 1,200'),
      ('Single ticket', '1 Aug 2026', 'Tk 30'),
      ('Day ticket \u2014 3 days', '28 Jul 2026', 'Tk 180'),
      ('Multi-journey \u2014 10 trips', '20 Jul 2026', 'Tk 270'),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Purchase history')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            for (final i in items)
              InkWell(
                onTap: () => Navigator.of(context).pushNamed(AppRoutes.receipt),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: AppColors.border))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(i.$1, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)), Text(i.$2, style: const TextStyle(fontSize: 11, color: AppColors.textMuted))]),
                      Text(i.$3, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
