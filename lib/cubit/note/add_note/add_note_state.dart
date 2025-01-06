abstract class AddNoteState {}

class InitialAddNoteState extends AddNoteState {}

class LoadingAddNoteState extends AddNoteState {}

class SuccessedAddNoteState extends AddNoteState {}

class ErrorAddNoteState extends AddNoteState {
  final String errorMessage;
  ErrorAddNoteState({required this.errorMessage});
}
