import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gpt_prompt_builder/features/account/domain/auth_service.dart';
import 'package:gpt_prompt_builder/features/account/presentation/ui/widgets/input_field.dart';
import 'package:gpt_prompt_builder/shared/widgets/app_bar/app_bar_universal.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool obscureText = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  String? _emailError;
  String? _passwordError;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFF1C1C1E),
      appBar: AppBarUniversal(onPressed: () => context.go('/')),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.8,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/small_robot_2.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Вход в аккаунт",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 27,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: const Color(0xFF1C1C1E),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InputField(
                                  controller: _emailController,
                                  hint: 'Email',
                                  icon: Icons.email_outlined,
                                  obscure: false,
                                  obscureText: false,
                                  onChanged: (_) {
                                    if (_emailError != null) {
                                      setState(() => _emailError = null);
                                    }
                                  },
                                ),
                                const SizedBox(height: 6),
                                SizedBox(
                                  height: 16,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child:
                                        _emailError != null
                                            ? Text(
                                              _emailError!,
                                              style: const TextStyle(
                                                color: Colors.redAccent,
                                                fontSize: 12,
                                              ),
                                            )
                                            : const SizedBox.shrink(),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                InputField(
                                  controller: _passwordController,
                                  hint: 'Пароль',
                                  icon: Icons.lock_outlined,
                                  obscure: true,
                                  obscureText: obscureText,
                                  onPressed: () {
                                    setState(() {
                                      obscureText = !obscureText;
                                    });
                                  },
                                  onChanged: (_) {
                                    if (_passwordError != null) {
                                      setState(() => _passwordError = null);
                                    }
                                  },
                                ),
                                const SizedBox(height: 6),
                                SizedBox(
                                  height: 16,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child:
                                        _passwordError != null
                                            ? Text(
                                              _passwordError!,
                                              style: const TextStyle(
                                                color: Colors.redAccent,
                                                fontSize: 12,
                                              ),
                                            )
                                            : const SizedBox.shrink(),
                                  ),
                                ),
                                const SizedBox(height: 8),

                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Забыли пароль?',
                                      style: TextStyle(
                                        color: Colors.white54,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 12),

                                Container(
                                  width: double.infinity,
                                  height: 54,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF2FE4C4),
                                        Color(0xFF6A6CF6),
                                        Color(0xFFB56CF0),
                                      ],
                                    ),
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      final email =
                                          _emailController.text.trim();
                                      final password =
                                          _passwordController.text.trim();

                                      setState(() {
                                        _emailError = null;
                                        _passwordError = null;
                                      });

                                      bool hasError = false;

                                      if (email.isEmpty) {
                                        _emailError = 'Введите email';
                                        hasError = true;
                                      }

                                      if (password.isEmpty) {
                                        _passwordError = 'Введите пароль';
                                        hasError = true;
                                      }

                                      if (hasError) {
                                        setState(() {});
                                        return;
                                      }

                                      try {
                                        await _authService.signIn(
                                          email,
                                          password,
                                        );
                                        context.go('/');
                                      } catch (_) {
                                        setState(() {
                                          _passwordError =
                                              'Неверный email или пароль';
                                        });
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      shadowColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                    ),
                                    child: const Text(
                                      'Войти',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 16),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Нет аккаунта?",
                                      style: TextStyle(
                                        color: Colors.white54,
                                        fontSize: 13,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed:
                                          () => context.go('/registration'),
                                      child: const Text(
                                        'Зарегистрироваться',
                                        style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
