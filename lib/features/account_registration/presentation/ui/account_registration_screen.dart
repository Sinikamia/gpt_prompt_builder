import 'package:flutter/material.dart';
import 'package:gpt_prompt_builder/features/account/domain/auth_service.dart';
import 'package:gpt_prompt_builder/features/account/presentation/ui/widgets/input_field.dart';
import 'package:gpt_prompt_builder/shared/widgets/app_bar/app_bar_universal.dart';

class AccountRegistrationScreen extends StatefulWidget {
  const AccountRegistrationScreen({super.key});

  @override
  State<AccountRegistrationScreen> createState() =>
      _AccountRegistrationScreenState();
}

class _AccountRegistrationScreenState extends State<AccountRegistrationScreen> {
  bool obscureText = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final AuthService _authService = AuthService();
  String? _emailError;
  String? _passwordError;
  String? _confirmPasswordError;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    setState(() {
      _emailError = null;
      _passwordError = null;
      _confirmPasswordError = null;
    });

    if (email.isEmpty && password.isEmpty && confirmPassword.isEmpty) {
      setState(() {
        _confirmPasswordError = 'Заполните все поля';
      });
      return;
    }

    bool hasError = false;

    if (email.isEmpty) {
      _emailError = 'Введите email';
      hasError = true;
    }
    if (password.isEmpty) {
      _passwordError = 'Введите пароль';
      hasError = true;
    }
    if (confirmPassword.isEmpty) {
      _confirmPasswordError = 'Повторите пароль';
      hasError = true;
    }

    if (hasError) {
      setState(() {});
      return;
    }

    if (password != confirmPassword) {
      setState(() {
        _confirmPasswordError = 'Пароли не совпадают';
      });
      return;
    }

    try {
      await _authService.signUp(email, password);

      if (!mounted) return;
      Navigator.pop(context);
    } catch (e) {
      setState(() {
        _confirmPasswordError = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFF1C1C1E),
      appBar: AppBarUniversal(onPressed: () => Navigator.pop(context)),
      body: Stack(
        children: [
          /// Фон
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
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Регистрация",
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
                                InputField(
                                  controller: _confirmPasswordController,
                                  hint: 'Повторите пароль',
                                  icon: Icons.lock_outlined,
                                  obscure: true,
                                  obscureText: obscureText,
                                  onPressed: () {
                                    setState(() {
                                      obscureText = !obscureText;
                                    });
                                  },
                                  onChanged: (_) {
                                    if (_confirmPasswordError != null) {
                                      setState(
                                        () => _confirmPasswordError = null,
                                      );
                                    }
                                  },
                                ),
                                const SizedBox(height: 6),
                                SizedBox(
                                  height: 16,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child:
                                        _confirmPasswordError != null
                                            ? Text(
                                              _confirmPasswordError!,
                                              style: const TextStyle(
                                                color: Colors.redAccent,
                                                fontSize: 12,
                                              ),
                                            )
                                            : const SizedBox.shrink(),
                                  ),
                                ),
                                const SizedBox(height: 12),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Wrap(
                                        alignment: WrapAlignment.center,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        children: [
                                          const Text(
                                            "Регистрируясь, вы принимаете ",
                                            style: TextStyle(
                                              color: Colors.white54,
                                              fontSize: 13,
                                            ),
                                          ),

                                          TextButton(
                                            onPressed: () {},
                                            style: TextButton.styleFrom(
                                              padding: EdgeInsets.zero,
                                              minimumSize: Size.zero,
                                              tapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                            ),
                                            child: const Text(
                                              'Условия сервиса',
                                              style: TextStyle(
                                                color: Colors.blueAccent,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 20),

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
                                    onPressed: _register,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      shadowColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                    ),
                                    child: const Text(
                                      'Зарегистрироваться',
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
                                      "Уже есть аккаунт?",
                                      style: TextStyle(
                                        color: Colors.white54,
                                        fontSize: 13,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        'Войти',
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
