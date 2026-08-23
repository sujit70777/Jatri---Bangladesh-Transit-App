import 'package:flutter/material.dart';

import 'screens/onboarding_screen.dart';
import 'widgets/app_shell.dart';

import 'screens/tickets/buy_flow.dart';
import 'screens/tickets/guest_gate.dart';
import 'screens/tickets/manage_subscription.dart';
import 'screens/tickets/recommended_ticket.dart';

import 'screens/auth/create_account.dart';
import 'screens/auth/strong_auth.dart';
import 'screens/auth/reauth.dart';
import 'screens/auth/student_discount.dart';
import 'screens/auth/act_on_behalf.dart';

import 'screens/routes_info/search_autocomplete.dart';
import 'screens/routes_info/live_tracking.dart';
import 'screens/routes_info/stop_timetable.dart';
import 'screens/routes_info/service_area.dart';
import 'screens/routes_info/disruptions.dart';
import 'screens/routes_info/compare_prices.dart';
import 'screens/routes_info/my_routes_stops.dart';

import 'screens/settings/settings_hub.dart';
import 'screens/settings/my_information.dart';
import 'screens/settings/language.dart';
import 'screens/settings/my_places.dart';
import 'screens/settings/save_place.dart';
import 'screens/settings/payment_methods.dart';
import 'screens/settings/purchase_limits.dart';
import 'screens/settings/purchase_history.dart';
import 'screens/settings/receipt.dart';
import 'screens/settings/notifications.dart';
import 'screens/settings/feedback.dart';
import 'screens/settings/penalty_fare.dart';
import 'screens/settings/legal_pages.dart';

import 'screens/support/ticket_quiz.dart';
import 'screens/support/service_points.dart';
import 'screens/support/tap_in.dart';
import 'screens/support/app_vs_card.dart';
import 'screens/support/safety.dart';
import 'screens/support/discount_overview.dart';

import 'screens/states/empty_states.dart';

/// Every route name in the app, grouped to mirror the 7 row-categories
/// used to organize the Figma prototype. Keeping this as one file makes
/// the full navigation map easy to audit against Figma.
class AppRoutes {
  // Onboarding
  static const onboarding = '/onboarding';
  static const shell = '/'; // 4-tab shell: Home / Tickets / Routes / More

  // Ticket purchase flow
  static const buyLanding = '/tickets/landing';
  static const single = '/tickets/single';
  static const multi = '/tickets/multi';
  static const day = '/tickets/day';
  static const season = '/tickets/season';
  static const payment = '/tickets/payment';
  static const discount = '/tickets/discount';
  static const code = '/tickets/code';
  static const friend = '/tickets/friend';
  static const success = '/tickets/success';
  static const qrGuide = '/tickets/qr-guide';
  static const guestGate = '/tickets/guest-gate';
  static const manageSubscription = '/tickets/manage-subscription';
  static const cancelSubscription = '/tickets/cancel-subscription';
  static const recommended = '/tickets/recommended';

  // Account and authentication
  static const createAccount = '/auth/create-account';
  static const strongAuth = '/auth/strong-auth';
  static const reauth = '/auth/reauth';
  static const studentDiscount = '/auth/student-discount';
  static const actOnBehalf = '/auth/act-on-behalf';

  // Routes and journey info
  static const searchAutocomplete = '/routes/autocomplete';
  static const liveTracking = '/routes/live-tracking';
  static const stopTimetable = '/routes/timetable';
  static const serviceArea = '/routes/service-area';
  static const disruptions = '/routes/disruptions';
  static const comparePrices = '/routes/compare-prices';
  static const myRoutesStops = '/routes/my-routes-stops';

  // Settings and support
  static const settingsHub = '/settings/hub';
  static const myInformation = '/settings/my-information';
  static const language = '/settings/language';
  static const myPlaces = '/settings/my-places';
  static const savePlace = '/settings/save-place';
  static const paymentMethods = '/settings/payment-methods';
  static const purchaseLimits = '/settings/purchase-limits';
  static const purchaseHistory = '/settings/purchase-history';
  static const receipt = '/settings/receipt';
  static const notifications = '/settings/notifications';
  static const feedback = '/settings/feedback';
  static const penaltyFare = '/settings/penalty-fare';
  static const legalPage = '/settings/legal'; // takes a LegalPageId argument

