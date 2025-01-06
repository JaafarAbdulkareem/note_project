abstract class NoteChooseImageState {}

class InitialNoteChooseImageState extends NoteChooseImageState {}

class LoadingNoteChooseImageState extends NoteChooseImageState {}

class SuccessedNoteChooseImageState extends NoteChooseImageState {}

class ErrorNoteChooseImageState extends NoteChooseImageState {
  final String errorMessage;
  ErrorNoteChooseImageState({required this.errorMessage});
}
