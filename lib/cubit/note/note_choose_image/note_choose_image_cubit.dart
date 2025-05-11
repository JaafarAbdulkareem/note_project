import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:note_application/constant/langauage_keys.dart';
import 'package:note_application/cubit/note/note_choose_image/note_choose_image_state.dart';

class NoteChooseImageCubit extends Cubit<NoteChooseImageState> {
  NoteChooseImageCubit() : super(InitialNoteChooseImageState());
  static String? imagePath;
  Future<void> chooseImage({
    required ImageSource source,
    required BuildContext context,
  }) async {
    final ImagePicker picker = ImagePicker();
    XFile? image;
    String? name;
    try {
      emit(LoadingNoteChooseImageState());
      image = await picker.pickImage(source: source);
      if (image != null) {
        name = image.path;
        imagePath = name;
        emit(SuccessedNoteChooseImageState());
        // return name;
      }
      //else {
      // emit(ErrorNoteChooseImageState(
      //     errorMessage: LanguageKeys.errorForUser));
      // log('null');
      // }o
    } on PlatformException catch (_) {
      // if (e.code == 'no_available_camera') {
      //   debugPrint('No camera found on device');
      // } else if (e.code == 'PERMISSION_DENIED') {
      //   debugPrint("Permission denied. Please grant camera/gallery access.");
      // } else {
      //   debugPrint("An error occurred: ${e.message}");
      // }
      // emit(ErrorNoteChooseImageState(errorMessage: e.code));
      emit(ErrorNoteChooseImageState(errorMessage: LanguageKeys.errorForUser));
    } catch (e) {
      emit(ErrorNoteChooseImageState(errorMessage: LanguageKeys.errorForUser));
    }

    // return null;
  }
}
