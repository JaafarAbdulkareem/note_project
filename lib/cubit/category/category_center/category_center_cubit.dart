import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_application/core/curd.dart';
import 'package:note_application/cubit/category/category_center/category_center_state.dart';
import 'package:note_application/cubit/data_center/data_center_cubit.dart';
import 'package:note_application/models/category/category_model.dart';

class CategoryCenterCubit extends Cubit<CategoryCenterState> with Curd {
  CategoryCenterCubit() : super(CategoryCenterState());
  static List<CategoryModel> data = DataCenterCubit.dataCenter;
  static String? image;

  void changeNoteNumber(int index, int noNote) {
    CategoryCenterCubit.data[index].noNote = noNote;
    emit(CategoryCenterState());
  }
}
