# Jatri — Flutter Prototype

A working Flutter starter covering the core flow designed and wired in the
Jatri Figma prototype: Splash → Onboarding → four-tab shell (Home, Tickets,
Routes, More) → journey search → route results → itinerary detail → full
ticket purchase flow → Your Tickets.

## Important: not built or run in this environment

This was written in a sandbox without the Flutter SDK or access to pub.dev,
so it has **not been compiled or visually verified** — it's real, complete
Dart/Flutter source, structurally checked, but you'll be the first to
actually run it. Expect to fix a handful of small issues on first run
(typical for any hand-written Flutter code that hasn't hit `flutter
analyze` yet).

## What's real vs. what's still a stub

- **Colors, type, and layout** — match the documented Jatri color system
  (`#006A4E` primary, etc.) and the Figma screens directly.
- **MRT Line 6 station names and order** — real, from `/lib/data/transit_data.dart`,
  sourced from the same DMTCL data used to build the project's GTFS feed.
- **BRTA bus route codes and stops** (A-110, A-114, etc.) — real, from the
  same BRTA fare-list data used earlier in the project.
- **Route results and fares shown** — illustrative, not computed. There's no
  routing engine wired in yet; see the project's OpenTripPlanner plan for
  that piece.
- **Payment, ticket purchase** — UI-complete, but "Continue to payment"
  doesn't call any real payment provider. See the project's ticketing
  business-model gap (no unified Bangladesh transit authority yet) before
  wiring this to anything real.

## Running it

```bash
flutter pub get
flutter run
```

Requires Flutter 3.x. If `google_fonts` fails to resolve Nunito at build
time (no internet in some CI environments), swap `GoogleFonts.nunito*` in
`lib/theme/app_theme.dart` for a bundled local font instead.

## What's not built yet

This covers the core flow only, not all 68 Figma screens — no settings
hierarchy, no account/auth flow, no legal pages, no empty/error states.
Structure (`lib/screens/`, `lib/theme/`, `lib/data/`) is set up so those
can be added the same way as what's here.
