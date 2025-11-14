import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/student_dashboard_model.dart';

part 'dashboard_state.freezed.dart';

@freezed
class StudentDashboardState with _$StudentDashboardState {
  const factory StudentDashboardState.initial() = Initial;
  const factory StudentDashboardState.loading() = Loading;
  const factory StudentDashboardState.loaded(StudentDashboardModel data) = Loaded;
  const factory StudentDashboardState.error(String message) = Error;
}
