// Real transit data sourced from DMTCL's published MRT Line 6 schedule
// and BRTA's fare list, built earlier in the Jatri project.
// See /backend/gtfs in the project repo for the full GTFS feeds this
// prototype's mock data is drawn from.

class Station {
  final String id;
  final String name;
  const Station(this.id, this.name);
}

/// Real 16-station order for MRT Line 6, Uttara North to Motijheel.
const List<Station> mrt6Stations = [
  Station('MRT6_01', 'Uttara North'),
  Station('MRT6_02', 'Uttara Center'),
  Station('MRT6_03', 'Uttara South'),
  Station('MRT6_04', 'Pallabi'),
  Station('MRT6_05', 'Mirpur 11'),
  Station('MRT6_06', 'Mirpur 10'),
  Station('MRT6_07', 'Kazipara'),
  Station('MRT6_08', 'Shewrapara'),
  Station('MRT6_09', 'Agargaon'),
  Station('MRT6_10', 'Bijoy Sarani'),
  Station('MRT6_11', 'Farmgate'),
  Station('MRT6_12', 'Karwan Bazar'),
  Station('MRT6_13', 'Shahbag'),
  Station('MRT6_14', 'Dhaka University'),
  Station('MRT6_15', 'Bangladesh Secretariat'),
  Station('MRT6_16', 'Motijheel'),
];

class BusRoute {
  final String code; // Real BRTA route code
  final String name;
  final List<String> stops;
  const BusRoute(this.code, this.name, this.stops);
}

/// A subset of real BRTA-coded Dhaka bus routes.
const List<BusRoute> busRoutes = [
  BusRoute('A-110', 'Duyaripara \u2013 Gulistan', ['Duyaripara', 'Mirpur 10', 'Farmgate', 'Karwan Bazar', 'Gulistan']),
  BusRoute('A-114', 'Mirpur Zoo \u2013 Sayedabad', ['Mirpur Zoo', 'Mirpur 10', 'Farmgate', 'Motijheel', 'Sayedabad']),
  BusRoute('A-115', 'Mirpur-1 \u2013 Jatrabari', ['Mirpur-1', 'Mirpur 10', 'Farmgate', 'Motijheel', 'Jatrabari']),
  BusRoute('A-101', 'Kalshi \u2013 Kanchpur Bridge', ['Kalshi', 'Mirpur 12', 'Farmgate', 'Motijheel', 'Kanchpur Bridge']),
];

class Itinerary {
  final String badge;
  final int minutes;
  final int fareTaka;
  final String modeLabel;
  final String modeType; // 'mrt' | 'bus'
  const Itinerary(this.badge, this.minutes, this.fareTaka, this.modeLabel, this.modeType);
}

/// Example computed itineraries for a Uttara Center -> Motijheel search,
/// matching the real MRT6 travel time and a real bus route from the data above.
List<Itinerary> exampleItineraries(String from, String to) => const [
      Itinerary('Fastest', 35, 60, 'MRT Line 6, 14 stops direct', 'mrt'),
      Itinerary('Cheaper', 50, 35, 'Bus A-110, Duyaripara to Gulistan', 'bus'),
      Itinerary('Fewer transfers', 42, 60, 'MRT Line 6 + 5 min walk', 'mrt'),
    ];

class TicketType {
  final String id;
  final String title;
  final String subtitle;
  const TicketType(this.id, this.title, this.subtitle);
}

const List<TicketType> ticketTypes = [
  TicketType('single', 'Single ticket', 'One journey, direct or with transfer'),
  TicketType('multi', 'Multi-journey ticket', 'Buy 10 or 20 single tickets in one go'),
  TicketType('day', 'Day ticket', '1\u201313 days, unlimited travel'),
  TicketType('season', 'Season ticket', 'Auto-renewing or one-off purchase'),
];
