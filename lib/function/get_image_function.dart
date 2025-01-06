// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path/path.dart';

// Future<String?> getImage({
//   required ImageSource source,
//   required BuildContext context,
// }) async {
//   log('conttext : ${!context.mounted}');
//   final ImagePicker picker = ImagePicker();
//   XFile? imageGallery;
//   String? name;

//   try {
//     imageGallery = await picker.pickImage(source: source);
//     if (imageGallery != null) {
//       name = imageGallery.path;
    
//       return name;
      
//     } else {
//       log('null');
//     }
//   } on PlatformException catch (e) {
//     if (e.code == 'no_available_camera') {
//       debugPrint('No camera found on device');
//     }
//   }

//   return null;
// }
