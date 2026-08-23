import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// A settings/hub-style tappable row with title + optional subtitle.
class SettingsRow extends StatelessWidget {
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final bool danger;
  const SettingsRow({super.key, required this.title, this.subtitle, this.onTap, this.danger = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: AppColors.border))),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontSize: 14, color: danger ? AppColors.alert : AppColors.text)),
                  if (subtitle != null) ...[
                    const SizedBox(height: 2),
                    Text(subtitle!, style: TextStyle(fontSize: 12, color: AppColors.textMuted)),
                  ],
                ],
              ),
            ),
            if (onTap != null) const Icon(Icons.chevron_right, color: AppColors.textMuted, size: 18),
          ],
        ),
      ),
    );
  }
}

/// A section label above a group of SettingsRows.
class SectionLabel extends StatelessWidget {
  final String text;
  const SectionLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 4),
      child: Text(text, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.textMuted)),
    );
  }
}

/// A basic screen with a back-button app bar and scrollable body padding.
/// Used by most secondary screens for consistency.
class BasicScreen extends StatelessWidget {
  final String title;
  final Widget body;
  final List<Widget>? actions;
  const BasicScreen({super.key, required this.title, required this.body, this.actions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), actions: actions),
      body: SafeArea(child: body),
    );
  }
}

/// A simple long-form text page — used for the legal/privacy screens,
/// which are mostly paragraphs with no interactive elements.
class SimpleTextScreen extends StatelessWidget {
  final String title;
  final List<String> paragraphs;
  const SimpleTextScreen({super.key, required this.title, required this.paragraphs});

  @override
  Widget build(BuildContext context) {
    return BasicScreen(
      title: title,
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          for (final p in paragraphs) ...[
            Text(p, style: TextStyle(color: AppColors.textMuted, height: 1.5)),
            const SizedBox(height: 14),
          ],
        ],
      ),
    );
  }
}

/// An empty/placeholder state: icon, title, description, optional CTA.
class EmptyStateScreen extends StatelessWidget {
  final String appBarTitle;
  final String title;
  final String description;
  final String? ctaLabel;
  final VoidCallback? onCta;
  final IconData icon;
  final Color iconBg;
  const EmptyStateScreen({
    super.key,
    required this.appBarTitle,
    required this.title,
    required this.description,
    required this.icon,
    required this.iconBg,
    this.ctaLabel,
    this.onCta,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(appBarTitle)),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(color: iconBg, shape: BoxShape.circle),
                        child: Icon(icon, color: AppColors.primary),
                      ),
                      const SizedBox(height: 16),
                      Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700), textAlign: TextAlign.center),
                      const SizedBox(height: 8),
                      Text(description, style: TextStyle(color: AppColors.textMuted), textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
            ),
            if (ctaLabel != null)
              Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(width: double.infinity, child: ElevatedButton(onPressed: onCta, child: Text(ctaLabel!))),
              ),
          ],
        ),
      ),
    );
  }
}

/// A labelled input-look field (visual only, no real text controller wiring
/// needed for this prototype's purposes).
class MockField extends StatelessWidget {
  final String label;
  final String placeholder;
  const MockField({super.key, required this.label, required this.placeholder});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.textMuted)),
        const SizedBox(height: 6),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(10)),
          child: Text(placeholder, style: TextStyle(color: AppColors.textMuted)),
        ),
      ],
    );
  }
}
