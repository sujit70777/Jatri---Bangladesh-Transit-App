import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/transit_data.dart';
import '../routes.dart';

class TicketsScreen extends StatelessWidget {
  const TicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Column(
          children: [
            const TabBar(
              labelColor: AppColors.primary,
              unselectedLabelColor: AppColors.textMuted,
              indicatorColor: AppColors.primary,
              tabs: [Tab(text: 'Buy a ticket'), Tab(text: 'Your tickets')],
            ),
            Expanded(
              child: TabBarView(children: [_BuyTicketLanding(), _YourTickets()]),
            ),
          ],
        ),
      ),
    );
  }
}

class _BuyTicketLanding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        for (final t in ticketTypes)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: InkWell(
              borderRadius: BorderRadius.circular(14),
              onTap: () => Navigator.of(context).pushNamed(switch (t.id) {
                'single' => AppRoutes.single,
                'multi' => AppRoutes.multi,
                'day' => AppRoutes.day,
                'season' => AppRoutes.season,
                _ => AppRoutes.single,
              }),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(14)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(t.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16)),
                    const SizedBox(height: 4),
                    Text(t.subtitle, style: TextStyle(color: AppColors.surfaceTint, fontSize: 12)),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class TicketPurchaseScreen extends StatelessWidget {
  final TicketType ticketType;
  const TicketPurchaseScreen({super.key, required this.ticketType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(ticketType.title)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(ticketType.subtitle, style: TextStyle(color: AppColors.textMuted)),
            const Spacer(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Total', style: TextStyle(color: AppColors.textMuted)), Text('Tk 60', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700))],
            ),
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const PaymentSuccessScreen())),
                child: const Text('Continue to payment'),
              ),
            ),
          ],
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
              Text('Your ticket is active and ready to use.', textAlign: TextAlign.center, style: TextStyle(color: AppColors.textMuted)),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).popUntil((r) => r.isFirst),
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

class _YourTickets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Icon(Icons.qr_code_2, size: 160, color: AppColors.text),
        const SizedBox(height: 8),
        const Center(child: Text('124446 67471345')),
        const SizedBox(height: 20),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [Text('Fare', style: TextStyle(color: AppColors.textMuted, fontSize: 12)), Text('Tk 60', style: TextStyle(fontWeight: FontWeight.w700))]),
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: const [Text('Customer group', style: TextStyle(color: AppColors.textMuted, fontSize: 12)), Text('Adult', style: TextStyle(fontWeight: FontWeight.w700))]),
          ],
        ),
        const SizedBox(height: 20),
        ElevatedButton(onPressed: () => Navigator.of(context).pushNamed(AppRoutes.buyLanding), child: const Text('Buy a new ticket')),
      ],
    );
  }
}
