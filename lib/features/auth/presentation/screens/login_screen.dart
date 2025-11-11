import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/config/theme/app_colors.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/utils/snackbar_utils.dart';
import '../providers/auth_provider.dart';
import '../providers/auth_state.dart'; 

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    // Dismiss keyboard
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final success = await ref.read(authProvider.notifier).login(
          _emailController.text.trim(),
          _passwordController.text,
        );

    if (mounted) {
      setState(() => _isLoading = false);

      if (success) {
        SnackbarUtils.showSuccess(context, 'Welcome back! 👋');
      } else {
        final authState = ref.read(authProvider);
        authState.maybeWhen(
          error: (message) => SnackbarUtils.showError(context, message),
          orElse: () {},
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Listen to auth state for additional error handling
    ref.listen<AuthState>(authProvider, (previous, next) {
      next.maybeWhen(
        error: (message) {
          if (mounted) SnackbarUtils.showError(context, message);
        },
        orElse: () {},
      );
    });

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 48),

                // Logo with Hero animation
                Center(
                  child: Hero(
                    tag: 'app_logo',
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withOpacity(0.3),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.check_circle,
                        size: 56,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // Title
                const Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),

                // Subtitle
                const Text(
                  'Login to manage your attendance',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),

                // Email Field
                AppTextField(
                  label: 'Email Address',
                  hint: 'your.email@college.edu',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icons.email_outlined,
                  validator: Validators.email,
                  enabled: !_isLoading,
                ),
                const SizedBox(height: 20),

                // Password Field
                AppTextField(
                  label: 'Password',
                  hint: '••••••••',
                  controller: _passwordController,
                  obscureText: true,
                  prefixIcon: Icons.lock_outlined,
                  validator: Validators.password,
                  enabled: !_isLoading,
                ),
                const SizedBox(height: 12),

                // Remember Me & Forgot Password Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Remember Me Checkbox
                    Row(
                      children: [
                        Checkbox(
                          value: _rememberMe,
                          onChanged: _isLoading
                              ? null
                              : (value) {
                                  setState(() => _rememberMe = value ?? false);
                                },
                        ),
                        const Text(
                          'Remember me',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),

                    // Forgot Password (future feature)
                    TextButton(
                      onPressed: _isLoading
                          ? null
                          : () {
                              SnackbarUtils.showInfo(
                                context,
                                'Contact admin to reset password',
                              );
                            },
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Login Button
                AppButton(
                  text: 'Login',
                  onPressed: _isLoading ? null : _handleLogin,
                  isLoading: _isLoading,
                ),
                const SizedBox(height: 24),

                // Divider
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'OR',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: 24),

                // Help Text
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.info.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.info.withOpacity(0.3),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.info_outline,
                            color: AppColors.info,
                            size: 20,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'Login Help',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.info.withOpacity(0.9),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '• Students: Use credentials sent via email\n'
                        '• Teachers: Use your registered account\n'
                        '• Contact admin for login issues',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.info.withOpacity(0.8),
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
