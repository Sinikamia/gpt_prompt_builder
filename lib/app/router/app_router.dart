import 'package:go_router/go_router.dart';
import 'package:gpt_prompt_builder/features/account/presentation/ui/account_screen.dart';
import 'package:gpt_prompt_builder/features/account_registration/presentation/ui/account_registration_screen.dart';
import 'package:gpt_prompt_builder/features/history/presentation/ui/history_screen.dart';
import 'package:gpt_prompt_builder/features/home/presentation/ui/home_screen.dart';
import 'package:gpt_prompt_builder/features/prompt/presentation/ui/prompt_screen.dart';
import 'package:gpt_prompt_builder/features/prompt_generation/domain/models/prompt_models.dart';
import 'package:gpt_prompt_builder/features/prompt_generation/presentation/ui/prompt_generation_screen.dart';
import 'package:gpt_prompt_builder/features/settings/presentation/ui/settings_screen.dart';
import 'package:gpt_prompt_builder/shared/navigation/main_shell.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainShell(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) {
            return HomeScreen(
              onTap: (selectedCategory) {
                context.push('/generation', extra: selectedCategory);
              },
            );
          },
        ),
        GoRoute(
          path: '/history',
          builder: (context, state) => const HistoryScreen(),
        ),
        GoRoute(
          path: '/settings',
          builder: (context, state) => const SettingsScreen(),
        ),
      ],
    ),
    GoRoute(
      path: '/account',
      builder: (context, state) => const AccountScreen(),
    ),
    GoRoute(
      path: '/registration',
      builder: (context, state) => const AccountRegistrationScreen(),
    ),
    GoRoute(
      path: '/prompt',
      builder: (context, state) {
        final prompt = state.extra as PromptModel;
        return PromptScreen(prompt: prompt);
      },
    ),
    GoRoute(
      path: '/generation',
      builder: (context, state) {
        final selectedCategory = state.extra as String;
        return PromptGenerationScreen(selectedCategory: selectedCategory);
      },
    ),
  ],
);
