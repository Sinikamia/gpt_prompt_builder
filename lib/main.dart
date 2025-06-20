import 'package:flutter/material.dart';
import 'package:gpt_prompt_builder/features/home/presentation/ui/home_screen.dart';
import 'package:gpt_prompt_builder/shared/widgets/bottom_navigation_bar/bottom_navigation_bar_main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String searchQuery = '';
  final TextEditingController _controller = TextEditingController();
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      setState(() {
        searchQuery = _controller.text;
      });
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Widget> get screens => [
    HomeScreen(controller: _controller),
    Center(child: Text('История', style: TextStyle(color: Colors.white))),
    Center(child: Text('Настройки', style: TextStyle(color: Colors.white))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1E),
      body: screens[_selectedIndex], //
      bottomNavigationBar: BottomNavigationBarMain(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
