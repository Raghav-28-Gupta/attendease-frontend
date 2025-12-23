import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/config/theme/app_colors.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../../../../core/utils/snackbar_utils.dart';
import '../../../enrollment/presentation/providers/enrollment_provider.dart';
import '../../data/models/timetable_model.dart';
import '../providers/timetable_provider.dart';

class CreateTimetableScreen extends ConsumerStatefulWidget {
  final TimetableEntryModel? entry; // null for create, non-null for edit

  const CreateTimetableScreen({
    super.key,
    this.entry,
  });

  @override
  ConsumerState<CreateTimetableScreen> createState() =>
      _CreateTimetableScreenState();
}

class _CreateTimetableScreenState extends ConsumerState<CreateTimetableScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _roomController;
  
  String? _selectedEnrollmentId;
  String _selectedDay = 'MONDAY';
  TimeOfDay _startTime = const TimeOfDay(hour: 9, minute: 0);
  TimeOfDay _endTime = const TimeOfDay(hour: 10, minute: 0);
  bool _isSubmitting = false;

  final List<String> _days = [
    'MONDAY',
    'TUESDAY',
    'WEDNESDAY',
    'THURSDAY',
    'FRIDAY',
    'SATURDAY',
    'SUNDAY'
  ];

  bool get isEditing => widget.entry != null;

  @override
  void initState() {
    super.initState();
    _roomController = TextEditingController(text: widget.entry?.room ?? '');
    
    if (widget.entry != null) {
      _selectedEnrollmentId = widget.entry!.enrollmentId;
      _selectedDay = widget.entry!.dayOfWeek;
      _startTime = _parseTime(widget.entry!.startTime);
      _endTime = _parseTime(widget.entry!.endTime);
    }
  }

  @override
  void dispose() {
    _roomController.dispose();
    super.dispose();
  }

  TimeOfDay _parseTime(String time) {
    final parts = time.split(':');
    return TimeOfDay(
      hour: int.parse(parts[0]),
      minute: int.parse(parts[1]),
    );
  }

  String _formatTimeOfDay(TimeOfDay time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:00';
  }

  @override
  Widget build(BuildContext context) {
    final enrollmentsAsync = ref.watch(myEnrollmentsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Timetable Entry' : 'Create Timetable Entry'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Enrollment Selection
            if (!isEditing)
              enrollmentsAsync.when(
                data: (enrollments) {
                  if (enrollments.isEmpty) {
                    return Card(
                      color: AppColors.warning.withOpacity(0.1),
                      child: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'No enrollments available. Create enrollments first.',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }

                  return DropdownButtonFormField<String>(
                    value: _selectedEnrollmentId,
                    decoration: const InputDecoration(
                      labelText: 'Select Class',
                      prefixIcon: Icon(Icons.class_),
                      border: OutlineInputBorder(),
                    ),
                    items: enrollments.map((enrollment) {
                      return DropdownMenuItem(
                        value: enrollment.id,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              enrollment.subject.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              '${enrollment.subject.code} • ${enrollment.batch.code}',
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
                      setState(() => _selectedEnrollmentId = value);
                    },
                    validator: (value) {
                      if (value == null) return 'Please select an enrollment';
                      return null;
                    },
                  );
                },
                loading: () => const LinearProgressIndicator(),
                error: (error, stack) => Text('Error: $error'),
              )
            else
              Card(
                child: ListTile(
                  leading: const Icon(Icons.class_),
                  title: Text(widget.entry!.enrollment.subject.name),
                  subtitle: Text(
                    '${widget.entry!.enrollment.subject.code} • ${widget.entry!.enrollment.batch.code}',
                  ),
                ),
              ),

            const SizedBox(height: 16),

            // Day Selection
            DropdownButtonFormField<String>(
              value: _selectedDay,
              decoration: const InputDecoration(
                labelText: 'Day of Week',
                prefixIcon: Icon(Icons.calendar_today),
                border: OutlineInputBorder(),
              ),
              items: _days.map((day) {
                return DropdownMenuItem(
                  value: day,
                  child: Text(_formatDayName(day)),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() => _selectedDay = value);
                }
              },
            ),

            const SizedBox(height: 16),

            // Start Time
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.access_time),
              title: const Text('Start Time'),
              subtitle: Text(_formatTimeOfDay(_startTime)),
              trailing: const Icon(Icons.edit),
              onTap: () async {
                final time = await showTimePicker(
                  context: context,
                  initialTime: _startTime,
                );
                if (time != null) {
                  setState(() => _startTime = time);
                }
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(color: AppColors.border),
              ),
            ),

            const SizedBox(height: 16),

            // End Time
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.access_time),
              title: const Text('End Time'),
              subtitle: Text(_formatTimeOfDay(_endTime)),
              trailing: const Icon(Icons.edit),
              onTap: () async {
                final time = await showTimePicker(
                  context: context,
                  initialTime: _endTime,
                );
                if (time != null) {
                  setState(() => _endTime = time);
                }
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(color: AppColors.border),
              ),
            ),

            const SizedBox(height: 16),

            // Room (Optional)
            AppTextField(
              controller: _roomController,
              label: 'Room (Optional)',
              hint: 'e.g., A-101',
              prefixIcon: Icons.room,
              textCapitalization: TextCapitalization.words,
            ),

            const SizedBox(height: 32),

            // Submit Button
            AppButton(
              text: isEditing ? 'Update Entry' : 'Create Entry',
              onPressed: _isSubmitting ? null : _handleSubmit,
              isLoading: _isSubmitting,
            ),
          ],
        ),
      ),
    );
  }

  String _formatDayName(String day) {
    return day[0].toUpperCase() + day.substring(1).toLowerCase();
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    // Validate times
    if (_endTime.hour < _startTime.hour ||
        (_endTime.hour == _startTime.hour &&
            _endTime.minute <= _startTime.minute)) {
      SnackbarUtils.showError(
        context,
        'End time must be after start time',
      );
      return;
    }

    setState(() => _isSubmitting = true);

    bool success;

    if (isEditing) {
      // Update existing entry
      final request = UpdateTimetableEntryRequest(
        dayOfWeek: _selectedDay,
        startTime: _formatTimeOfDay(_startTime),
        endTime: _formatTimeOfDay(_endTime),
        room: _roomController.text.trim().isEmpty
            ? null
            : _roomController.text.trim(),
      );

      success = await ref
          .read(timetableOperationsProvider.notifier)
          .updateEntry(widget.entry!.id, request);
    } else {
      // Create new entry
      if (_selectedEnrollmentId == null) {
        SnackbarUtils.showError(context, 'Please select an enrollment');
        setState(() => _isSubmitting = false);
        return;
      }

      final request = CreateTimetableEntryRequest(
        enrollmentId: _selectedEnrollmentId!,
        dayOfWeek: _selectedDay,
        startTime: _formatTimeOfDay(_startTime),
        endTime: _formatTimeOfDay(_endTime),
        room: _roomController.text.trim().isEmpty
            ? null
            : _roomController.text.trim(),
      );

      success = await ref
          .read(timetableOperationsProvider.notifier)
          .createEntry(request);
    }

    if (mounted) {
      setState(() => _isSubmitting = false);

      if (success) {
        SnackbarUtils.showSuccess(
          context,
          isEditing
              ? 'Timetable entry updated!'
              : 'Timetable entry created!',
        );
        context.pop();
      } else {
        final error = ref.read(timetableOperationsProvider).error;
        SnackbarUtils.showError(
          context,
          error?.toString() ?? 'Operation failed',
        );
      }
    }
  }
}
