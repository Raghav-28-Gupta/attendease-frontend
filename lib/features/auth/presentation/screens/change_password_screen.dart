import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/config/theme/app_spacing.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/utils/snackbar_utils.dart';
import '../providers/auth_provider.dart';

class ChangePasswordScreen extends ConsumerStatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  ConsumerState<ChangePasswordScreen> createState() =>
      _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends ConsumerState<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleChangePassword() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final success = await ref.read(authProvider.notifier).changePassword(
          _oldPasswordController.text,
          _newPasswordController.text,
        );

    if (mounted) {
      setState(() => _isLoading = false);

      if (success) {
        SnackbarUtils.showSuccess(
          context,
          'Password changed successfully!',
        );
        context.pop();
      } else {
        SnackbarUtils.showError(
          context,
          'Failed to change password. Please check your old password.',
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: AppSpacing.lg),
                Container(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: colorScheme.tertiaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.info_outline,
                          color: colorScheme.onTertiaryContainer, size: 20),
                      const SizedBox(width: AppSpacing.smd),
                      Expanded(
                        child: Text(
                          'Choose a strong password with at least 8 characters',
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.onTertiaryContainer,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),
                AppTextField(
                  label: 'Current Password',
                  hint: 'Enter your current password',
                  controller: _oldPasswordController,
                  obscureText: true,
                  prefixIcon: Icons.lock_outlined,
                  validator: Validators.password,
                  textCapitalization: TextCapitalization.none,
                ),
                const SizedBox(height: AppSpacing.mlg),
                AppTextField(
                  label: 'New Password',
                  hint: 'Enter your new password',
                  controller: _newPasswordController,
                  obscureText: true,
                  prefixIcon: Icons.lock_outlined,
                  validator: Validators.password,
                  textCapitalization: TextCapitalization.none,
                ),
                const SizedBox(height: AppSpacing.mlg),
                AppTextField(
                  label: 'Confirm New Password',
                  hint: 'Re-enter your new password',
                  controller: _confirmPasswordController,
                  obscureText: true,
                  prefixIcon: Icons.lock_outlined,
                  validator: (value) => Validators.confirmPassword(
                    value,
                    _newPasswordController.text,
                  ),
                  textCapitalization: TextCapitalization.none,
                ),
                const SizedBox(height: AppSpacing.xl),
                AppButton.filled(
                  text: 'Change Password',
                  onPressed: _isLoading ? null : _handleChangePassword,
                  isLoading: _isLoading,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
