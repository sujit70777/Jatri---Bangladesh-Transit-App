import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/routes_screen.dart';
import '../screens/tickets_screen.dart';
import '../screens/more_screen.dart';

/// The persistent four-tab shell: Home, Tickets, Routes, More.
/// Matches the tab bar wired throughout the Figma prototype.
class AppShell extends StatefulWidget {
  final int initialIndex;
  const AppShell({super.key, this.initialIndex = 0});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  late int _index = widget.initialIndex;

  static const _screens = [
    HomeScreen(),
    TicketsScreen(),
    RoutesScreen(),
    MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _index, children: _screens),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: 'HOME'),
          BottomNavigationBarItem(icon: Icon(Icons.confirmation_number_outlined), activeIcon: Icon(Icons.confirmation_number), label: 'TICKETS'),
          BottomNavigationBarItem(icon: Icon(Icons.alt_route_outlined), activeIcon: Icon(Icons.alt_route), label: 'ROUTES'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'MORE'),
        ],
      ),
    );
  }
}
