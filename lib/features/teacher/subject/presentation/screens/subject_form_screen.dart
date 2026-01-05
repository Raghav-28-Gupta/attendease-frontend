import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/config/theme/app_spacing.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../core/utils/snackbar_utils.dart';
import '../../../../../core/utils/validators.dart';
import '../../data/models/subject_model.dart';
import '../providers/subject_provider.dart';

class SubjectFormScreen extends ConsumerStatefulWidget {
  final SubjectModel? subject; // null for create, non-null for edit

  const SubjectFormScreen({
    super.key,
    this.subject,
  });

  @override
  ConsumerState<SubjectFormScreen> createState() => _SubjectFormScreenState();
}

class _SubjectFormScreenState extends ConsumerState<SubjectFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _codeController;
  late TextEditingController _nameController;
  late TextEditingController _creditController;
  late TextEditingController _departmentController;
  late TextEditingController _descriptionController;
  String _selectedSemester = '1';
  bool _isSubmitting = false;

  final List<String> _semesters = ['1', '2', '3', '4', '5', '6', '7', '8'];

  bool get isEditing => widget.subject != null;

  @override
  void initState() {
    super.initState();
    _codeController = TextEditingController(text: widget.subject?.code ?? '');
    _nameController = TextEditingController(text: widget.subject?.name ?? '');
    _descriptionController = TextEditingController(
      text: widget.subject?.description ?? '',
    );
    _selectedSemester = widget.subject?.semester ?? '1';
    _creditController = TextEditingController(
      text: widget.subject?.credits.toString() ?? '',
    );
    _departmentController = TextEditingController(
      text: widget.subject?.department ?? '',
    );
  }

  @override
  void dispose() {
    _codeController.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
    _creditController.dispose();
    _departmentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Subject' : 'Create Subject'),
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
                              'Editing Subject',
                              style: textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: colorScheme.onTertiaryContainer,
                              ),
                            ),
                            Text(
                              widget.subject!.code,
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

            AppTextField(
              controller: _codeController,
              label: 'Subject Code',
              hint: 'e.g., CS101',
              prefixIcon: Icons.tag,
              validator: Validators.required,
              textCapitalization: TextCapitalization.characters,
            ),
            const SizedBox(height: AppSpacing.md),

            AppTextField(
              controller: _nameController,
              label: 'Subject Name',
              hint: 'e.g., Data Structures',
              prefixIcon: Icons.book_outlined,
              validator: Validators.required,
              textCapitalization: TextCapitalization.words,
            ),
            const SizedBox(height: AppSpacing.lg),

            // Section: Academic Details
            _buildSectionHeader(
                context, 'Academic Details', Icons.school_outlined),
            const SizedBox(height: AppSpacing.sm),

            // Semester Selection
            Text(
              'Semester',
              style: textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            InkWell(
              onTap: _isSubmitting
                  ? null
                  : () => _showSemesterSelectionSheet(context),
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
                        Icons.calendar_month,
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
                            'Semester $_selectedSemester',
                            style: textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            _getSemesterDescription(_selectedSemester),
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

            // Credits and Department in a Row
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Credits',
                        style: textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      TextFormField(
                        controller: _creditController,
                        decoration: InputDecoration(
                          hintText: 'e.g., 3',
                          prefixIcon: Icon(
                            Icons.star_outline,
                            color: colorScheme.tertiary,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+\.?\d{0,1}')),
                        ],
                        validator: (value) {
                          if (value?.isEmpty ?? true) return 'Required';
                          final credits = double.tryParse(value!);
                          if (credits == null || credits <= 0) {
                            return 'Invalid';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Department',
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
                        validator: Validators.required,
                      ),
                    ],
                  ),
                ),
              ],
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
                hintText: 'Brief description of the subject',
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
              text: isEditing ? 'Update Subject' : 'Create Subject',
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

  String _getSemesterDescription(String semester) {
    final num = int.parse(semester);
    if (num <= 2) return 'First Year';
    if (num <= 4) return 'Second Year';
    if (num <= 6) return 'Third Year';
    return 'Fourth Year';
  }

  void _showSemesterSelectionSheet(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      builder: (context) => Column(
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
                Icon(Icons.calendar_month, color: colorScheme.primary),
                const SizedBox(width: AppSpacing.smd),
                Text(
                  'Select Semester',
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Divider(color: colorScheme.outlineVariant),

          // Semester Grid
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: AppSpacing.sm,
                crossAxisSpacing: AppSpacing.sm,
                childAspectRatio: 1.3,
              ),
              itemCount: _semesters.length,
              itemBuilder: (context, index) {
                final semester = _semesters[index];
                final isSelected = semester == _selectedSemester;

                return InkWell(
                  onTap: () {
                    setState(() => _selectedSemester = semester);
                    Navigator.pop(context);
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected
                          ? colorScheme.primaryContainer
                          : colorScheme.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected
                            ? colorScheme.primary
                            : colorScheme.outlineVariant,
                        width: isSelected ? 2 : 1,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          semester,
                          style: textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: isSelected
                                ? colorScheme.primary
                                : colorScheme.onSurface,
                          ),
                        ),
                        if (isSelected)
                          Icon(
                            Icons.check_circle,
                            size: 14,
                            color: colorScheme.primary,
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Year Legend
          Padding(
            padding: const EdgeInsets.fromLTRB(
                AppSpacing.md, 0, AppSpacing.md, AppSpacing.lg),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildYearLabel(context, '1-2', 'Year 1'),
                _buildYearLabel(context, '3-4', 'Year 2'),
                _buildYearLabel(context, '5-6', 'Year 3'),
                _buildYearLabel(context, '7-8', 'Year 4'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildYearLabel(BuildContext context, String semesters, String year) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Text(
          semesters,
          style: textTheme.labelSmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        Text(
          year,
          style: textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: colorScheme.primary,
          ),
        ),
      ],
    );
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    bool success;

    final credits = double.parse(_creditController.text.trim());

    if (isEditing) {
      // Update existing subject
      final request = UpdateSubjectRequest(
        code: _codeController.text.trim(),
        name: _nameController.text.trim(),
        credits: credits,
        semester: _selectedSemester,
        description: _descriptionController.text.trim().isEmpty
            ? null
            : _descriptionController.text.trim(),
        department: _departmentController.text.trim(),
      );

      success = await ref
          .read(subjectOperationsProvider.notifier)
          .updateSubject(widget.subject!.id, request);
    } else {
      // Create new subject
      final request = CreateSubjectRequest(
        code: _codeController.text.trim(),
        name: _nameController.text.trim(),
        credits: credits,
        department: _departmentController.text.trim(),
        semester: _selectedSemester,
        description: _descriptionController.text.trim().isEmpty
            ? null
            : _descriptionController.text.trim(),
      );

      success = await ref
          .read(subjectOperationsProvider.notifier)
          .createSubject(request);
    }

    if (mounted) {
      setState(() => _isSubmitting = false);

      if (success) {
        SnackbarUtils.showSuccess(
          context,
          isEditing
              ? 'Subject updated successfully!'
              : 'Subject created successfully!',
        );
        context.pop();
      } else {
        final error = ref.read(subjectOperationsProvider).error;
        SnackbarUtils.showError(
          context,
          error?.toString() ?? 'Operation failed',
        );
      }
    }
  }
}
