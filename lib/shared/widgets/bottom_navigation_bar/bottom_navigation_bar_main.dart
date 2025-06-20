import 'package:flutter/material.dart';

class BottomNavigationBarMain extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  const BottomNavigationBarMain({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      color: const Color(0xFF1C1C1E),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () => onItemTapped(0),
            child: Column(
              children: [
                Icon(
                  Icons.home,
                  color: selectedIndex == 0 ? Colors.white70 : Colors.white12,
                  size: 27,
                ),
                const SizedBox(height: 4),
                Text(
                  'Главная',
                  style: TextStyle(
                    color: selectedIndex == 0 ? Colors.white70 : Colors.white12,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => onItemTapped(1),
            child: Column(
              children: [
                Icon(
                  Icons.history,
                  color: selectedIndex == 1 ? Colors.white70 : Colors.white12,
                  size: 27,
                ),
                const SizedBox(height: 4),
                Text(
                  "История",
                  style: TextStyle(
                    color: selectedIndex == 1 ? Colors.white70 : Colors.white12,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => onItemTapped(2),
            child: Column(
              children: [
                Icon(
                  Icons.settings_outlined,
                  color: selectedIndex == 2 ? Colors.white70 : Colors.white12,
                  size: 27,
                ),
                const SizedBox(height: 4),
                Text(
                  'Настройки',
                  style: TextStyle(
                    color: selectedIndex == 2 ? Colors.white70 : Colors.white12,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
