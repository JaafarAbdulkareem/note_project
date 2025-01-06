// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:note_application/cubit/note/note_choose_image/note_choose_image_cubit.dart';
// import 'package:note_application/cubit/note/note_choose_image/note_choose_image_state.dart';
// import 'package:note_application/function/respponsive_text_function.dart';
// import 'package:note_application/screen/widget/custom_image_empty_widget.dart';

// class CustomAddImageWidget extends StatelessWidget {
//   const CustomAddImageWidget({
//     super.key,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<NoteChooseImageCubit, NoteChooseImageState>(
//         builder: (context, state) {
//       // if (state is LoadingNoteChooseImageState) {
//       //   return const AspectRatio(
//       //     aspectRatio: 1,
//       //     child: CustomerCircularProgressWidget(),
//       //   );
//       // } else
//       if (state is SuccessedNoteChooseImageState) {
//         return Padding(
//           padding: EdgeInsets.all(getResponsiveText(context, fontSize: 4)),
//           child: NoteChooseImageCubit.imagePath == null
//               ? const CustomImageEmptyWidget()
//               : Image.file(
//                   File(NoteChooseImageCubit.imagePath!),
//                   // fit: BoxFit.fill,
//                 ),
//         );
//       }

//       return const CustomImageEmptyWidget();
//     });
//   }
// }
