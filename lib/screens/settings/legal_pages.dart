import 'package:flutter/material.dart';
import '../../widgets/common.dart';

enum LegalPageId { personalData, cookies, location, travelData, accessibility, emergency, screenRotation, openSource }

class LegalPageScreen extends StatelessWidget {
  final LegalPageId pageId;
  const LegalPageScreen({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    final content = _content[pageId]!;
    return SimpleTextScreen(title: content.$1, paragraphs: content.$2);
  }

  static final Map<LegalPageId, (String, List<String>)> _content = {
    LegalPageId.personalData: (
      'Processing of personal data',
      [
        'We collect your name, contact details, and travel history to provide ticketing, journey planning, and account services.',
        'Your data is processed under Bangladesh\u2019s data protection regulations. You can request a copy or deletion of your data at any time by contacting support.',
      ]
    ),
    LegalPageId.cookies: (
      'Cookie preferences',
      ['We use your data to plan better routes for you.', 'This helps us show your recent searches and suggest tickets that fit how you travel.'],
    ),
    LegalPageId.location: (
      'Location',
      [
        'Jatri uses your location to show nearby stops, suggest routes from where you are, and improve arrival estimates.',
        'You can change this permission any time from your phone\u2019s system settings.',
      ]
    ),
    LegalPageId.travelData: (
      'Travel data',
      [
        'Sharing your travel history helps Jatri recommend better ticket types and personalized routes based on how you actually travel.',
        'This data is never shared with third parties or advertisers.',
      ]
    ),
    LegalPageId.accessibility: (
      'Accessibility statement',
      [
        'We aim to make Jatri usable for everyone, including passengers using screen readers, reduced motion settings, and larger text sizes.',
        'If you encounter an accessibility barrier, let us know through the Message screen and we\u2019ll prioritize a fix.',
      ]
    ),
    LegalPageId.emergency: (
      'Emergency contact details',
      ['Fire Service: 199', 'Police: 999', 'Ambulance: 199', 'For lost property or an incident on board, use the Message screen to reach Jatri support directly.'],
    ),
    LegalPageId.screenRotation: (
      'Screen rotation',
      ['Control whether the app rotates with your device orientation.'],
    ),
    LegalPageId.openSource: (
      'Open source licences',
      ['Flutter \u2014 BSD-3-Clause', 'OpenTripPlanner \u2014 AGPL-3.0', 'trufi-core \u2014 GPL-3.0', 'OpenStreetMap data \u2014 ODbL'],
    ),
  };
}
