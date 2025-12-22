import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/config/theme/app_colors.dart';
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
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Instructions Card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.info_outline, color: AppColors.primary),
                      SizedBox(width: 8),
                      Text(
                        'CSV Format Instructions',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Required CSV headers:',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: const Text(
                      'student_id,first_name,last_name,email,phone',
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'monospace',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Example CSV content:',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: const Text(
                      'student_id,first_name,last_name,email,phone\n'
                      '2024001,John,Doe,john@college.edu,9876543210\n'
                      '2024002,Jane,Smith,jane@college.edu,9876543211',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'monospace',
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.info.withAlpha((0.1 * 255).round()),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppColors.info.withAlpha((0.3 * 255).round()),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.info,
                          color: AppColors.info,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Phone is optional. Header row is required.',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.blue[900],
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

          const SizedBox(height: 24),

          // Step 1: Select Batch
          const Text(
            'Step 1: Select Batch',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),

          batchesAsync.when(
            data: (batches) {
              if (batches.isEmpty) {
                return Card(
                  color: AppColors.error.withAlpha((0.1 * 255).round()),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.error_outline,
                          color: AppColors.error,
                          size: 40,
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'No Batches Available',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Please create a batch first before importing students.',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        AppButton(
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
                initialValue: _selectedBatchId,
                decoration: const InputDecoration(
                  labelText: 'Select Batch',
                  prefixIcon: Icon(Icons.school),
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
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '${batch.code} • ${batch.academicYear} • ${batch.studentCount} students',
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary,
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
              color: AppColors.error.withAlpha((0.1 * 255).round()),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    const Icon(Icons.error, color: AppColors.error),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Failed to load batches: ${error.toString()}',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Step 2: Select File
          const Text(
            'Step 2: Select CSV File',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),

          Card(
            child: ListTile(
              enabled: _selectedBatchId != null,
              leading: Icon(
                Icons.description,
                size: 32,
                color: _selectedBatchId == null
                    ? AppColors.textSecondary
                    : AppColors.primary,
              ),
              title: Text(
                _file == null
                    ? 'No file selected'
                    : _file!.path.split('/').last,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: _selectedBatchId == null
                      ? AppColors.textSecondary
                      : AppColors.textPrimary,
                ),
              ),
              subtitle: _file == null
                  ? Text(
                      _selectedBatchId == null
                          ? 'Select a batch first'
                          : 'Tap to select CSV file',
                      style: TextStyle(
                        color: _selectedBatchId == null
                            ? AppColors.textSecondary
                            : AppColors.textSecondary,
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

          const SizedBox(height: 16),

          // Import Results
          importState.when(
            data: (result) {
              if (result == null) return const SizedBox();

              final imported = result['imported'] ?? 0;
              final skipped = result['skipped'] ?? 0;
              final errors = result['errors'] as List<dynamic>? ?? [];

              return Card(
                color: imported > 0 
                    ? AppColors.success.withAlpha((0.1 * 255).round())
                    : AppColors.warning.withAlpha((0.1 * 255).round()),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            imported > 0 ? Icons.check_circle : Icons.warning,
                            color: imported > 0 ? AppColors.success : AppColors.warning,
                            size: 28,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            imported > 0 ? 'Import Complete!' : 'Import Completed with Issues',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: imported > 0 ? AppColors.success : AppColors.warning,
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: 24),
                      _buildResultRow(
                        icon: Icons.person_add,
                        label: 'Students Imported',
                        value: imported.toString(),
                        color: AppColors.success,
                      ),
                      if (skipped > 0) ...[
                        const SizedBox(height: 8),
                        _buildResultRow(
                          icon: Icons.error_outline,
                          label: 'Rows Failed',
                          value: skipped.toString(),
                          color: AppColors.error,
                        ),
                      ],
                      if (errors.isNotEmpty) ...[
                        const SizedBox(height: 16),
                        const Text(
                          'Errors:',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: AppColors.error,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ...errors.take(5).map((e) {
                          // ✅ Backend error format: { row: number, studentId: string, error: string }
                          final error = e as Map<String, dynamic>;
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.error.withAlpha((0.1 * 255).round()),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    'Row ${error['row']}',
                                    style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.error,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    '${error['studentId']}: ${error['error']}',
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                        if (errors.length > 5)
                          Text(
                            '... and ${errors.length - 5} more errors',
                            style: const TextStyle(
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              color: AppColors.textSecondary,
                            ),
                          ),
                      ],
                    ],
                  ),
                ),
              );
            },
            loading: () => const Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                    SizedBox(width: 16),
                    Text('Importing students...'),
                  ],
                ),
              ),
            ),
            error: (error, stack) => Card(
              color: AppColors.error.withAlpha((0.1 * 255).round()),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Icon(Icons.error, color: AppColors.error, size: 28),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Import Failed',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            error.toString(),
                            style: const TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Import Button
          AppButton(
            text: 'Import Students',
            onPressed: _canImport && !importState.isLoading ? _upload : null,
            isLoading: importState.isLoading,
            icon: Icons.cloud_upload,
          ),
        ],
      ),
    );
  }

  bool get _canImport => _selectedBatchId != null && _file != null;

  Widget _buildResultRow({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Row(
      children: [
        Icon(icon, size: 20, color: color),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 14),
        ),
        const Spacer(),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
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

      // Refresh batches to update student count
      ref.invalidate(batchesProvider);
    }
  }
}