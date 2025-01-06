abstract class EditNoteState {}

class InitialEditNoteState extends EditNoteState {}

class LoadingEditNoteState extends EditNoteState {}

class SuccessedEditNoteState extends EditNoteState {}

class ErrorEditNoteState extends EditNoteState {
  final String errorMessage;
  ErrorEditNoteState({required this.errorMessage});
}
