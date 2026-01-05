import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/config/theme/app_spacing.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/utils/snackbar_utils.dart';
import '../../../batch/presentation/providers/batch_provider.dart';
import '../../../subject/presentation/providers/subject_provider.dart';
import '../../data/models/enrollment_model.dart';
import '../providers/enrollment_provider.dart';

class EnrollmentFormScreen extends ConsumerStatefulWidget {
  const EnrollmentFormScreen({super.key});

  @override
  ConsumerState<EnrollmentFormScreen> createState() =>
      _EnrollmentFormScreenState();
}

class _EnrollmentFormScreenState extends ConsumerState<EnrollmentFormScreen> {
  final Set<String> _selectedBatchIds = {};
  String? _selectedSubjectId;
  bool _isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final batchesAsync = ref.watch(batchesProvider);
    final subjectsAsync = ref.watch(subjectsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Enroll Batches to Subject'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          // Subject Selection - Custom field with bottom sheet
          subjectsAsync.when(
            data: (subjects) => InkWell(
              onTap: () => _showSubjectSelectionSheet(context, subjects),
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  border: Border.all(color: colorScheme.outline),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.book_outlined,
                      color: colorScheme.primary,
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: _selectedSubjectId == null
                          ? Text(
                              'Select Subject',
                              style: textTheme.bodyLarge?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            )
                          : Builder(builder: (context) {
                              final subject = subjects.firstWhere(
                                (s) => s.id == _selectedSubjectId,
                              );
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    subject.name,
                                    style: textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    '${subject.code} • Sem ${subject.semester}',
                                    style: textTheme.labelSmall?.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              );
                            }),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ],
                ),
              ),
            ),
            loading: () => const _LoadingField(label: 'Subject'),
            error: (e, _) =>
                _ErrorField(label: 'Subject', message: e.toString()),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Batches Section Header
          Text(
            'Select Batches',
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),

          // Batch Selection Cards
          batchesAsync.when(
            data: (batches) => Column(
              children: batches.map((batch) {
                final isSelected = _selectedBatchIds.contains(batch.id);
                return Card(
                  margin: const EdgeInsets.only(bottom: AppSpacing.sm),
                  color: isSelected
                      ? colorScheme.primaryContainer
                      : colorScheme.surfaceContainerLow,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          _selectedBatchIds.remove(batch.id);
                        } else {
                          _selectedBatchIds.add(batch.id);
                        }
                      });
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      child: Row(
                        children: [
                          // Batch Icon
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? colorScheme.primary
                                  : colorScheme.primaryContainer,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.groups_outlined,
                              color: isSelected
                                  ? colorScheme.onPrimary
                                  : colorScheme.onPrimaryContainer,
                            ),
                          ),
                          const SizedBox(width: AppSpacing.md),

                          // Batch Info
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  batch.name,
                                  style: textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: isSelected
                                        ? colorScheme.onPrimaryContainer
                                        : colorScheme.onSurface,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  '${batch.code} • ${batch.academicYear} • ${batch.studentCount} students',
                                  style: textTheme.labelSmall?.copyWith(
                                    color: isSelected
                                        ? colorScheme.onPrimaryContainer
                                        : colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Checkbox
                          Checkbox(
                            value: isSelected,
                            onChanged: (val) {
                              setState(() {
                                if (val == true) {
                                  _selectedBatchIds.add(batch.id);
                                } else {
                                  _selectedBatchIds.remove(batch.id);
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => _ErrorField(
              label: 'Batches',
              message: e.toString(),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Selected count info
          if (_selectedBatchIds.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(AppSpacing.smd),
              decoration: BoxDecoration(
                color: colorScheme.tertiaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Icons.check_circle,
                      color: colorScheme.onTertiaryContainer, size: 20),
                  const SizedBox(width: AppSpacing.sm),
                  Text(
                    '${_selectedBatchIds.length} batch(es) selected',
                    style: textTheme.labelLarge?.copyWith(
                      color: colorScheme.onTertiaryContainer,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: AppSpacing.lg),

          // Submit Button
          AppButton.filled(
            text: 'Enroll Batches',
            isLoading: _isSubmitting,
            onPressed: _isSubmitting ? null : _handleSubmit,
            icon: Icons.add_circle_outline,
          ),
        ],
      ),
    );
  }

  void _showSubjectSelectionSheet(
      BuildContext context, List<dynamic> subjects) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.4,
        maxChildSize: 0.9,
        expand: false,
        builder: (context, scrollController) => Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
                vertical: AppSpacing.sm,
              ),
              child: Row(
                children: [
                  Icon(Icons.book, color: colorScheme.primary),
                  const SizedBox(width: AppSpacing.smd),
                  Text(
                    'Select Subject',
                    style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: colorScheme.outlineVariant),

            // Subject List
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                itemCount: subjects.length,
                itemBuilder: (context, index) {
                  final subject = subjects[index];
                  final isSelected = subject.id == _selectedSubjectId;

                  return Card(
                    margin: const EdgeInsets.only(bottom: AppSpacing.smd),
                    color: isSelected
                        ? colorScheme.primaryContainer
                        : colorScheme.surfaceContainerLow,
                    child: InkWell(
                      onTap: () {
                        setState(() => _selectedSubjectId = subject.id);
                        Navigator.pop(context);
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Padding(
                        padding: const EdgeInsets.all(AppSpacing.md),
                        child: Row(
                          children: [
                            // Subject Icon
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? colorScheme.primary
                                    : colorScheme.primaryContainer,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                Icons.book_outlined,
                                color: isSelected
                                    ? colorScheme.onPrimary
                                    : colorScheme.onPrimaryContainer,
                              ),
                            ),
                            const SizedBox(width: AppSpacing.md),

                            // Subject Info
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    subject.name,
                                    style: textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: isSelected
                                          ? colorScheme.onPrimaryContainer
                                          : colorScheme.onSurface,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      _buildInfoChip(
                                        context,
                                        subject.code,
                                        Icons.tag,
                                        isSelected,
                                      ),
                                      const SizedBox(width: AppSpacing.sm),
                                      _buildInfoChip(
                                        context,
                                        'Sem ${subject.semester}',
                                        Icons.calendar_today,
                                        isSelected,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            // Check icon
                            if (isSelected)
                              Icon(
                                Icons.check_circle,
                                color: colorScheme.primary,
                              )
                            else
                              Icon(
                                Icons.circle_outlined,
                                color: colorScheme.outline,
                              ),
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

  Widget _buildInfoChip(
    BuildContext context,
    String text,
    IconData icon,
    bool isSelected,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: isSelected
            ? colorScheme.primary.withValues(alpha: 0.15)
            : colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 12,
            color:
                isSelected ? colorScheme.primary : colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: 4),
          Text(
            text,
            style: textTheme.labelSmall?.copyWith(
              color: isSelected
                  ? colorScheme.primary
                  : colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _handleSubmit() async {
    if (_selectedSubjectId == null) {
      SnackbarUtils.showError(context, 'Please select a subject');
      return;
    }

    if (_selectedBatchIds.isEmpty) {
      SnackbarUtils.showError(context, 'Please select at least one batch');
      return;
    }

    setState(() => _isSubmitting = true);

    final req = EnrollBatchesRequest(
      subjectId: _selectedSubjectId!,
      batchIds: _selectedBatchIds.toList(),
    );

    final ok =
        await ref.read(enrollmentOpsProvider.notifier).enrollBatches(req);

    if (!mounted) return;
    setState(() => _isSubmitting = false);

    if (ok) {
      final response = ref.read(enrollmentOpsProvider).lastResponse;
      SnackbarUtils.showSuccess(
        context,
        response?.message ?? 'Batches enrolled successfully',
      );
      context.pop();
    } else {
      final err = ref.read(enrollmentOpsProvider).error;
      SnackbarUtils.showError(context, err ?? 'Failed to enroll batches');
    }
  }
}

class _LoadingField extends StatelessWidget {
  final String label;
  const _LoadingField({required this.label});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return InputDecorator(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          const SizedBox(width: AppSpacing.sm),
          Text('Loading...', style: textTheme.bodyMedium),
        ],
      ),
    );
  }
}

class _ErrorField extends StatelessWidget {
  final String label;
  final String message;
  const _ErrorField({required this.label, required this.message});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return InputDecorator(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline, size: 16, color: colorScheme.error),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              message,
              style: textTheme.labelSmall?.copyWith(color: colorScheme.error),
            ),
          ),
        ],
      ),
    );
  }
}
