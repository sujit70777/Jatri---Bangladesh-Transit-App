import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../routes.dart';
import '../../data/transit_data.dart';

class BuyTicketLandingScreen extends StatelessWidget {
  const BuyTicketLandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buy a ticket')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            for (final t in ticketTypes)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: InkWell(
                  borderRadius: BorderRadius.circular(14),
                  onTap: () {
                    final route = switch (t.id) {
                      'single' => AppRoutes.single,
                      'multi' => AppRoutes.multi,
                      'day' => AppRoutes.day,
                      'season' => AppRoutes.season,
                      _ => AppRoutes.single,
                    };
                    Navigator.of(context).pushNamed(route);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(14)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(t.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16)),
                        const SizedBox(height: 4),
                        Text(t.subtitle, style: const TextStyle(color: AppColors.surfaceTint, fontSize: 12)),
                      ],
                    ),
                  ),
                ),
              ),
            const Divider(height: 32),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Ticket with a code', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600)),
              trailing: const Icon(Icons.chevron_right, color: AppColors.primary),
              onTap: () => Navigator.of(context).pushNamed(AppRoutes.code),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Buy for a friend', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600)),
              trailing: const Icon(Icons.chevron_right, color: AppColors.primary),
              onTap: () => Navigator.of(context).pushNamed(AppRoutes.friend),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Instructions, fares and terms', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600)),
              trailing: const Icon(Icons.chevron_right, color: AppColors.primary),
              onTap: () => Navigator.of(context).pushNamed(AppRoutes.comparePrices),
            ),
          ],
        ),
      ),
    );
  }
}

/// Handles Single, Multi-journey, and Day ticket purchase (they route
/// straight to payment). Season ticket routes through the guest gate first.
class TicketPurchaseScreen extends StatelessWidget {
  final String ticketId;
  const TicketPurchaseScreen({super.key, required this.ticketId});

  @override
  Widget build(BuildContext context) {
    final type = ticketTypes.firstWhere((t) => t.id == ticketId);
    return Scaffold(
      appBar: AppBar(title: Text(type.title)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(type.subtitle, style: const TextStyle(color: AppColors.textMuted)),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total', style: TextStyle(color: AppColors.textMuted)),
                  Text(ticketId == 'season' ? 'Tk 1,200' : ticketId == 'day' ? 'Tk 180' : ticketId == 'multi' ? 'Tk 270' : 'Tk 60',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                ],
              ),
              const SizedBox(height: 14),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Season tickets require an account (guest gate); others go straight to payment.
                    Navigator.of(context).pushNamed(ticketId == 'season' ? AppRoutes.guestGate : AppRoutes.payment);
                  },
                  child: const Text('Continue to payment'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const methods = [('bKash', 'Most popular'), ('Nagad', null), ('Rocket', null), ('Debit or credit card', 'Visa, Mastercard')];
    return Scaffold(
      appBar: AppBar(title: const Text('Payment method')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final m in methods)
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: m == methods.first ? AppColors.primary : AppColors.border, width: m == methods.first ? 1.5 : 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(radius: 16, backgroundColor: m == methods.first ? AppColors.primary : AppColors.surface),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(m.$1, style: const TextStyle(fontWeight: FontWeight.w600)),
                          if (m.$2 != null) Text(m.$2!, style: const TextStyle(fontSize: 11, color: AppColors.textMuted)),
                        ],
                      ),
                    ],
                  ),
                ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pushNamed(AppRoutes.discount),
                  child: const Text('Pay now'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DiscountGroupScreen extends StatelessWidget {
  const DiscountGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const groups = [('Standard fare', 'No discount'), ('Student', '40% off season tickets'), ('Child (7\u201317)', '50% off all ticket types'), ('Senior (65+)', '40% off season tickets')];
    return Scaffold(
      appBar: AppBar(title: const Text('Discount group')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final g in groups)
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: g == groups.first ? AppColors.primary : AppColors.border, width: g == groups.first ? 1.5 : 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(radius: 16, backgroundColor: g == groups.first ? AppColors.primary : AppColors.surface),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(g.$1, style: const TextStyle(fontWeight: FontWeight.w600)),
                          Text(g.$2, style: const TextStyle(fontSize: 11, color: AppColors.textMuted)),
                        ],
                      ),
                    ],
                  ),
                ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pushNamed(AppRoutes.success),
                  child: const Text('Confirm'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TicketCodeScreen extends StatelessWidget {
  const TicketCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ticket with a code')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Have a code from your employer, school, or a promotion? Redeem it here.', style: TextStyle(color: AppColors.textMuted)),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(10)),
                child: const Text('Enter code', style: TextStyle(color: AppColors.textMuted)),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () => Navigator.of(context).pushNamed(AppRoutes.payment), child: const Text('Redeem')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuyForFriendScreen extends StatelessWidget {
  const BuyForFriendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buy for a friend')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('You must be travelling together. Their ticket will show on your phone.', style: TextStyle(color: AppColors.textMuted)),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(10)),
                child: const Text("Friend's name (optional)", style: TextStyle(color: AppColors.textMuted)),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () => Navigator.of(context).pushNamed(AppRoutes.payment), child: const Text('Continue to payment')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(width: 72, height: 72, decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle), child: const Icon(Icons.check, color: Colors.white, size: 36)),
              const SizedBox(height: 16),
              const Text('Ticket purchased', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700)),
              const SizedBox(height: 8),
              const Text('Your ticket is active and ready to use.', textAlign: TextAlign.center, style: TextStyle(color: AppColors.textMuted)),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pushNamed(AppRoutes.qrGuide),
                  child: const Text('View my ticket'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QrGuideScreen extends StatelessWidget {
  const QrGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(width: 160, height: 200, decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(12))),
                const SizedBox(height: 16),
                const Text('Show your ticket to the reader', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700), textAlign: TextAlign.center),
                const SizedBox(height: 10),
                const Text(
                  "Hold your phone with the QR code facing the reader until it beeps green. Keep the app in its default light theme \u2014 dark mode can't be scanned.",
                  style: TextStyle(color: AppColors.textMuted),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () => Navigator.of(context).popUntil((r) => r.isFirst),
                  child: const Text('Done'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
