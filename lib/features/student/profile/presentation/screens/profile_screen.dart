import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/config/theme/app_spacing.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../../../../core/widgets/error_widget.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../core/widgets/student_navigation_bar.dart';
import '../../../../../core/utils/snackbar_utils.dart';
import '../../../../../core/utils/validators.dart';
import '../../../../../core/extensions/datetime_extensions.dart';
import '../../../../auth/presentation/providers/auth_provider.dart';
import '../../data/models/profile_model.dart';
import '../providers/profile_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(profileProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.lock_outline),
            onPressed: () {
              context.push('/change-password');
            },
            tooltip: 'Change Password',
          ),
        ],
      ),
      body: profileAsync.when(
        data: (profile) => _ProfileView(profile: profile),
        loading: () => const LoadingWidget(message: 'Loading profile...'),
        error: (error, stack) => AppErrorWidget(
          message: error.toString(),
          onRetry: () {
            ref.invalidate(profileProvider);
          },
        ),
      ),
      bottomNavigationBar: const StudentNavigationBar(currentIndex: 2),
    );
  }
}

class _ProfileView extends ConsumerStatefulWidget {
  final StudentProfileModel profile;

  const _ProfileView({required this.profile});

  @override
  ConsumerState<_ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<_ProfileView> {
  bool _isEditing = false;
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _phoneController;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _firstNameController =
        TextEditingController(text: widget.profile.firstName);
    _lastNameController = TextEditingController(text: widget.profile.lastName);
    _phoneController = TextEditingController(text: widget.profile.phone ?? '');
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      child: Column(
        children: [
          // Profile Header - M3 styled
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSpacing.lg),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Column(
              children: [
                // Avatar
                CircleAvatar(
                  radius: 50,
                  backgroundColor: colorScheme.surface,
                  child: Text(
                    widget.profile.firstName[0].toUpperCase(),
                    style: textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.primary,
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.md),

                // Name
                Text(
                  widget.profile.fullName,
                  style: textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
                const SizedBox(height: 4),

                // Student ID
                Text(
                  'ID: ${widget.profile.studentId}',
                  style: textTheme.bodyLarge?.copyWith(
                    color:
                        colorScheme.onPrimaryContainer.withValues(alpha: 0.8),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: AppSpacing.lg),

          // Profile Information
          if (_isEditing)
            _buildEditForm(colorScheme)
          else
            _buildProfileInfo(context),

          const SizedBox(height: AppSpacing.lg),
        ],
      ),
    );
  }

  Widget _buildProfileInfo(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Column(
        children: [
          _buildInfoCard(
            context,
            icon: Icons.email_outlined,
            label: 'Email',
            value: widget.profile.email,
            color: colorScheme.primary,
          ),
          const SizedBox(height: AppSpacing.smd),
          _buildInfoCard(
            context,
            icon: Icons.phone_outlined,
            label: 'Phone',
            value: widget.profile.phone ?? 'Not provided',
            color: colorScheme.tertiary,
          ),
          const SizedBox(height: AppSpacing.smd),
          _buildInfoCard(
            context,
            icon: Icons.group_outlined,
            label: 'Batch',
            value:
                '${widget.profile.batch.code} - ${widget.profile.batch.name}',
            color: colorScheme.secondary,
          ),
          const SizedBox(height: AppSpacing.smd),
          _buildInfoCard(
            context,
            icon: Icons.school_outlined,
            label: 'Academic Year',
            value: widget.profile.batch.academicYear,
            color: colorScheme.primary,
          ),
          const SizedBox(height: AppSpacing.smd),
          _buildInfoCard(
            context,
            icon: Icons.calendar_today_outlined,
            label: 'Member Since',
            value: widget.profile.createdAt.formattedDate,
            color: colorScheme.onSurfaceVariant,
          ),
          const SizedBox(height: AppSpacing.lg),

          // Edit Button
          AppButton.tonal(
            text: 'Edit Profile',
            onPressed: () {
              setState(() => _isEditing = true);
            },
            icon: Icons.edit,
          ),
        ],
      ),
    );
  }

  Widget _buildEditForm(ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            AppTextField(
              controller: _firstNameController,
              label: 'First Name',
              hint: 'Enter your first name',
              prefixIcon: Icons.person_outline,
              validator: Validators.required,
              enabled: !_isSubmitting,
              textCapitalization: TextCapitalization.words,
            ),
            const SizedBox(height: AppSpacing.md),
            AppTextField(
              controller: _lastNameController,
              label: 'Last Name',
              hint: 'Enter your last name',
              prefixIcon: Icons.person_outline,
              validator: Validators.required,
              enabled: !_isSubmitting,
              textCapitalization: TextCapitalization.words,
            ),
            const SizedBox(height: AppSpacing.md),
            AppTextField(
              controller: _phoneController,
              label: 'Phone',
              hint: 'Enter your phone number',
              prefixIcon: Icons.phone_outlined,
              keyboardType: TextInputType.phone,
              enabled: !_isSubmitting,
              textCapitalization: TextCapitalization.none,
            ),
            const SizedBox(height: AppSpacing.lg),

            // Buttons
            Row(
              children: [
                Expanded(
                  child: AppButton.outlined(
                    text: 'Cancel',
                    onPressed: _isSubmitting ? null : _handleCancel,
                  ),
                ),
                const SizedBox(width: AppSpacing.smd),
                Expanded(
                  child: AppButton.filled(
                    text: 'Save',
                    onPressed: _isSubmitting ? null : _handleSave,
                    isLoading: _isSubmitting,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        title: Text(
          label,
          style: textTheme.labelMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        subtitle: Text(
          value,
          style: textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface,
          ),
        ),
      ),
    );
  }

  void _handleCancel() {
    setState(() {
      _isEditing = false;
      _firstNameController.text = widget.profile.firstName;
      _lastNameController.text = widget.profile.lastName;
      _phoneController.text = widget.profile.phone ?? '';
    });
  }

  Future<void> _handleSave() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    final request = UpdateProfileRequest(
      firstName: _firstNameController.text.trim(),
      lastName: _lastNameController.text.trim(),
      phone: _phoneController.text.trim().isEmpty
          ? null
          : _phoneController.text.trim(),
    );

    final success =
        await ref.read(updateProfileProvider.notifier).updateProfile(request);

    if (mounted) {
      setState(() => _isSubmitting = false);

      if (success) {
        SnackbarUtils.showSuccess(context, 'Profile updated successfully!');
        setState(() => _isEditing = false);

        // Refresh profile and auth
        ref.invalidate(profileProvider);
        ref.read(authProvider.notifier).refreshUser();
      } else {
        final error = ref.read(updateProfileProvider).error;
        SnackbarUtils.showError(
          context,
          error?.toString() ?? 'Failed to update profile',
        );
      }
    }
  }
}

extension on DateTime {
  String get formattedDate => format();
}
