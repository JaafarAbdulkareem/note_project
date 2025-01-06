abstract class DataCenterState {}

class InitialDataCenterState extends DataCenterState {}

class LoadingDataCenterState extends DataCenterState {}

class SuccessedDataCenterState extends DataCenterState {}

class ErrorDataCenterState extends DataCenterState {
  final String errorMessage;
  ErrorDataCenterState({required this.errorMessage});
}
