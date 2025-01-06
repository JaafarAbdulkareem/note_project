import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:note_application/constant/api_constant.dart';
import 'package:note_application/cubit/note/note_choose_image/note_choose_image_cubit.dart';
import 'package:note_application/screen/widget/custom_image_empty_widget.dart';

class CustomNoteImageWidget extends StatelessWidget {
  const CustomNoteImageWidget({super.key, required this.image});
  final String? image;
  @override
  Widget build(BuildContext context) {
    if (image == null) {
      if (NoteChooseImageCubit.imagePath == null) {
        return const CustomImageEmptyWidget();
      } else {
        return CustomImageEmptyWidget(
          child: Image.file(
            File(NoteChooseImageCubit.imagePath!),
            fit: BoxFit.fill,
          ),
        );
      }
    } else {
      if (NoteChooseImageCubit.imagePath == null) {
        return
        //  CachedNetworkImage(
        //   imageUrl: ConstantImageApiPath.imagePath + image!,
        //   progressIndicatorBuilder: (context, url, downloadProgress) =>
        //       CircularProgressIndicator(value: downloadProgress.progress),
        //   errorListener: (value) {
        //     return;
        //   },
        //   errorWidget: (context, url, error) => const Icon(Icons.error),
        // );
        CustomImageEmptyWidget(
          child: Image.network(
            ConstantImageApiPath.imagePath + image!,
            fit: BoxFit.fill,
          ),
        );
      } else {
        return CustomImageEmptyWidget(
          child: Image.file(
            File(NoteChooseImageCubit.imagePath!),
            fit: BoxFit.fill,
          ),
        );
      }
    }
  }
}
