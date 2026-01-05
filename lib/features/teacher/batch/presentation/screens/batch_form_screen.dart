import 'package:attendease_frontend/core/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/config/theme/app_spacing.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../core/utils/snackbar_utils.dart';
import '../../../../../core/utils/validators.dart';
import '../../data/models/batch_model.dart';
import '../providers/batch_provider.dart';

class BatchFormScreen extends ConsumerStatefulWidget {
  final BatchModel? batch; // null for create, non-null for edit

  const BatchFormScreen({
    super.key,
    this.batch,
  });

  @override
  ConsumerState<BatchFormScreen> createState() => _BatchFormScreenState();
}

class _BatchFormScreenState extends ConsumerState<BatchFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _codeController;
  late TextEditingController _nameController;
  late TextEditingController _academicYearController;
  late TextEditingController _departmentController;
  late TextEditingController _descriptionController;
  bool _isSubmitting = false;

  // Academic year options
  late List<String> _academicYears;
  String? _selectedAcademicYear;

  bool get isEditing => widget.batch != null;

  @override
  void initState() {
    super.initState();
    _codeController = TextEditingController(text: widget.batch?.code ?? '');
    _nameController = TextEditingController(text: widget.batch?.name ?? '');
    _departmentController = TextEditingController(
      text: widget.batch?.department ?? '',
    );
    _descriptionController = TextEditingController(
      text: widget.batch?.description ?? '',
    );

    // Generate academic year options
    final currentYear = DateTime.now().year;
    _academicYears = List.generate(4, (i) {
      final year = currentYear - 1 + i;
      return '$year-${year + 1}';
    });

    _selectedAcademicYear = widget.batch?.academicYear ?? _academicYears[1];
    _academicYearController =
        TextEditingController(text: _selectedAcademicYear);
  }

  @override
  void dispose() {
    _codeController.dispose();
    _nameController.dispose();
    _academicYearController.dispose();
    _departmentController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Batch' : 'Create Batch'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.md),
          children: [
            // Header Card for Edit Mode
            if (isEditing)
              Card(
                color: colorScheme.tertiaryContainer,
                margin: const EdgeInsets.only(bottom: AppSpacing.lg),
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: colorScheme.tertiary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.edit_note,
                          color: colorScheme.onTertiary,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Editing Batch',
                              style: textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: colorScheme.onTertiaryContainer,
                              ),
                            ),
                            Text(
                              '${widget.batch!.code} • ${widget.batch!.studentCount} students',
                              style: textTheme.labelMedium?.copyWith(
                                color: colorScheme.onTertiaryContainer
                                    .withValues(alpha: 0.8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            // Section: Basic Information
            _buildSectionHeader(
                context, 'Basic Information', Icons.info_outline),
            const SizedBox(height: AppSpacing.sm),

            // Code and Name in Card
            AppTextField(
              controller: _codeController,
              label: 'Batch Code',
              hint: 'e.g., CS-2024-A',
              prefixIcon: Icons.tag,
              validator: Validators.required,
              textCapitalization: TextCapitalization.characters,
            ),
            const SizedBox(height: AppSpacing.md),

            AppTextField(
              controller: _nameController,
              label: 'Batch Name',
              hint: 'e.g., Computer Science 2024',
              prefixIcon: Icons.groups_outlined,
              validator: Validators.required,
              textCapitalization: TextCapitalization.words,
            ),
            const SizedBox(height: AppSpacing.lg),

            // Section: Academic Details
            _buildSectionHeader(
                context, 'Academic Details', Icons.school_outlined),
            const SizedBox(height: AppSpacing.sm),

            // Academic Year Selection
            Text(
              'Academic Year',
              style: textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            InkWell(
              onTap:
                  _isSubmitting ? null : () => _showAcademicYearSheet(context),
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  border: Border.all(color: colorScheme.outline),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.calendar_today,
                        color: colorScheme.onPrimaryContainer,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _selectedAcademicYear ?? 'Select Year',
                            style: textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            _getAcademicYearDescription(_selectedAcademicYear),
                            style: textTheme.labelSmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.md),

            // Department
            Text(
              'Department (Optional)',
              style: textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            TextFormField(
              controller: _departmentController,
              decoration: InputDecoration(
                hintText: 'e.g., Computer Science',
                prefixIcon: Icon(
                  Icons.business_outlined,
                  color: colorScheme.secondary,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              textCapitalization: TextCapitalization.words,
            ),
            const SizedBox(height: AppSpacing.lg),

            // Section: Additional Information
            _buildSectionHeader(
                context, 'Additional Information', Icons.description_outlined),
            const SizedBox(height: AppSpacing.sm),

            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description (Optional)',
                hintText: 'Brief description of the batch',
                alignLabelWithHint: true,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(bottom: 48),
                  child: Icon(
                    Icons.notes,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              maxLines: 3,
              textCapitalization: TextCapitalization.sentences,
            ),

            const SizedBox(height: AppSpacing.xl),

            // Submit Button
            AppButton.filled(
              text: isEditing ? 'Update Batch' : 'Create Batch',
              onPressed: _isSubmitting ? null : _handleSubmit,
              isLoading: _isSubmitting,
              icon: isEditing ? Icons.save_outlined : Icons.add_circle_outline,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(
      BuildContext context, String title, IconData icon) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.sm),
      child: Row(
        children: [
          Icon(icon, size: 20, color: colorScheme.primary),
          const SizedBox(width: AppSpacing.sm),
          Text(
            title,
            style: textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }

  String _getAcademicYearDescription(String? year) {
    if (year == null) return 'Select academic year';
    final currentYear = DateTime.now().year;
    final startYear = int.tryParse(year.split('-').first) ?? currentYear;

    if (startYear == currentYear) return 'Current Year';
    if (startYear == currentYear + 1) return 'Upcoming Year';
    if (startYear == currentYear - 1) return 'Previous Year';
    return 'Past Year';
  }

  void _showAcademicYearSheet(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final currentYear = DateTime.now().year;

    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (context) => ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.5,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
                vertical: AppSpacing.sm,
              ),
              child: Row(
                children: [
                  Icon(Icons.calendar_today, color: colorScheme.primary),
                  const SizedBox(width: AppSpacing.smd),
                  Text(
                    'Select Academic Year',
                    style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: colorScheme.outlineVariant),

            // Year List - Scrollable
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(AppSpacing.md),
                itemCount: _academicYears.length,
                itemBuilder: (context, index) {
                  final year = _academicYears[index];
                  final isSelected = year == _selectedAcademicYear;
                  final startYear = int.tryParse(year.split('-').first) ?? 0;
                  final isCurrent = startYear == currentYear;
                  final isUpcoming = startYear == currentYear + 1;

                  return Card(
                    margin: const EdgeInsets.only(bottom: AppSpacing.sm),
                    color: isSelected
                        ? colorScheme.primaryContainer
                        : colorScheme.surfaceContainerLow,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedAcademicYear = year;
                          _academicYearController.text = year;
                        });
                        Navigator.pop(context);
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.md,
                          vertical: AppSpacing.smd,
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? colorScheme.primary
                                    : isCurrent
                                        ? colorScheme.tertiaryContainer
                                        : colorScheme.primaryContainer,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                isCurrent
                                    ? Icons.today
                                    : isUpcoming
                                        ? Icons.upcoming
                                        : Icons.calendar_month,
                                size: 18,
                                color: isSelected
                                    ? colorScheme.onPrimary
                                    : isCurrent
                                        ? colorScheme.onTertiaryContainer
                                        : colorScheme.onPrimaryContainer,
                              ),
                            ),
                            const SizedBox(width: AppSpacing.md),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    year,
                                    style: textTheme.titleSmall?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: isSelected
                                          ? colorScheme.onPrimaryContainer
                                          : colorScheme.onSurface,
                                    ),
                                  ),
                                  if (isCurrent || isUpcoming)
                                    Container(
                                      margin: const EdgeInsets.only(top: 2),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 6,
                                        vertical: 1,
                                      ),
                                      decoration: BoxDecoration(
                                        color: isCurrent
                                            ? colorScheme.tertiary
                                            : colorScheme.secondary,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        isCurrent ? 'Current' : 'Upcoming',
                                        style: textTheme.labelSmall?.copyWith(
                                          color: isCurrent
                                              ? colorScheme.onTertiary
                                              : colorScheme.onSecondary,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            if (isSelected)
                              Icon(Icons.check_circle,
                                  color: colorScheme.primary, size: 22)
                            else
                              Icon(Icons.circle_outlined,
                                  color: colorScheme.outline, size: 22),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    bool success;

    if (isEditing) {
      // Update existing batch
      final request = UpdateBatchRequest(
        code: _codeController.text.trim(),
        name: _nameController.text.trim(),
        academicYear:
            _selectedAcademicYear ?? _academicYearController.text.trim(),
        department: _departmentController.text.trim().isEmpty
            ? null
            : _departmentController.text.trim(),
        description: _descriptionController.text.trim().isEmpty
            ? null
            : _descriptionController.text.trim(),
      );

      AppLogger.info('UpdateBatch payload: ${request.toJson()}');
      success = await ref
          .read(batchOperationsProvider.notifier)
          .updateBatch(widget.batch!.id, request);
    } else {
      // Create new batch
      final request = CreateBatchRequest(
        code: _codeController.text.trim(),
        name: _nameController.text.trim(),
        academicYear:
            _selectedAcademicYear ?? _academicYearController.text.trim(),
        department: _departmentController.text.trim().isEmpty
            ? null
            : _departmentController.text.trim(),
        description: _descriptionController.text.trim().isEmpty
            ? null
            : _descriptionController.text.trim(),
      );

      AppLogger.info('CreateBatch payload: ${request.toJson()}');
      success =
          await ref.read(batchOperationsProvider.notifier).createBatch(request);
    }

    if (mounted) {
      setState(() => _isSubmitting = false);

      if (success) {
        SnackbarUtils.showSuccess(
          context,
          isEditing
              ? 'Batch updated successfully!'
              : 'Batch created successfully!',
        );
        context.pop();
      } else {
        final error = ref.read(batchOperationsProvider).error;
        SnackbarUtils.showError(
          context,
          error?.toString() ?? 'Operation failed',
        );
      }
    }
  }
}
