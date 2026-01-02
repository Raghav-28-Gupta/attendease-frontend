import 'package:attendease_frontend/core/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../../core/config/theme/app_spacing.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/utils/snackbar_utils.dart';
import '../../../enrollment/presentation/providers/enrollment_provider.dart';
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

  String? _selectedEnrollmentId;
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _startTime = TimeOfDay.now();
  TimeOfDay _endTime =
      TimeOfDay.now().replacing(hour: TimeOfDay.now().hour + 1);
  String _sessionType = 'REGULAR';

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final enrollmentsAsync = ref.watch(myEnrollmentsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Attendance Session'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Select Class',
                style: textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              enrollmentsAsync.when(
                data: (enrollments) {
                  if (enrollments.isEmpty) {
                    return Card(
                      color: colorScheme.secondaryContainer,
                      child: Padding(
                        padding: const EdgeInsets.all(AppSpacing.md),
                        child: Column(
                          children: [
                            Icon(
                              Icons.warning_amber_outlined,
                              color: colorScheme.onSecondaryContainer,
                              size: 40,
                            ),
                            const SizedBox(height: AppSpacing.smd),
                            Text(
                              'No Enrollments Available',
                              style: textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: AppSpacing.sm),
                            Text(
                              'You need to enroll batches to subjects first before creating attendance sessions.',
                              textAlign: TextAlign.center,
                              style: textTheme.bodyMedium,
                            ),
                            const SizedBox(height: AppSpacing.md),
                            AppButton.tonal(
                              text: 'Create Enrollment',
                              onPressed: () {
                                context.push('/teacher/enrollments/create');
                              },
                              icon: Icons.add,
                            ),
                          ],
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
                      helperText: 'Choose subject and batch combination',
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
                              style: textTheme.labelLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '${enrollment.subject.code} • ${enrollment.batch.name}',
                              style: textTheme.labelSmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: _isLoading
                        ? null
                        : (value) {
                            setState(() => _selectedEnrollmentId = value);
                          },
                    validator: (value) {
                      if (value == null) return 'Please select an enrollment';
                      return null;
                    },
                  );
                },
                loading: () => Container(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    border: Border.all(color: colorScheme.outline),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                      const SizedBox(width: AppSpacing.smd),
                      Text(
                        'Loading enrollments...',
                        style: textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                error: (error, stack) => Card(
                  color: colorScheme.errorContainer,
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.smd),
                    child: Row(
                      children: [
                        Icon(Icons.error_outline,
                            color: colorScheme.onErrorContainer),
                        const SizedBox(width: AppSpacing.sm),
                        Expanded(
                          child: Text(
                            'Failed to load enrollments: ${error.toString()}',
                            style: textTheme.labelMedium?.copyWith(
                              color: colorScheme.onErrorContainer,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                'Date',
                style: textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
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
                    style: textTheme.bodyLarge,
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Start Time',
                          style: textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        InkWell(
                          onTap: _isLoading
                              ? null
                              : () => _selectStartTime(context),
                          child: InputDecorator(
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.access_time),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              _startTime.format(context),
                              style: textTheme.bodyLarge,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'End Time',
                          style: textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        InkWell(
                          onTap:
                              _isLoading ? null : () => _selectEndTime(context),
                          child: InputDecorator(
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.access_time),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              _endTime.format(context),
                              style: textTheme.bodyLarge,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                'Session Type',
                style: textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
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
              const SizedBox(height: AppSpacing.xl),
              AppButton.filled(
                text: 'Create Session',
                onPressed: _isLoading ? null : _handleCreateSession,
                isLoading: _isLoading,
              ),
            ],
          ),
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

    if (_selectedEnrollmentId == null) {
      SnackbarUtils.showError(context, 'Please select a class');
      return;
    }

    setState(() => _isLoading = true);

    final request = CreateSessionRequest(
      subjectEnrollmentId: _selectedEnrollmentId!,
      date: DateFormat('yyyy-MM-dd').format(_selectedDate),
      startTime: '${_startTime.hour.toString().padLeft(2, '0')}:'
          '${_startTime.minute.toString().padLeft(2, '0')}:00',
      endTime: '${_endTime.hour.toString().padLeft(2, '0')}:'
          '${_endTime.minute.toString().padLeft(2, '0')}:00',
      type: _sessionType,
    );

    AppLogger.info(
      '📝 Creating session: '
      'enrollment=$_selectedEnrollmentId, '
      'date=${request.date}, '
      'time=${request.startTime} - ${request.endTime}',
    );

    final success =
        await ref.read(createSessionProvider.notifier).createSession(request);

    if (mounted) {
      setState(() => _isLoading = false);

      if (success) {
        SnackbarUtils.showSuccess(
          context,
          'Session created successfully!',
        );

        final sessionData = ref.read(createSessionProvider).value;
        final sessionId = sessionData?['id'];

        if (sessionId != null) {
          context.pushReplacement('/teacher/mark-attendance/$sessionId');
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
