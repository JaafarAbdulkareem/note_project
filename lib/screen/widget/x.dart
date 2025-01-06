

// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:note_application/constant/string_constant.dart';
// import 'package:note_application/cubit/category/delete_category/delete_category_cubit.dart';
// import 'package:note_application/cubit/category/delete_category/delete_category_state.dart';
// import 'package:note_application/function/flashbar_function.dart';
// import 'package:note_application/screen/category/home_category/home_category_screen.dart';
// import 'package:note_application/screen/companded/customer_circular_progress_widget.dart';

// class X extends StatelessWidget {
//   const X({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<DeleteCategoryCubit, DeleteCategoryState>(
//       listener: (context, state) {
//         log("statt : $state");
//         if (state is SuccessedDeleteCategoryState) {
//           Navigator.of(context)
//               .pushNamedAndRemoveUntil(HomeCategoryScreen.id, (route) => false);
//         } else if (state is ErrorDeleteCategoryState) {
//           flashBar(
//             title: LanguageKeys.alertTitle.tr(context),
//             message: state.errorMessage.tr(context),
//           );
//         }
//       },
//       builder: (context, state) {
//         log("builder : $state");
//       return const CustomerCircularProgressWidget();
//       },
//     );
//   }
// }
