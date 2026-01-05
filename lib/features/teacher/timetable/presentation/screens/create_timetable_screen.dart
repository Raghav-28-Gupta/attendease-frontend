import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/config/theme/app_spacing.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../core/utils/snackbar_utils.dart';
import '../../../enrollment/presentation/providers/enrollment_provider.dart';
import '../../data/models/timetable_model.dart';
import '../providers/timetable_provider.dart';

class CreateTimetableScreen extends ConsumerStatefulWidget {
  final TimetableEntryModel? entry;

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

  final List<Map<String, dynamic>> _days = [
    {'value': 'MONDAY', 'icon': Icons.looks_one},
    {'value': 'TUESDAY', 'icon': Icons.looks_two},
    {'value': 'WEDNESDAY', 'icon': Icons.looks_3},
    {'value': 'THURSDAY', 'icon': Icons.looks_4},
    {'value': 'FRIDAY', 'icon': Icons.looks_5},
    {'value': 'SATURDAY', 'icon': Icons.looks_6},
    {'value': 'SUNDAY', 'icon': Icons.weekend},
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
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final enrollmentsAsync = ref.watch(myEnrollmentsProvider);

    return Scaffold(
      appBar: AppBar(
        title:
            Text(isEditing ? 'Edit Timetable Entry' : 'Create Timetable Entry'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.md),
          children: [
            // Section: Class Selection
            Text(
              'Class',
              style: textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),

            if (!isEditing)
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
                              'Create enrollments first before adding timetable entries.',
                              textAlign: TextAlign.center,
                              style: textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onSecondaryContainer,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  return InkWell(
                    onTap: _isSubmitting
                        ? null
                        : () => _showClassSelectionSheet(context, enrollments),
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
                            Icons.class_,
                            color: colorScheme.primary,
                          ),
                          const SizedBox(width: AppSpacing.md),
                          Expanded(
                            child: _selectedEnrollmentId == null
                                ? Text(
                                    'Select Class',
                                    style: textTheme.bodyLarge?.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                  )
                                : Builder(builder: (context) {
                                    final enrollment = enrollments.firstWhere(
                                      (e) => e.id == _selectedEnrollmentId,
                                    );
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          enrollment.subject.name,
                                          style: textTheme.bodyLarge?.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          '${enrollment.subject.code} • ${enrollment.batch.name}',
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
                  );
                },
                loading: () => Container(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    border: Border.all(color: colorScheme.outline),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                      const SizedBox(width: AppSpacing.smd),
                      Text('Loading enrollments...',
                          style: textTheme.bodyMedium),
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
                            'Error: $error',
                            style: textTheme.labelMedium?.copyWith(
                              color: colorScheme.onErrorContainer,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            else
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.class_outlined,
                          color: colorScheme.onPrimaryContainer,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.entry!.enrollment.subject.name,
                              style: textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '${widget.entry!.enrollment.subject.code} • ${widget.entry!.enrollment.batch.code}',
                              style: textTheme.labelSmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: colorScheme.tertiaryContainer,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          'Editing',
                          style: textTheme.labelSmall?.copyWith(
                            color: colorScheme.onTertiaryContainer,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            const SizedBox(height: AppSpacing.lg),

            // Section: Day Selection
            Text(
              'Day of Week',
              style: textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            InkWell(
              onTap:
                  _isSubmitting ? null : () => _showDaySelectionSheet(context),
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
                      Icons.calendar_today_outlined,
                      color: colorScheme.primary,
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Text(
                        _formatDayName(_selectedDay),
                        style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
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

            const SizedBox(height: AppSpacing.lg),

            // Section: Time Selection
            Text(
              'Time',
              style: textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Row(
              children: [
                // Start Time
                Expanded(
                  child: InkWell(
                    onTap: _isSubmitting
                        ? null
                        : () async {
                            final time = await showTimePicker(
                              context: context,
                              initialTime: _startTime,
                            );
                            if (time != null) {
                              setState(() => _startTime = time);
                            }
                          },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      decoration: BoxDecoration(
                        border: Border.all(color: colorScheme.outline),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Start',
                            style: textTheme.labelSmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                Icons.play_arrow,
                                size: 20,
                                color: colorScheme.tertiary,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                _startTime.format(context),
                                style: textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                // End Time
                Expanded(
                  child: InkWell(
                    onTap: _isSubmitting
                        ? null
                        : () async {
                            final time = await showTimePicker(
                              context: context,
                              initialTime: _endTime,
                            );
                            if (time != null) {
                              setState(() => _endTime = time);
                            }
                          },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      decoration: BoxDecoration(
                        border: Border.all(color: colorScheme.outline),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'End',
                            style: textTheme.labelSmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                Icons.stop,
                                size: 20,
                                color: colorScheme.secondary,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                _endTime.format(context),
                                style: textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppSpacing.lg),

            // Section: Room
            Text(
              'Room (Optional)',
              style: textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            AppTextField(
              controller: _roomController,
              label: '',
              hint: 'e.g., A-101',
              prefixIcon: Icons.room_outlined,
              textCapitalization: TextCapitalization.words,
            ),

            const SizedBox(height: AppSpacing.xl),

            // Submit Button
            AppButton.filled(
              text: isEditing ? 'Update Entry' : 'Create Entry',
              onPressed: _isSubmitting ? null : _handleSubmit,
              isLoading: _isSubmitting,
              icon: isEditing ? Icons.save_outlined : Icons.add_circle_outline,
            ),
          ],
        ),
      ),
    );
  }

  void _showClassSelectionSheet(
      BuildContext context, List<dynamic> enrollments) {
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
                  Icon(Icons.class_, color: colorScheme.primary),
                  const SizedBox(width: AppSpacing.smd),
                  Text(
                    'Select Class',
                    style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: colorScheme.outlineVariant),

            // Class List
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                itemCount: enrollments.length,
                itemBuilder: (context, index) {
                  final enrollment = enrollments[index];
                  final isSelected = enrollment.id == _selectedEnrollmentId;

                  return Card(
                    margin: const EdgeInsets.only(bottom: AppSpacing.smd),
                    color: isSelected
                        ? colorScheme.primaryContainer
                        : colorScheme.surfaceContainerLow,
                    child: InkWell(
                      onTap: () {
                        setState(() => _selectedEnrollmentId = enrollment.id);
                        Navigator.pop(context);
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Padding(
                        padding: const EdgeInsets.all(AppSpacing.md),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? colorScheme.primary
                                    : colorScheme.primaryContainer,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                Icons.class_outlined,
                                color: isSelected
                                    ? colorScheme.onPrimary
                                    : colorScheme.onPrimaryContainer,
                              ),
                            ),
                            const SizedBox(width: AppSpacing.md),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    enrollment.subject.name,
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
                                        enrollment.subject.code,
                                        Icons.tag,
                                        isSelected,
                                      ),
                                      const SizedBox(width: AppSpacing.sm),
                                      Flexible(
                                        child: _buildInfoChip(
                                          context,
                                          enrollment.batch.name,
                                          Icons.groups,
                                          isSelected,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            if (isSelected)
                              Icon(Icons.check_circle,
                                  color: colorScheme.primary)
                            else
                              Icon(Icons.circle_outlined,
                                  color: colorScheme.outline),
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

  void _showDaySelectionSheet(BuildContext context) {
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
                Icon(Icons.calendar_today, color: colorScheme.primary),
                const SizedBox(width: AppSpacing.smd),
                Text(
                  'Select Day',
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Divider(color: colorScheme.outlineVariant),

          // Day Grid
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: AppSpacing.sm,
                crossAxisSpacing: AppSpacing.sm,
                childAspectRatio: 1.2,
              ),
              itemCount: _days.length,
              itemBuilder: (context, index) {
                final day = _days[index];
                final isSelected = day['value'] == _selectedDay;

                return InkWell(
                  onTap: () {
                    setState(() => _selectedDay = day['value']);
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
                          _formatDayName(day['value']).substring(0, 3),
                          style: textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: isSelected
                                ? colorScheme.primary
                                : colorScheme.onSurface,
                          ),
                        ),
                        if (isSelected) ...[
                          const SizedBox(height: 4),
                          Icon(
                            Icons.check_circle,
                            size: 16,
                            color: colorScheme.primary,
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: AppSpacing.md),
        ],
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
          Flexible(
            child: Text(
              text,
              style: textTheme.labelSmall?.copyWith(
                color: isSelected
                    ? colorScheme.primary
                    : colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  String _formatDayName(String day) {
    return day[0].toUpperCase() + day.substring(1).toLowerCase();
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

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
      if (_selectedEnrollmentId == null) {
        SnackbarUtils.showError(context, 'Please select an enrollment');
        setState(() => _isSubmitting = false);
        return;
      }

      final enrollmentsAsync = ref.read(myEnrollmentsProvider);
      final selectedEnrollment = enrollmentsAsync.value?.firstWhere(
        (e) => e.id == _selectedEnrollmentId,
      );

      if (selectedEnrollment == null) {
        SnackbarUtils.showError(context, 'Invalid enrollment selected');
        setState(() => _isSubmitting = false);
        return;
      }

      final request = CreateTimetableEntryRequest(
        enrollmentId: _selectedEnrollmentId!,
        batchId: selectedEnrollment.batch.id,
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
          isEditing ? 'Timetable entry updated!' : 'Timetable entry created!',
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
