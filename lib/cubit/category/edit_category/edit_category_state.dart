abstract class EditCategoryState {}

class InitialEditCategoryState extends EditCategoryState {}

class LoadingEditCategoryState extends EditCategoryState {}

class SuccessedEditCategoryState extends EditCategoryState {}

class ErrorEditCategoryState extends EditCategoryState {
  final String errorMessage;
  ErrorEditCategoryState({required this.errorMessage});
}