  static const ticketQuiz = '/support/quiz';
  static const servicePoints = '/support/service-points';
  static const tapIn = '/support/tap-in';
  static const appVsCard = '/support/app-vs-card';
  static const safety = '/support/safety';
  static const discountOverview = '/support/discount-overview';

  // Empty and error states
  static const noActiveTicket = '/states/no-ticket';
  static const noSavedPlaces = '/states/no-places';
  static const offlineError = '/states/offline';
  static const noSearchResults = '/states/no-results';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    Widget page;
    switch (settings.name) {
      case onboarding:
        page = const OnboardingScreen();
        break;
      case shell:
        page = const AppShell();
        break;

      case buyLanding:
        page = const BuyTicketLandingScreen();
        break;
      case single:
        page = const TicketPurchaseScreen(ticketId: 'single');
        break;
      case multi:
        page = const TicketPurchaseScreen(ticketId: 'multi');
        break;
      case day:
        page = const TicketPurchaseScreen(ticketId: 'day');
        break;
      case season:
        page = const TicketPurchaseScreen(ticketId: 'season');
        break;
      case payment:
        page = const PaymentMethodScreen();
        break;
      case discount:
        page = const DiscountGroupScreen();
        break;
      case code:
        page = const TicketCodeScreen();
        break;
      case friend:
        page = const BuyForFriendScreen();
        break;
      case success:
        page = const PaymentSuccessScreen();
        break;
      case qrGuide:
        page = const QrGuideScreen();
        break;
      case guestGate:
        page = const GuestGateScreen();
        break;
      case manageSubscription:
        page = const ManageSubscriptionScreen();
        break;
      case cancelSubscription:
        page = const CancelSubscriptionScreen();
        break;
      case recommended:
        page = const RecommendedTicketScreen();
        break;

      case createAccount:
        page = const CreateAccountScreen();
        break;
      case strongAuth:
        page = const StrongAuthScreen();
        break;
      case reauth:
        page = const ReauthScreen();
        break;
      case studentDiscount:
        page = const StudentDiscountScreen();
        break;
      case actOnBehalf:
        page = const ActOnBehalfScreen();
        break;

      case searchAutocomplete:
        page = const SearchAutocompleteScreen();
        break;
      case liveTracking:
        page = const LiveTrackingScreen();
        break;
      case stopTimetable:
        page = const StopTimetableScreen();
        break;
      case serviceArea:
        page = const ServiceAreaScreen();
        break;
      case disruptions:
        page = const DisruptionsScreen();
        break;
      case comparePrices:
        page = const ComparePricesScreen();
        break;
      case myRoutesStops:
        page = const MyRoutesStopsScreen();
        break;

      case settingsHub:
        page = const SettingsHubScreen();
        break;
      case myInformation:
        page = const MyInformationScreen();
        break;
      case language:
        page = const LanguageScreen();
        break;
      case myPlaces:
        page = const MyPlacesScreen();
        break;
      case savePlace:
        page = const SavePlaceScreen();
        break;
      case paymentMethods:
        page = const PaymentMethodsScreen();
        break;
      case purchaseLimits:
        page = const PurchaseLimitsScreen();
        break;
      case purchaseHistory:
        page = const PurchaseHistoryScreen();
        break;
      case receipt:
        page = const ReceiptScreen();
        break;
      case notifications:
        page = const NotificationsScreen();
        break;
      case feedback:
        page = const FeedbackScreen();
        break;
      case penaltyFare:
        page = const PenaltyFareScreen();
        break;
      case legalPage:
        page = LegalPageScreen(pageId: settings.arguments as LegalPageId);
        break;

      case ticketQuiz:
        page = const TicketQuizScreen();
        break;
      case servicePoints:
        page = const ServicePointsScreen();
        break;
      case tapIn:
        page = const TapInScreen();
        break;
      case appVsCard:
        page = const AppVsCardScreen();
        break;
      case safety:
        page = const SafetyScreen();
        break;
      case discountOverview:
        page = const DiscountOverviewScreen();
        break;

      case noActiveTicket:
        page = const NoActiveTicketScreen();
        break;
      case noSavedPlaces:
        page = const NoSavedPlacesScreen();
        break;
      case offlineError:
        page = const OfflineErrorScreen();
        break;
      case noSearchResults:
        page = const NoSearchResultsScreen();
        break;

      default:
        page = Scaffold(body: Center(child: Text('Route not found: ${settings.name}')));
    }
    return MaterialPageRoute(builder: (_) => page, settings: settings);
  }
}
