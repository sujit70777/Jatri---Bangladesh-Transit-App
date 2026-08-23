import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/common.dart';
import '../../routes.dart';

class NoActiveTicketScreen extends StatelessWidget {
  const NoActiveTicketScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return EmptyStateScreen(
      appBarTitle: 'Your tickets',
      title: 'No active ticket',
      description: "You don't have a valid ticket right now. Buy one before you board.",
      icon: Icons.confirmation_number_outlined,
      iconBg: AppColors.surface,
      ctaLabel: 'Buy a ticket',
      onCta: () => Navigator.of(context).pushNamed(AppRoutes.buyLanding),
    );
  }
}

class NoSavedPlacesScreen extends StatelessWidget {
  const NoSavedPlacesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return EmptyStateScreen(
      appBarTitle: 'Saved places',
      title: 'No saved places yet',
      description: 'Save your home, work, or favorite spots for quicker searches.',
      icon: Icons.location_on_outlined,
      iconBg: AppColors.surfaceTint,
      ctaLabel: 'Add a place',
      onCta: () => Navigator.of(context).pushNamed(AppRoutes.savePlace),
    );
  }
}

class OfflineErrorScreen extends StatelessWidget {
  const OfflineErrorScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return EmptyStateScreen(
      appBarTitle: '',
      title: 'No connection',
      description: 'Check your internet connection and try again. Some features, like your active ticket, still work offline.',
      icon: Icons.wifi_off,
      iconBg: const Color(0xFFFCEBEA),
      ctaLabel: 'Try again',
      onCta: () => Navigator.of(context).pop(),
    );
  }
}

class NoSearchResultsScreen extends StatelessWidget {
  const NoSearchResultsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const EmptyStateScreen(
      appBarTitle: 'Search',
      title: 'No results found',
      description: 'Try a different spelling, or search for a nearby landmark instead.',
      icon: Icons.search_off,
      iconBg: AppColors.surface,
    );
  }
}
