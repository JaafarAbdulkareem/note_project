// import 'dart:developer';

// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:note_application/constant/api_constant.dart';
// import 'package:note_application/constant/message_constant.dart';
// import 'package:note_application/core/curd.dart';
// import 'package:note_application/cubit/category/category_center/category_center_cubit.dart';
// import 'package:note_application/cubit/category/delete_category/delete_category_state.dart';

// class DeleteCategoryCubit extends Cubit<DeleteCategoryState> with Curd {
//   DeleteCategoryCubit() : super(InitialDeleteCategoryState());
//   int? indexDelete;
//   // late int idToDatabase;
//   void deleteCategory() {
//     log("${CategoryCenterCubit.data[indexDelete!].id} : index : $indexDelete");
//     // emit(LoadingDeleteCategoryState());
//     int idToDatabase = CategoryCenterCubit.data[indexDelete!].id;
//     CategoryCenterCubit.data.removeAt(indexDelete!);
//     _deleteToDatabase(idToDatabase);
//     log("111111");
//      emit(SuccessedDeleteCategoryState());
//     log("2222222222");
//   }

//   Future<void> _deleteToDatabase(int idToDatabase) async {
//     var response = await postRequest(
//       url: ConstantCategoryApiPath.deleteCategoryPath,
//       body: {
//         ConstantCategoryApi.id: idToDatabase.toString(),
//       },
//     );

//     if (response != null) {
//       if (response[ConstantResultApi.status] == ConstantResultApi.success) {
//         emit(SuccessedDeleteCategoryState());
//       } else {
//         emit(ErrorDeleteCategoryState(
//             errorMessage: ConstantMessageApiDatabase.errorForUser));
//         // debugPrint(
//         // "${ConstantMessageApiDatabase.errorCatch} : CATEGORY DELETE : ${ConstantMessageApiDatabase.responseNull}");
//       }
//     } else {
//       debugPrint(
//           "${ConstantMessageApiDatabase.errorCatch} : CATEGORY DELETE : ${ConstantMessageApiDatabase.responseNull}");
//       emit(ErrorDeleteCategoryState(
//           errorMessage: ConstantMessageApiDatabase.errorForUser));
//     }
//   }
// }
