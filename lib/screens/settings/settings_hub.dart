import 'package:flutter/material.dart';
import '../../widgets/common.dart';
import '../../routes.dart';

class SettingsHubScreen extends StatelessWidget {
  const SettingsHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nav = Navigator.of(context);
    return BasicScreen(
      title: 'Settings',
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SectionLabel('My information and settings'),
          SettingsRow(title: 'My information', onTap: () => nav.pushNamed(AppRoutes.myInformation)),
          SettingsRow(title: 'Language', onTap: () => nav.pushNamed(AppRoutes.language)),
          SettingsRow(title: 'My places and options', onTap: () => nav.pushNamed(AppRoutes.myPlaces)),

          const SectionLabel('Payment'),
          SettingsRow(title: 'Payment methods', onTap: () => nav.pushNamed(AppRoutes.paymentMethods)),
          SettingsRow(title: 'Purchase limits', onTap: () => nav.pushNamed(AppRoutes.purchaseLimits)),
          SettingsRow(title: 'Purchase history', onTap: () => nav.pushNamed(AppRoutes.purchaseHistory)),

          const SectionLabel('Communication'),
          SettingsRow(title: 'Notifications and email', onTap: () => nav.pushNamed(AppRoutes.notifications)),

          const SectionLabel('Legal and privacy'),
          SettingsRow(title: 'Processing of personal data', onTap: () => nav.pushNamed(AppRoutes.legalPage, arguments: LegalPageId.personalData)),
          SettingsRow(title: 'Cookie preferences', onTap: () => nav.pushNamed(AppRoutes.legalPage, arguments: LegalPageId.cookies)),
          SettingsRow(title: 'Location', onTap: () => nav.pushNamed(AppRoutes.legalPage, arguments: LegalPageId.location)),
          SettingsRow(title: 'Travel data', onTap: () => nav.pushNamed(AppRoutes.legalPage, arguments: LegalPageId.travelData)),
          SettingsRow(title: 'Accessibility statement', onTap: () => nav.pushNamed(AppRoutes.legalPage, arguments: LegalPageId.accessibility)),
          SettingsRow(title: 'Emergency contact details', onTap: () => nav.pushNamed(AppRoutes.legalPage, arguments: LegalPageId.emergency)),
          SettingsRow(title: 'Screen rotation', onTap: () => nav.pushNamed(AppRoutes.legalPage, arguments: LegalPageId.screenRotation)),
          SettingsRow(title: 'Open source licences', onTap: () => nav.pushNamed(AppRoutes.legalPage, arguments: LegalPageId.openSource)),

          const SizedBox(height: 10),
          SettingsRow(title: 'Log out of the app', danger: true, onTap: () => nav.popUntil((r) => r.isFirst)),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
