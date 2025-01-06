import 'package:note_application/constant/app_image.dart';
import 'package:note_application/constant/map_constant.dart';

getIndexImage(String imageUrl) {
  for (int i = 0; i < AppListImage.imageCategory.length; i++) {
    if (AppListImage.imageCategory[i][ConstantMapImage.image] == imageUrl) {
      return i; // Return the index if the image matches
    }
  }
  return -1; // Return -1 if the image is not found
}
