import 'package:flutter/material.dart';
import 'package:gpt_prompt_builder/shared/widgets/app_bar/app_bar_universal.dart';
import 'package:gpt_prompt_builder/shared/widgets/button/button_search.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});
  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1E),
      appBar: AppBarUniversal(text: 'История'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 5),
            ButtonSearch(controller: _controller),
            const SizedBox(height: 15),
            Expanded(
              child: ListView(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Opacity(
                          opacity: 0.6,
                          child: Image.asset(
                            'assets/box_white_1.png',
                            width: 70,
                            height: 70,
                          ),
                        ),

                        const SizedBox(height: 20),
                        Text(
                          'Здесь пока нет истории — добавьте свой промпт, чтобы начать!',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
