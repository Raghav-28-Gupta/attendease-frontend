import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/config/theme/app_spacing.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../../../../core/widgets/error_widget.dart';
import '../../../../../core/widgets/empty_state_widget.dart';
import '../../../subject/presentation/providers/subject_provider.dart';
import '../providers/enrollment_provider.dart';

class EnrollmentsScreen extends ConsumerWidget {
  const EnrollmentsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subjectsAsync = ref.watch(subjectsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Subject Enrollments'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.invalidate(subjectsProvider);
            },
          ),
        ],
      ),
      body: subjectsAsync.when(
        data: (subjects) {
          if (subjects.isEmpty) {
            return EmptyStateWidget(
              message: 'No subjects created yet',
              icon: Icons.book_outlined,
              actionText: 'Create Subject',
              onAction: () => context.push('/teacher/subjects/create'),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(AppSpacing.md),
            itemCount: subjects.length,
            itemBuilder: (context, index) {
              final subject = subjects[index];
              return _SubjectEnrollmentCard(
                subjectId: subject.id,
                subjectCode: subject.code,
                subjectName: subject.name,
                semester: subject.semester,
              );
            },
          );
        },
        loading: () => const LoadingWidget(message: 'Loading subjects...'),
        error: (err, _) => AppErrorWidget(
          message: err.toString(),
          onRetry: () => ref.invalidate(subjectsProvider),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/teacher/enrollments/create'),
        icon: const Icon(Icons.add),
        label: const Text('Enroll Batches'),
      ),
    );
  }
}

class _SubjectEnrollmentCard extends ConsumerWidget {
  final String subjectId;
  final String subjectCode;
  final String subjectName;
  final String semester;

  const _SubjectEnrollmentCard({
    required this.subjectId,
    required this.subjectCode,
    required this.subjectName,
    required this.semester,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final enrollmentsAsync = ref.watch(subjectEnrollmentsProvider(subjectId));

    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.smd),
      child: ExpansionTile(
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(8),
          ),
          child:
              Icon(Icons.book_outlined, color: colorScheme.onPrimaryContainer),
        ),
        title: Text(
          subjectName,
          style: textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text('$subjectCode • Sem $semester'),
        children: [
          enrollmentsAsync.when(
            data: (enrollments) {
              if (enrollments.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: Text(
                    'No batches enrolled yet',
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                );
              }

              return Column(
                children: enrollments.map((enrollment) {
                  return ListTile(
                    leading: Icon(
                      Icons.school_outlined,
                      size: 20,
                      color: colorScheme.onSurfaceVariant,
                    ),
                    title: Text(enrollment.batch.name),
                    subtitle: Text(
                      '${enrollment.batch.code} • ${enrollment.batch.academicYear}',
                    ),
                    trailing: IconButton(
                      icon:
                          Icon(Icons.delete_outline, color: colorScheme.error),
                      onPressed: () async {
                        final confirmed = await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            icon: Icon(Icons.warning_amber_outlined,
                                color: colorScheme.error),
                            title: const Text('Unenroll Batch'),
                            content: const Text(
                              'Are you sure you want to remove this batch from the subject?',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: const Text('Cancel'),
                              ),
                              FilledButton(
                                style: FilledButton.styleFrom(
                                  backgroundColor: colorScheme.error,
                                  foregroundColor: colorScheme.onError,
                                ),
                                onPressed: () => Navigator.pop(context, true),
                                child: const Text('Unenroll'),
                              ),
                            ],
                          ),
                        );

                        if (confirmed == true) {
                          final success = await ref
                              .read(enrollmentOpsProvider.notifier)
                              .deleteEnrollment(enrollment.id, subjectId);

                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  success
                                      ? 'Batch unenrolled successfully'
                                      : 'Failed to unenroll batch',
                                ),
                              ),
                            );
                          }
                        }
                      },
                    ),
                  );
                }).toList(),
              );
            },
            loading: () => const Padding(
              padding: EdgeInsets.all(AppSpacing.md),
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (err, _) => Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Text(
                'Error: $err',
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.error,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
