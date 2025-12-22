import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/config/theme/app_colors.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../../../../core/widgets/error_widget.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_text_field.dart';
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
            icon: const Icon(Icons.lock),
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) {
            context.go('/student');
          } else if (index == 1) {
            context.push('/student/timetable');
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Timetable',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
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
    _firstNameController = TextEditingController(text: widget.profile.firstName);
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
    return SingleChildScrollView(
      child: Column(
        children: [
          // Profile Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Column(
              children: [
                // Avatar
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Text(
                    widget.profile.firstName[0].toUpperCase(),
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Name
                Text(
                  widget.profile.fullName,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),

                // Student ID
                Text(
                  'ID: ${widget.profile.studentId}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withAlpha((0.9 * 255).round()),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Profile Information
          if (_isEditing)
            _buildEditForm()
          else
            _buildProfileInfo(),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildProfileInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _buildInfoCard(
            icon: Icons.email,
            label: 'Email',
            value: widget.profile.email,
            color: AppColors.primary,
          ),
          const SizedBox(height: 12),
          _buildInfoCard(
            icon: Icons.phone,
            label: 'Phone',
            value: widget.profile.phone ?? 'Not provided',
            color: AppColors.success,
          ),
          const SizedBox(height: 12),
          _buildInfoCard(
            icon: Icons.group,
            label: 'Batch',
            value: '${widget.profile.batch.code} - ${widget.profile.batch.name}',
            color: AppColors.warning,
          ),
          const SizedBox(height: 12),
          _buildInfoCard(
            icon: Icons.school,
            label: 'Academic Year',
            value: widget.profile.batch.academicYear,
            color: AppColors.secondary,
          ),
          const SizedBox(height: 12),
          _buildInfoCard(
            icon: Icons.calendar_today,
            label: 'Member Since',
            value: widget.profile.createdAt.formattedDate,
            color: AppColors.textSecondary,
          ),
          const SizedBox(height: 24),

          // Edit Button
          AppButton(
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

  Widget _buildEditForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            AppTextField(
              controller: _firstNameController,
              label: 'First Name',
              hint: 'Enter your first name',
              prefixIcon: Icons.person,
              validator: Validators.required,
              enabled: !_isSubmitting,
              textCapitalization: TextCapitalization.words,
            ),
            const SizedBox(height: 16),
            AppTextField(
              controller: _lastNameController,
              label: 'Last Name',
              hint: 'Enter your last name',
              prefixIcon: Icons.person_outline,
              validator: Validators.required,
              enabled: !_isSubmitting,
              textCapitalization: TextCapitalization.words,
            ),
            const SizedBox(height: 16),
            AppTextField(
              controller: _phoneController,
              label: 'Phone',
              hint: 'Enter your phone number',
              prefixIcon: Icons.phone,
              keyboardType: TextInputType.phone,
              enabled: !_isSubmitting,
              textCapitalization: TextCapitalization.none,
            ),
            const SizedBox(height: 24),

            // Buttons
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    text: 'Cancel',
                    onPressed: _isSubmitting ? null : _handleCancel,
                    isOutlined: true,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: AppButton(
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

  Widget _buildInfoCard({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Card(
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withAlpha((0.1 * 255).round()),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        title: Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textSecondary,
          ),
        ),
        subtitle: Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
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

    final success = await ref
        .read(updateProfileProvider.notifier)
        .updateProfile(request);

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
