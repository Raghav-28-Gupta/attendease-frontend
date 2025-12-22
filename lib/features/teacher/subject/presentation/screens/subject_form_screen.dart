import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../core/config/theme/app_colors.dart';
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
  late TextEditingController _creditController; // ✅ ADD THIS
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
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Subject' : 'Create Subject'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            AppTextField(
              controller: _codeController,
              label: 'Subject Code',
              hint: 'e.g., CS101',
              prefixIcon: Icons.label,
              validator: Validators.required,
              textCapitalization: TextCapitalization.characters,
            ),

            AppTextField(
              controller: _creditController,
              label: 'Credits',
              hint: 'e.g., 3 or 4.5',
              prefixIcon: Icons.star,
              validator: (value) {
                if (value?.isEmpty ?? true) return 'Required';
                final credits = double.tryParse(value!);
                if (credits == null || credits <= 0) {
                  return 'Enter valid credit hours';
                }
                return null;
              },
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,1}')),
              ],
              textCapitalization: TextCapitalization.none,
            ),
            const SizedBox(height: 16),

            AppTextField(
              controller: _departmentController,
              label: 'Department',
              hint: 'e.g., Computer Science',
              prefixIcon: Icons.business,
              validator: Validators.required,
              textCapitalization: TextCapitalization.words,
            ),
            const SizedBox(height: 16),

            AppTextField(
              controller: _nameController,
              label: 'Subject Name',
              hint: 'e.g., Data Structures',
              prefixIcon: Icons.book,
              validator: Validators.required,
              textCapitalization: TextCapitalization.characters,
            ),
            const SizedBox(height: 16),

            // Semester Dropdown
            DropdownButtonFormField<String>(
              value: _selectedSemester,
              decoration: const InputDecoration(
                labelText: 'Semester',
                prefixIcon: Icon(Icons.calendar_today),
                border: OutlineInputBorder(),
              ),
              items: _semesters.map((semester) {
                return DropdownMenuItem(
                  value: semester,
                  child: Text('Semester $semester'),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() => _selectedSemester = value);
                }
              },
              validator: Validators.required,
            ),
            const SizedBox(height: 16),
            AppTextField(
              controller: _descriptionController,
              label: 'Description (Optional)',
              hint: 'Additional information about the subject',
              prefixIcon: Icons.description,
              maxLines: 3,
              textCapitalization: TextCapitalization.words,
            ),
            const SizedBox(height: 32),
            AppButton(
              text: isEditing ? 'Update Subject' : 'Create Subject',
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
