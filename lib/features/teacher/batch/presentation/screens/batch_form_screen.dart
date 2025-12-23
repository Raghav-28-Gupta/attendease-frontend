import 'package:attendease_frontend/core/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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

  bool get isEditing => widget.batch != null;

  @override
  void initState() {
    super.initState();
    _codeController = TextEditingController(text: widget.batch?.code ?? '');
    _nameController = TextEditingController(text: widget.batch?.name ?? '');
    _academicYearController = TextEditingController(
      text: widget.batch?.academicYear ?? DateTime.now().year.toString(),
    );
    _departmentController = TextEditingController(text: widget.batch?.department ?? '',);
    _descriptionController = TextEditingController(
      text: widget.batch?.description ?? '',
    );
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
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Batch' : 'Create Batch'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            AppTextField(
              controller: _codeController,
              label: 'Batch Code',
              hint: 'e.g., CS-2024-A',
              prefixIcon: Icons.label,
              validator: Validators.required,
              textCapitalization: TextCapitalization.characters,
            ),
            const SizedBox(height: 16),
            AppTextField(
              controller: _nameController,
              label: 'Batch Name',
              hint: 'e.g., Computer Science 2024',
              prefixIcon: Icons.school,
              validator: Validators.required,
              textCapitalization: TextCapitalization.words,
            ),
            const SizedBox(height: 16),
            AppTextField(
              controller: _academicYearController,
              label: 'Academic Year',
              hint: 'e.g., 2024-2025',
              prefixIcon: Icons.calendar_today,
              validator: Validators.required,
              textCapitalization: TextCapitalization.none,
            ),
            AppTextField(
              controller: _departmentController,
              label: 'Department (Optional)',
              hint: 'e.g., Computer Science',
              prefixIcon: Icons.business,
              textCapitalization: TextCapitalization.words,
            ),
            const SizedBox(height: 16),
            AppTextField(
              controller: _descriptionController,
              label: 'Description (Optional)',
              hint: 'Additional information about the batch',
              prefixIcon: Icons.description,
              maxLines: 3,
              textCapitalization: TextCapitalization.sentences,
            ),
            const SizedBox(height: 32),
            AppButton(
              text: isEditing ? 'Update Batch' : 'Create Batch',
              onPressed: _isSubmitting ? null : _handleSubmit,
              isLoading: _isSubmitting,
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
        academicYear: _academicYearController.text.trim(),
        department: _departmentController.text.trim().isEmpty  // ✅ ADD department
            ? null
            : _departmentController.text.trim(),
        description: _descriptionController.text.trim().isEmpty
            ? null
            : _descriptionController.text.trim(),
      );

      AppLogger.info('CreateBatch payload: ${request.toJson()}');
      success = await ref
          .read(batchOperationsProvider.notifier)
          .updateBatch(widget.batch!.id, request);
    } else {
      // Create new batch
      final request = CreateBatchRequest(
        code: _codeController.text.trim(),
        name: _nameController.text.trim(),
        academicYear: _academicYearController.text.trim(),
        department: _departmentController.text.trim().isEmpty  // ✅ ADD department
            ? null
            : _departmentController.text.trim(),
        description: _descriptionController.text.trim().isEmpty
            ? null
            : _descriptionController.text.trim(),
      );

      success = await ref
          .read(batchOperationsProvider.notifier)
          .createBatch(request);
    }

    if (mounted) {
      setState(() => _isSubmitting = false);

      if (success) {
        SnackbarUtils.showSuccess(
          context,
          isEditing ? 'Batch updated successfully!' : 'Batch created successfully!',
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
