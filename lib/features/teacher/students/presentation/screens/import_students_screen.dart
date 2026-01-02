import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/config/theme/app_spacing.dart';
import '../../../../../core/utils/snackbar_utils.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../../batch/presentation/providers/batch_provider.dart';
import '../providers/student_provider.dart';

class ImportStudentsScreen extends ConsumerStatefulWidget {
  const ImportStudentsScreen({super.key});

  @override
  ConsumerState<ImportStudentsScreen> createState() =>
      _ImportStudentsScreenState();
}

class _ImportStudentsScreenState extends ConsumerState<ImportStudentsScreen> {
  String? _selectedBatchId;
  File? _file;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final batchesAsync = ref.watch(batchesProvider);
    final importState = ref.watch(importStudentsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Import Students'),
            const SizedBox(height: 2),
            Text(
              'Upload CSV to add students to batch',
              style: textTheme.labelSmall,
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.info_outline, color: colorScheme.primary),
                      const SizedBox(width: AppSpacing.sm),
                      Text(
                        'CSV Format Instructions',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Text(
                    'Required CSV headers:',
                    style: textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.smd),
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'student_id,first_name,last_name,email,phone',
                      style: textTheme.bodySmall?.copyWith(
                        fontFamily: 'monospace',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Text(
                    'Example CSV content:',
                    style: textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.smd),
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'student_id,first_name,last_name,email,phone\n'
                      '2024001,John,Doe,john@college.edu,9876543210\n'
                      '2024002,Jane,Smith,jane@college.edu,9876543211',
                      style: textTheme.bodySmall?.copyWith(
                        fontFamily: 'monospace',
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.smd),
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.smd),
                    decoration: BoxDecoration(
                      color: colorScheme.tertiaryContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: colorScheme.onTertiaryContainer,
                          size: 20,
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Expanded(
                          child: Text(
                            'Phone is optional. Header row is required.',
                            style: textTheme.labelMedium?.copyWith(
                              color: colorScheme.onTertiaryContainer,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'Step 1: Select Batch',
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppSpacing.smd),
          batchesAsync.when(
            data: (batches) {
              if (batches.isEmpty) {
                return Card(
                  color: colorScheme.errorContainer,
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    child: Column(
                      children: [
                        Icon(
                          Icons.error_outline,
                          color: colorScheme.onErrorContainer,
                          size: 40,
                        ),
                        const SizedBox(height: AppSpacing.smd),
                        Text(
                          'No Batches Available',
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        Text(
                          'Please create a batch first before importing students.',
                          textAlign: TextAlign.center,
                          style: textTheme.bodyMedium,
                        ),
                        const SizedBox(height: AppSpacing.md),
                        AppButton.tonal(
                          text: 'Create Batch',
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icons.add,
                        ),
                      ],
                    ),
                  ),
                );
              }

              return DropdownButtonFormField<String>(
                value: _selectedBatchId,
                decoration: const InputDecoration(
                  labelText: 'Select Batch',
                  prefixIcon: Icon(Icons.school_outlined),
                  border: OutlineInputBorder(),
                  helperText: 'Choose which batch to add students to',
                ),
                items: batches.map((batch) {
                  return DropdownMenuItem(
                    value: batch.id,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          batch.name,
                          style: textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '${batch.code} • ${batch.academicYear} • ${batch.studentCount} students',
                          style: textTheme.labelSmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedBatchId = value;
                    _file = null;
                  });
                  ref.read(importStudentsProvider.notifier).reset();
                },
              );
            },
            loading: () => const LoadingWidget(message: 'Loading batches...'),
            error: (error, stack) => Card(
              color: colorScheme.errorContainer,
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.smd),
                child: Row(
                  children: [
                    Icon(Icons.error_outline,
                        color: colorScheme.onErrorContainer),
                    const SizedBox(width: AppSpacing.smd),
                    Expanded(
                      child: Text(
                        'Failed to load batches: ${error.toString()}',
                        style: textTheme.labelMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'Step 2: Select CSV File',
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppSpacing.smd),
          Card(
            child: ListTile(
              enabled: _selectedBatchId != null,
              leading: Icon(
                Icons.description_outlined,
                size: 32,
                color: _selectedBatchId == null
                    ? colorScheme.onSurfaceVariant
                    : colorScheme.primary,
              ),
              title: Text(
                _file == null
                    ? 'No file selected'
                    : _file!.path.split('/').last,
                style: textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: _selectedBatchId == null
                      ? colorScheme.onSurfaceVariant
                      : colorScheme.onSurface,
                ),
              ),
              subtitle: _file == null
                  ? Text(
                      _selectedBatchId == null
                          ? 'Select a batch first'
                          : 'Tap to select CSV file',
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    )
                  : Text(
                      'Size: ${(_file!.lengthSync() / 1024).toStringAsFixed(2)} KB',
                    ),
              trailing: IconButton(
                icon: const Icon(Icons.upload_file),
                onPressed: _selectedBatchId == null ? null : _pickFile,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          importState.when(
            data: (result) {
              if (result == null) return const SizedBox();

              final imported = result['imported'] ?? 0;
              final skipped = result['skipped'] ?? 0;
              final errors = result['errors'] as List<dynamic>? ?? [];

              return Card(
                color: imported > 0
                    ? colorScheme.tertiaryContainer
                    : colorScheme.secondaryContainer,
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            imported > 0 ? Icons.check_circle : Icons.warning,
                            color: imported > 0
                                ? colorScheme.onTertiaryContainer
                                : colorScheme.onSecondaryContainer,
                            size: 28,
                          ),
                          const SizedBox(width: AppSpacing.smd),
                          Text(
                            imported > 0
                                ? 'Import Complete!'
                                : 'Import Completed with Issues',
                            style: textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: imported > 0
                                  ? colorScheme.onTertiaryContainer
                                  : colorScheme.onSecondaryContainer,
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: AppSpacing.lg),
                      _buildResultRow(
                        context,
                        icon: Icons.person_add,
                        label: 'Students Imported',
                        value: imported.toString(),
                        color: colorScheme.tertiary,
                      ),
                      if (skipped > 0) ...[
                        const SizedBox(height: AppSpacing.sm),
                        _buildResultRow(
                          context,
                          icon: Icons.error_outline,
                          label: 'Rows Failed',
                          value: skipped.toString(),
                          color: colorScheme.error,
                        ),
                      ],
                      if (errors.isNotEmpty) ...[
                        const SizedBox(height: AppSpacing.md),
                        Text(
                          'Errors:',
                          style: textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: colorScheme.error,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        ...errors.take(5).map((e) {
                          final error = e as Map<String, dynamic>;
                          return Padding(
                            padding:
                                const EdgeInsets.only(bottom: AppSpacing.xs),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: colorScheme.errorContainer,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    'Row ${error['row']}',
                                    style: textTheme.labelSmall?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: colorScheme.onErrorContainer,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: AppSpacing.sm),
                                Expanded(
                                  child: Text(
                                    '${error['studentId']}: ${error['error']}',
                                    style: textTheme.bodySmall,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                        if (errors.length > 5)
                          Text(
                            '... and ${errors.length - 5} more errors',
                            style: textTheme.labelSmall?.copyWith(
                              fontStyle: FontStyle.italic,
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                      ],
                    ],
                  ),
                ),
              );
            },
            loading: () => Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Text('Importing students...', style: textTheme.bodyMedium),
                  ],
                ),
              ),
            ),
            error: (error, stack) => Card(
              color: colorScheme.errorContainer,
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Row(
                  children: [
                    Icon(Icons.error_outline,
                        color: colorScheme.onErrorContainer, size: 28),
                    const SizedBox(width: AppSpacing.smd),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Import Failed',
                            style: textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            error.toString(),
                            style: textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          AppButton.filled(
            text: 'Import Students',
            onPressed: _canImport && !importState.isLoading ? _upload : null,
            isLoading: importState.isLoading,
            icon: Icons.cloud_upload_outlined,
          ),
        ],
      ),
    );
  }

  bool get _canImport => _selectedBatchId != null && _file != null;

  Widget _buildResultRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Icon(icon, size: 20, color: color),
        const SizedBox(width: AppSpacing.sm),
        Text(label, style: textTheme.bodyMedium),
        const Spacer(),
        Text(
          value,
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv'],
      allowMultiple: false,
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        _file = File(result.files.single.path!);
      });
      ref.read(importStudentsProvider.notifier).reset();
    }
  }

  Future<void> _upload() async {
    if (!_canImport) return;

    final success = await ref
        .read(importStudentsProvider.notifier)
        .importCSV(_selectedBatchId!, _file!);

    if (mounted && success) {
      SnackbarUtils.showSuccess(
        context,
        'Students imported successfully to batch!',
      );

      ref.invalidate(batchesProvider);
    }
  }
}
