abstract class AddCategoryState {}

class InitialAddCategoryState extends AddCategoryState {}

class LoadingAddCategoryState extends AddCategoryState {}

class SuccessedAddCategoryState extends AddCategoryState {}

class ErrorAddCategoryState extends AddCategoryState {
  final String errorMessage;
  ErrorAddCategoryState({required this.errorMessage});
}
