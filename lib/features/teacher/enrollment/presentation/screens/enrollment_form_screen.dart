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
          subjectsAsync.when(
            data: (subjects) => DropdownButtonFormField<String>(
              value: _selectedSubjectId,
              decoration: const InputDecoration(
                labelText: 'Subject',
                prefixIcon: Icon(Icons.book_outlined),
                border: OutlineInputBorder(),
              ),
              items: subjects
                  .map((s) => DropdownMenuItem(
                        value: s.id,
                        child: Text('${s.code} • ${s.name}'),
                      ))
                  .toList(),
              onChanged: (val) => setState(() => _selectedSubjectId = val),
            ),
            loading: () => const _LoadingField(label: 'Subject'),
            error: (e, _) =>
                _ErrorField(label: 'Subject', message: e.toString()),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'Select Batches',
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          batchesAsync.when(
            data: (batches) => Column(
              children: batches.map((batch) {
                final isSelected = _selectedBatchIds.contains(batch.id);
                return CheckboxListTile(
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
                  title: Text(batch.name),
                  subtitle: Text('${batch.code} • ${batch.academicYear}'),
                  secondary: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.school_outlined,
                      color: colorScheme.onPrimaryContainer,
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
          if (_selectedBatchIds.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(AppSpacing.smd),
              decoration: BoxDecoration(
                color: colorScheme.tertiaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Icons.info_outline,
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
          AppButton.filled(
            text: 'Enroll Batches',
            isLoading: _isSubmitting,
            onPressed: _isSubmitting ? null : _handleSubmit,
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
