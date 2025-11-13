import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../../core/config/theme/app_colors.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../core/utils/snackbar_utils.dart';
import '../../../../../core/utils/validators.dart';
import '../../../dashboard/data/models/teacher_dashboard_model.dart';
import '../../../dashboard/presentation/providers/dashboard_provider.dart';
import '../../data/models/attendance_session_model.dart';
import '../providers/attendance_provider.dart';

class CreateSessionScreen extends ConsumerStatefulWidget {
  const CreateSessionScreen({super.key});

  @override
  ConsumerState<CreateSessionScreen> createState() =>
      _CreateSessionScreenState();
}

class _CreateSessionScreenState extends ConsumerState<CreateSessionScreen> {
  final _formKey = GlobalKey<FormState>();
  
  EnrollmentInfo? _selectedEnrollment;
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _startTime = TimeOfDay.now();
  TimeOfDay _endTime = TimeOfDay.now().replacing(hour: TimeOfDay.now().hour + 1);
  String _sessionType = 'REGULAR';

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final dashboardState = ref.watch(teacherDashboardProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Attendance Session'),
      ),
      body: dashboardState.when(
        initial: () => const Center(child: CircularProgressIndicator()),
        loading: () => const Center(child: CircularProgressIndicator()),
        loaded: (data) => _buildForm(context, data.enrollments),
        error: (message) => Center(child: Text('Error: $message')),
      ),
    );
  }

  Widget _buildForm(BuildContext context, List<EnrollmentInfo> enrollments) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Select Enrollment
            const Text(
              'Select Subject',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<EnrollmentInfo>(
              value: _selectedEnrollment,
              decoration: InputDecoration(
                hintText: 'Choose subject and batch',
                prefixIcon: const Icon(Icons.book),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              items: enrollments.map((enrollment) {
                return DropdownMenuItem(
                  value: enrollment,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${enrollment.subject.code} - ${enrollment.subject.name}',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        enrollment.batch.code,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
              onChanged: _isLoading
                  ? null
                  : (value) {
                      setState(() => _selectedEnrollment = value);
                    },
              validator: (value) {
                if (value == null) return 'Please select a subject';
                return null;
              },
            ),

            const SizedBox(height: 24),

            // Select Date
            const Text(
              'Date',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: _isLoading ? null : () => _selectDate(context),
              child: InputDecorator(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.calendar_today),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  DateFormat('dd MMM yyyy').format(_selectedDate),
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Time Row
            Row(
              children: [
                // Start Time
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Start Time',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      InkWell(
                        onTap: _isLoading ? null : () => _selectStartTime(context),
                        child: InputDecorator(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.access_time),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            _startTime.format(context),
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 16),

                // End Time
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'End Time',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      InkWell(
                        onTap: _isLoading ? null : () => _selectEndTime(context),
                        child: InputDecorator(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.access_time),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            _endTime.format(context),
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Session Type
            const Text(
              'Session Type',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            SegmentedButton<String>(
              segments: const [
                ButtonSegment(
                  value: 'REGULAR',
                  label: Text('Regular'),
                  icon: Icon(Icons.event, size: 16),
                ),
                ButtonSegment(
                  value: 'MAKEUP',
                  label: Text('Makeup'),
                  icon: Icon(Icons.event_repeat, size: 16),
                ),
                ButtonSegment(
                  value: 'EXTRA',
                  label: Text('Extra'),
                  icon: Icon(Icons.event_available, size: 16),
                ),
              ],
              selected: {_sessionType},
              onSelectionChanged: _isLoading
                  ? null
                  : (Set<String> selected) {
                      setState(() => _sessionType = selected.first);
                    },
            ),

            const SizedBox(height: 32),

            // Create Button
            AppButton(
              text: 'Create Session',
              onPressed: _isLoading ? null : _handleCreateSession,
              isLoading: _isLoading,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now().subtract(const Duration(days: 30)),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() => _selectedDate = picked);
    }
  }

  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _startTime,
    );

    if (picked != null && picked != _startTime) {
      setState(() {
        _startTime = picked;
        // Auto-adjust end time if needed
        if (_endTime.hour <= _startTime.hour) {
          _endTime = TimeOfDay(
            hour: (_startTime.hour + 1) % 24,
            minute: _startTime.minute,
          );
        }
      });
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _endTime,
    );

    if (picked != null && picked != _endTime) {
      // Validate end time is after start time
      final startMinutes = _startTime.hour * 60 + _startTime.minute;
      final endMinutes = picked.hour * 60 + picked.minute;

      if (endMinutes <= startMinutes) {
        SnackbarUtils.showError(
          context,
          'End time must be after start time',
        );
        return;
      }

      setState(() => _endTime = picked);
    }
  }

  Future<void> _handleCreateSession() async {
    if (!_formKey.currentState!.validate()) return;

    if (_selectedEnrollment == null) {
      SnackbarUtils.showError(context, 'Please select a subject');
      return;
    }

    setState(() => _isLoading = true);

    final request = CreateSessionRequest(
      subjectEnrollmentId: _selectedEnrollment!.id,
      date: DateFormat('yyyy-MM-dd').format(_selectedDate),
      startTime: '${_startTime.hour.toString().padLeft(2, '0')}:'
          '${_startTime.minute.toString().padLeft(2, '0')}:00',
      endTime: '${_endTime.hour.toString().padLeft(2, '0')}:'
          '${_endTime.minute.toString().padLeft(2, '0')}:00',
      type: _sessionType,
    );

    final success = await ref
        .read(createSessionProvider.notifier)
        .createSession(request);

    if (mounted) {
      setState(() => _isLoading = false);

      if (success) {
        SnackbarUtils.showSuccess(
          context,
          'Session created successfully!',
        );

        // Get session ID from response
        final sessionData = ref.read(createSessionProvider).value;
        final sessionId = sessionData?['id'];

        if (sessionId != null) {
          // Navigate to mark attendance screen
          context.pushReplacement(
            '/teacher/mark-attendance/$sessionId',
          );
        } else {
          context.pop();
        }
      } else {
        final error = ref.read(createSessionProvider).error;
        SnackbarUtils.showError(
          context,
          error?.toString() ?? 'Failed to create session',
        );
      }
    }
  }
}
