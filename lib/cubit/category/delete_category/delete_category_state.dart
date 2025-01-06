abstract class DeleteCategoryState {}

class InitialDeleteCategoryState extends DeleteCategoryState {}

// class LoadingDeleteCategoryState extends DeleteCategoryState {}

class SuccessedDeleteCategoryState extends DeleteCategoryState {}

class ErrorDeleteCategoryState extends DeleteCategoryState {
  final String errorMessage;
  ErrorDeleteCategoryState({required this.errorMessage});
}
