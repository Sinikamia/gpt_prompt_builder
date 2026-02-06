import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gpt_prompt_builder/shared/widgets/bottom_navigation_bar/bottom_navigation_bar_main.dart';

class MainShell extends StatelessWidget {
  final Widget child;
  const MainShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E),
      body: child,
      bottomNavigationBar: BottomNavigationBarMain(
        selectedIndex: _selectedIndex(context),
        onItemTapped: (index) {
          switch (index) {
            case 0:
              context.go('/');
              break;
            case 1:
              context.go('/history');
              break;
            case 2:
              context.go('/settings');
              break;
          }
        },
      ),
    );
  }

  int _selectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/history')) return 1;
    if (location.startsWith('/settings')) return 2;
    return 0;
  }
}
