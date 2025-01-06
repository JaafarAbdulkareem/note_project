import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_application/constant/app_image.dart';
import 'package:note_application/constant/map_constant.dart';
import 'package:note_application/cubit/category/category_center/category_center_cubit.dart';
import 'package:note_application/cubit/category/category_choose_image/category_choose_image_state.dart';

class CategoryChooseImageCubit extends Cubit<CategoryChooseImageState> {
  CategoryChooseImageCubit() : super(CategoryChooseImageState());
  static int? indexImage;
  void refresh(int index) {
    indexImage = index;
   CategoryCenterCubit.image = AppListImage
        .imageCategory[CategoryChooseImageCubit.indexImage!][ConstantMapImage.image];
    emit(CategoryChooseImageState());
  }
}
