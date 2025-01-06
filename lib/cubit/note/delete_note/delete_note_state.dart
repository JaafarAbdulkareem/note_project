abstract class DeleteNoteState {}

class LoadingDeleteNoteState extends DeleteNoteState {}

class RefreshDeleteNoteState extends DeleteNoteState {}

class ErrorDeleteNoteState extends DeleteNoteState {
  final String errorMessage;
  ErrorDeleteNoteState({required this.errorMessage});
}
